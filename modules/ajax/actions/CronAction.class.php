<?php
include_once (EXT_LIB_ROOT . 'BtcTools.php');

/**
 * 后台首页Action
 *
 * @author blueyb.java@gmail.com
 * @since 1.0 2012-07-31
 */
class CronAction extends CommonAction
{

    private $btctool;

    private $addressMultiaddrs;

    private $user;

    private $userDeposit;

    function __construct()
    {
        $this->addressMultiaddrs = MD('AddressMultiaddrs');
        $this->user = MD('User');
        $this->userDeposit = MD('UserDeposit');
        $this->btctool = new BtcTools();
    }

    /**
     * 开启事务
     *
     * @return
     *
     */
    private function beginTransation()
    {
        $db = R::getDB();
        return $db->query("BEGIN");
    }

    /**
     * 提交事务
     *
     * @return
     *
     */
    private function commit()
    {
        $db = R::getDB();
        return $db->query("COMMIT");
    }

    /**
     * 回滚事务
     *
     * @return
     *
     */
    private function rollBack()
    {
        $db = R::getDB();
        return $db->query("ROLLBACK");
    }

    private function getAddressMultiaddr($txid, $address)
    {
        return $this->addressMultiaddrs->getOne(" 1 and txid='" . $txid . "' and address='" . $address . "'");
    }

    private function addAddressMultiaddrs($model)
    {
        $this->addressMultiaddrs->add($model);
    }

    private function updateAddressMultiaddrs($model)
    {
        $this->addressMultiaddrs->update($model, $model['id']);
    }

    private function update($model)
    {
        $this->addressMultiaddrs->update($model, $model['id']);
    }

    private function updateTxsIsLoad($address)
    {
        return $this->user->getOne(" 1 and btc_address ='" . $address . "'");
    }

    private function getUserForAddr($address)
    {
        return $this->user->getOne(" 1 and btc_address ='" . $address . "'");
    }

    private function updateUser($model)
    {
        return $this->user->update($model, $model['id']);
    }

    private function updateTxsIsExist($txid, $address)
    {
        return $this->userDeposit->getOne(" 1 and txid='" . $txid . "' and wallet_address='" . $address . "'");
    }

    private function addUserDeposit($model)
    {
        return $this->userDeposit->add($model);
    }

    private function getAddressMultiaddrsForIsExist2()
    {
        return $this->addressMultiaddrs->gets(" 1 and is_exist = false and is_load = true");
    }

    private function getUserDepositForTxAndAddress($txid, $address)
    {
        return $this->userDeposit->getOne(" 1 and txid='" . $txid . "' and wallet_address='" . $address . "'");
    }

    private function getUserDepositForIsConf6()
    {
        return $this->userDeposit->gets(" 1 and confirmations < 6");
    }
    
    // ==========================================================
    public function getCron(HttpRequest $request)
    {
        try {
            try {
                // 更新收款钱包交易列表
                $this->UpdateTransactions(10, 0); // 查10条最好
            } catch (Exception $exc) {
                // Logger.Info("UpdateTransactions_充值心跳", exc.Message);
            }
            
            try {
                // 更新0确认交易，用户充值更新
                $this->UpdateUserDeposit();
            } catch (Exception $exc) {
                // Logger.Info("UpdateUserDeposit_充值心跳", exc.Message);
            }
            
            // 更新所有充值没有6个确认的交易号 -- 确认号
            $this->updateUserDepositToConf();
            
            // SystemTT.Invested_New = DM.GetInvested_New(); // 更新实际投资金额
        } catch (Exception $exc) {
            // Logger.Info("begingQueues_Work充值心跳", exc.Message);
        }
    }

    private function updateUserDepositToConf()
    {
        $list = $this->getUserDepositForIsConf6();
        foreach ($list as $deposit) {
            try {
                if ($deposit['confirmations'] < 6) {
                    // 获取一条交易信息
                    $txinfo = $this->btctool->getTxinfo($deposit['txid']);
                    
                    if ($txinfo != null && count($txinfo->details) > 0 && $txinfo->confirmations > $deposit['confirmations']) {
                        $deposit['confirmations'] = $txinfo->confirmations;
                        $this->UpdateUserDeposit($deposit);
                        
                        $ms = $this->getAddressMultiaddr($deposit['txid'], $deposit['wallet_address']);
                        
                        if ($ms != null) {
                            $ms['confirmations'] = $txinfo->confirmations;
                            $this->updateAddressMultiaddrs(ms);
                        }
                    }
                }
            } catch (Exception $e) {}
        }
    }

