<?php

/**
 * @author blueyb.java@gmail.com
 * @since 1.0 2012-12-23
 * 
 */
class UserWithdraw extends DynamicModelTransformSupport
{

    private $id;

    private $userid;

    private $towalletaddress;

    private $confirmations;

    private $amount;

    private $txid;

    private $txisok;

    private $addtime;

    private $adminuserid;

    private $admininfo;

    private $adminipv4;

    private $status;

    /**
     *
     * @return $id
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     *
     * @return $userid
     */
    public function getUserid()
    {
        return $this->userid;
    }

    /**
     *
     * @return $towalletaddress
     */
    public function getTowalletaddress()
    {
        return $this->towalletaddress;
    }

    /**
     *
     * @return $confirmations
     */
    public function getConfirmations()
    {
        return $this->confirmations;
    }

    /**
     *
     * @return $amount
     */
    public function getAmount()
    {
        return $this->amount;
    }

    /**
     *
     * @return $txid
     */
    public function getTxid()
    {
        return $this->txid;
    }

    /**
     *
     * @return $txisok
     */
    public function getTxisok()
    {
        return $this->txisok;
    }

    /**
     *
     * @return $addtime
     */
    public function getAddtime()
    {
        return $this->addtime;
    }

    /**
     *
     * @return $adminuserid
     */
    public function getAdminuserid()
    {
        return $this->adminuserid;
    }

    /**
     *
     * @return $admininfo
     */
    public function getAdmininfo()
    {
        return $this->admininfo;
    }

    /**
     *
     * @return $adminipv4
     */
    public function getAdminipv4()
    {
        return $this->adminipv4;
    }

    /**
     *
     * @return $status
     */
    public function getStatus()
    {
        return $this->status;
    }

    /**
     *
     * @param
     *            !CodeTemplates.settercomment.paramtagcontent!
     */
    public function setId($id)
    {
        $this->id = $id;
    }

    /**
     *
     * @param
     *            !CodeTemplates.settercomment.paramtagcontent!
     */
    public function setUserid($userid)
    {
        $this->userid = $userid;
    }

    /**
     *
     * @param
     *            !CodeTemplates.settercomment.paramtagcontent!
     */
    public function setTowalletaddress($towalletaddress)
    {
        $this->towalletaddress = $towalletaddress;
    }

    /**
     *
     * @param
     *            !CodeTemplates.settercomment.paramtagcontent!
     */
    public function setConfirmations($confirmations)
    {
        $this->confirmations = $confirmations;
    }

    /**
     *
     * @param
     *            !CodeTemplates.settercomment.paramtagcontent!
     */
    public function setAmount($amount)
    {
        $this->amount = $amount;
    }

    /**
     *
     * @param
     *            !CodeTemplates.settercomment.paramtagcontent!
     */
    public function setTxid($txid)
    {
        $this->txid = $txid;
    }

    /**
     *
     * @param
     *            !CodeTemplates.settercomment.paramtagcontent!
     */
    public function setTxisok($txisok)
    {
        $this->txisok = $txisok;
    }

    /**
     *
     * @param
     *            !CodeTemplates.settercomment.paramtagcontent!
     */
    public function setAddtime($addtime)
    {
        $this->addtime = $addtime;
    }

    /**
     *
     * @param
     *            !CodeTemplates.settercomment.paramtagcontent!
     */
    public function setAdminuserid($adminuserid)
    {
        $this->adminuserid = $adminuserid;
    }

    /**
     *
     * @param
     *            !CodeTemplates.settercomment.paramtagcontent!
     */
    public function setAdmininfo($admininfo)
    {
        $this->admininfo = $admininfo;
    }

    /**
     *
     * @param
     *            !CodeTemplates.settercomment.paramtagcontent!
     */
    public function setAdminipv4($adminipv4)
    {
        $this->adminipv4 = $adminipv4;
    }

    /**
     *
     * @param
     *            !CodeTemplates.settercomment.paramtagcontent!
     */
    public function setStatus($status)
    {
        $this->status = $status;
    }
}
?>