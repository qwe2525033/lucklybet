<?php

/**
 * 管理员
 * @author blueyb.java@gmail.com
 * @since 1.0 2012-12-16
 * 
 */
class AddressMultiaddrs extends DynamicModelTransformSupport
{

    private $id;

    private $category;

    private $account;

    private $fee;

    private $blockhash;

    private $blockindex;

    private $mtime;

    private $txid;

    private $blocktime;

    private $amount;

    private $confirmations;

    private $timereceived;

    private $address;

    private $isload;

    private $isexist;

    private $info;

    /**
     *
     * @return $info
     */
    public function getInfo()
    {
        return $this->info;
    }

    /**
     *
     * @param
     *            !CodeTemplates.settercomment.paramtagcontent!
     */
    public function setInfo($info)
    {
        $this->info = $info;
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
     * @param
     *            !CodeTemplates.settercomment.paramtagcontent!
     */
    public function setTxid($txid)
    {
        $this->txid = $txid;
    }

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
     * @return $category
     */
    public function getCategory()
    {
        return $this->category;
    }

    /**
     *
     * @return $account
     */
    public function getAccount()
    {
        return $this->account;
    }

    /**
     *
     * @return $fee
     */
    public function getFee()
    {
        return $this->fee;
    }

    /**
     *
     * @return $blockhash
     */
    public function getBlockhash()
    {
        return $this->blockhash;
    }

    /**
     *
     * @return $blockindex
     */
    public function getBlockindex()
    {
        return $this->blockindex;
    }

    /**
     *
     * @return $mtime
     */
    public function getMtime()
    {
        return $this->mtime;
    }

    /**
     *
     * @return $blocktime
     */
    public function getBlocktime()
    {
        return $this->blocktime;
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
     * @return $confirmations
     */
    public function getConfirmations()
    {
        return $this->confirmations;
    }

    /**
     *
     * @return $timereceived
     */
    public function getTimereceived()
    {
        return $this->timereceived;
    }

    /**
     *
     * @return $address
     */
    public function getAddress()
    {
        return $this->address;
    }

    /**
     *
     * @return $isload
     */
    public function getIsload()
    {
        return $this->isload;
    }

    /**
     *
     * @return $isexist
     */
    public function getIsexist()
    {
        return $this->isexist;
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
    public function setCategory($category)
    {
        $this->category = $category;
    }

    /**
     *
     * @param
     *            !CodeTemplates.settercomment.paramtagcontent!
     */
    public function setAccount($account)
    {
        $this->account = $account;
    }

    /**
     *
     * @param
     *            !CodeTemplates.settercomment.paramtagcontent!
     */
    public function setFee($fee)
    {
        $this->fee = $fee;
    }

    /**
     *
     * @param
     *            !CodeTemplates.settercomment.paramtagcontent!
     */
    public function setBlockhash($blockhash)
    {
        $this->blockhash = $blockhash;
    }

    /**
     *
     * @param
     *            !CodeTemplates.settercomment.paramtagcontent!
     */
    public function setBlockindex($blockindex)
    {
        $this->blockindex = $blockindex;
    }

    /**
     *
     * @param
     *            !CodeTemplates.settercomment.paramtagcontent!
     */
    public function setMtime($mtime)
    {
        $this->mtime = $mtime;
    }

    /**
     *
     * @param
     *            !CodeTemplates.settercomment.paramtagcontent!
     */
    public function setBlocktime($blocktime)
    {
        $this->blocktime = $blocktime;
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
    public function setConfirmations($confirmations)
    {
        $this->confirmations = $confirmations;
    }

    /**
     *
     * @param
     *            !CodeTemplates.settercomment.paramtagcontent!
     */
    public function setTimereceived($timereceived)
    {
        $this->timereceived = $timereceived;
    }

    /**
     *
     * @param
     *            !CodeTemplates.settercomment.paramtagcontent!
     */
    public function setAddress($address)
    {
        $this->address = $address;
    }

    /**
     *
     * @param
     *            !CodeTemplates.settercomment.paramtagcontent!
     */
    public function setIsload($isload)
    {
        $this->isload = $isload;
    }

    /**
     *
     * @param
     *            !CodeTemplates.settercomment.paramtagcontent!
     */
    public function setIsexist($isexist)
    {
        $this->isexist = $isexist;
    }
}
?>