    private function UpdateUserDeposit()
    {
        $list = $this->getAddressMultiaddrsForIsExist2();
        foreach ($list as $value) {
            try {
                if ($value['is_load']) {
                    if ($value['category'] != "receive") {
                        $value['info'] = "数据有异常";
                        $this->update($value);
                    } else {
                        $txinfo = $this->btctool->getTxinfo($value['txid']);
                        if ($txinfo != null && $txinfo != null && count($txinfo->details) > 0 && $txinfo->confirmations >= 1) {
                            if (count($txinfo->details) > 1) {
                                $is_receive = true;
                                foreach ($txinfo->details as $details) {
                                    if ($details->category != "receive" || $details->amount < 0) {
                                        $is_receive = false;
                                        continue; // 不让充值 （测试一下）
                                    }
                                }
                                if ($is_receive == false) {
                                    continue;
                                } // 不让充值 （测试一下）
                            }
                            foreach ($txinfo->details as $details) {
                                if ($details->category != "receive") {
                                    $value['info'] = "站内转站内 - " + $details->category; // 自己发送给自己，会存在这现象，但不影响充值。
                                    $this->update($value);
                                } else 
                                    if ($this->getUserDepositForTxAndAddress($value['txid'], $value['address']) == null) {
                                        $this->beginTransation();
                                        $userForAddr = $this->getUserForAddr($value['address']);
                                        if (userForAddr != null) {
                                            $deposit = new UserDeposit();
                                            $deposit->setUserid($userForAddr['id']);
                                            $deposit->setWalletaddress($details->address);
                                            $deposit->setConfirmations($txinfo->confirmations);
                                            $deposit->setAmount($details->amount);
                                            $deposit->setTxid($txinfo->txid);
                                            $deposit->setTxisok(true);
                                            $deposit->setAddtime(date("Y-m-d H:i:s", time()));
                                            $depositId = $this->addUserDeposit($deposit);
                                            
                                            if ($depositId > 0) {
                                                $addressMultiaddr = $this->getAddressMultiaddr($value['txid'], $details->address);
                                                if ($addressMultiaddr != null && $addressMultiaddr['txid'] == $value['txid']) {
                                                    $addressMultiaddr['confirmations'] = $txinfo->confirmations;
                                                    $addressMultiaddr['is_exist'] = true;
                                                    $this->updateaddressMultiaddrs($addressMultiaddr);
                                                    
                                                    $userForAddr['available_btc'] = $userForAddr['available_btc'] + $details->amount;
                                                    $this->updateUser($userForAddr);
                                                }
                                            }
                                            
                                            $this->commit();
                                        }
                                    }
                            }
                        }
                    }
                }
            } catch (Exception $e) {
                $this->rollBack();
            }
        }
    }

    private function UpdateTransactions($count = 10, $from = 0)
    {
        $transactions = $this->btctool->getTransactions($count, $from);
        var_dump($transactions);
        if ($transactions != null && $transactions != "") {
            foreach ($transactions as $key => $value) {
                try {
                    if ($value->amount < 0) {
                        continue;
                    }
                    $this->beginTransation();
                    $condition = "txid = '" . $value->txid . "' and wallet_address = '" . $value->address . "'";
                    if ($this->getAddressMultiaddr($value->txid, $value->address) == null) {
                        // 添加纪录
                        $model = new AddressMultiaddrs();
                        $model->setCategory($value->category);
                        $model->setAccount($value->account);
                        $model->setFee($value->fee);
                        $model->setBlockhash($value->blockhash);
                        $model->setBlockindex($value->blockindex);
                        $model->setMtime($value->time);
                        $model->setTxid($value->txid);
                        $model->setBlocktime($value->blocktime);
                        $model->setAmount($value->amount);
                        $model->setConfirmations($value->confirmations);
                        $model->setTimereceived($value->timereceived);
                        $model->setAddress($value->address);
                        $model->setIsload($this->updateTxsIsLoad($value->address));
                        $model->setIsexist($this->updateTxsIsExist($value->txid, $value->address));
                        
                        $this->addAddressMultiaddrs($model);
                    }
                    $this->commit();
                } catch (Exception $exception) {
                    echo '查询交易失败';
                    $this->rollBack();
                }
            }
        }
    }
}

?>