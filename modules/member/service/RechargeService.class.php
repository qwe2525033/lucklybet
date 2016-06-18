<?php

/**
 * 充值服务接口实现
 * 
 * @author blueyb.java@gmail.com
 * @since 1.0 - Jan 23, 2013
 */
class RechargeService extends TransationSupport implements IRechargeService
{

    /**
     * 充值编码前缀
     *
     * @var string
     */
    private static $snPrefix = 'RC';

    /**
     *
     * @var ModelDao
     */
    private $dao = null;

    public function __construct()
    {
        $this->dao = MD('Recharge');
    }

    /**
     *
     * @see IRechargeService::count()
     */
    public function count($conditions)
    {
        return $this->dao->count($conditions);
    }

    /**
     *
     * @see IRechargeService::createSn()
     */
    public function createSn()
    {
        return self::$snPrefix . date('YmdHis');
    }

    /**
     *
     * @see IRechargeService::get()
     */
    public function get($id)
    {
        return $this->dao->get($id);
    }

    /**
     *
     * @see IRechargeService::getBySn()
     */
    public function getBySn($sn)
    {
        return $this->dao->getOne("`sn`='{$sn}'");
    }

    /**
     *
     * @see IRechargeService::gets()
     */
    public function gets($conditions, $orders, $page, $perpage)
    {
        if (! $orders) {
            $orders = array(
                'create_time' => 'desc'
            );
        }
        return $this->dao->gets($conditions, null, $orders, $page, $perpage);
    }

    /**
     *
     * @see IRechargeService::getUserRecharges()
     */
    public function getUserRecharges($userId, $page, $perpage)
    {
        $conditions = array(
            'user_id' => $userId
        );
        $this->gets($conditions, null, $page, $perpage);
    }

    public function withdraw($userid, $address, $amount)
    {
        try {
            $this->beginTransation();
            $userDao = MD('User');
            $userWithdrawDao = MD('UserWithdraw');
            $user = $userDao->getOne(" 1 and id=" . $userid);
            $withdraw = new UserWithdraw();
            $withdraw->setUserid($user['id']);
            $withdraw->setTowalletaddress($address);
            $withdraw->setAmount($amount);
            $withdraw->setAddtime(date("Y-m-d H:i:s", time()));
            $user['available_btc'] = ($user['available_btc'] - $amount);
            $userWithdrawDao->add($withdraw);
            $userDao->update($user, $userid);
            
            $this->commit();
            return true;
        } catch (Exception $e) {
            $this->rollBack();
            return false;
        }
    }

    /**
     *
     * @see IRechargeService::pay()
     */
    public function pay($user, $recharge)
    {
        try {
            // 给用户充值莱特币
            $this->beginTransation();
            $io = array(
                'to_user_id' => $recharge['user_id'],
                'from_user_id' => 0,
                'to_title' => "充值[{$recharge['sn']}]",
                'wealth_type' => Io::WEALTH_TYPE_MONEY,
                'wealth' => $recharge['btc'],
                'to_balance' => $user['available_btc'] + $recharge['btc']
            );
            $userService = MemberServiceFactory::getUserService();
            if (! $userService->btc($io)) {
                $this->rollBack();
                return false;
            }
            // 更新充值状态到成功
            if (! $this->dao->update(array(
                'status' => '1',
                $recharge['id']
            ))) {
                $this->rollBack();
                return false;
            }
            $userLink = NoticeService::makeUserLink(array(
                'id' => $user['id'],
                'name' => $user['name']
            ));
            // 邀请赠送
            $inviteDao = MD('Invite');
            $invite = $inviteDao->getOne(array(
                'invitee_id' => $user['id']
            ));
            if ($invite) {
                $reward = floatval($recharge['btc'] * $invite['recharge_percent']);
                if ($reward) {
                    $inviter = $userService->get($invite['inviter_id']);
                    if ($inviter) {
                        $io = array(
                            'to_user_id' => 0,
                            'from_user_id' => $inviter->getId(),
                            'to_title' => "充值提成，邀请的用户{$userLink}充值了[{$recharge['btc']}]莱特币",
                            'wealth_type' => Io::WEALTH_TYPE_MONEY,
                            'wealth' => $reward,
                            'to_balance' => $inviter->getAvailableBtc() + $reward
                        );
                        if (! $userService->btc($io)) {
                            $this->rollBack();
                            return false;
                        }
                    }
                }
            }
            $this->commit();
            return true;
        } catch (Exception $e) {
            $this->rollBack();
        }
    }

    /**
     *
     * @see IRechargeService::recharge()
     */
    public function recharge($recharge)
    {
        return $this->dao->add($recharge);
    }
}

?>