<?php
include_once (EXT_LIB_ROOT . 'BtcTools.php');

class CronAction extends TransationSupport
{

    private $btctool;

    function __construct()
    {
        $this->btctool = new BtcTools();
    }

    public function getOne($conditions)
    {
        $user = ModelTransform::toCustomModel($this->dao->getOne($conditions, null, true), 'AddressMultiaddrs');
        if ($user && ! $user->getAvatar()) {
            $user->setAvatar(User::AVATAR_DEFAULT);
        }
        return $user;
    }

    public function cron()
    {
        while (true) {
            try {
                try {
                    // 更新收款钱包交易列表
                    // NodeHelper.UpdateTransactions(litecoinHp, 10, 0); // 查10条最好
                } catch (Exception $exc) {
                    // Logger.Info("UpdateTransactions_充值心跳", exc.Message);
                }
                
                try {
                    // 更新0确认交易，用户充值更新
                    NodeHelper . UpdateUserDeposit(litecoinHp);
                } catch (Exception $exc) {
                    // Logger.Info("UpdateUserDeposit_充值心跳", exc.Message);
                }
                
                // 更新所有充值没有6个确认的交易号 -- 确认号
                NodeHelper . UpdateUserDepositToConf(litecoinHp);
                
                // SystemTT.Invested_New = DM.GetInvested_New(); // 更新实际投资金额
                
                Thread . Sleep(1000 * 10); // 10秒更新一次
            } catch (Exception $exc) {
                // Logger.Info("begingQueues_Work充值心跳", exc.Message);
            }
        }
    }

    private function UpdateTransactions($count = 10, $from = 0)
    {
        $transactions = $this->btctool->getTransactions($count, $from);
        if ($transactions != null && $transactions != "") {
            foreach ($transactions as $key => $value) {
                try {
                    if ($value['amount'] < 0) {
                        continue;
                    }
                    $this->beginTransation();
                    if (DM . GetAddressMultiaddr(result . txid, result . address) == null) {
                        new TbAddressMultiaddr
                        {
                            Category = result.category,
                            Account = result.account,
                            Fee = new decimal?(result.fee),
                            Blockhash = result.blockhash,
                            Blockindex = new int?(result.blockindex),
                            MTime = new long?((long)result.time),
                            Txid = result.txid,
                            Blocktime = new long?((long)result.blocktime),
                            Amount = result.amount,
                            Confirmations = result.confirmations,
                            Timereceived = new long?((long)result.timereceived),
                            Address = result.address,
                            IsLoad = UpdateTxsIsLoad(result.txid, result.address),
                            IsExist = UpdateTxsIsExist(result.txid, result.address)
                        }.Save();
                    }
                    $this->commit();
                } catch (Exception $exception) {
                    $this->rollBack();
                }
            }
        }
    }
}

?>