<?php

class BtcTools
{

    private static $api_urls;

    private static $api_account;

    private static $api_password;

    function __construct()
    {
        if ($this->api_urls == null) {
            $configService = CommonServiceFactory::getConfigService();
            
            $this->api_urls = $configService->get('chongzhi_url');
            $this->api_account = $configService->get('chongzhi_account');
            $this->api_password = $configService->get('chongzhi_password');
        }
    }

    function getNewAddressOne($uid)
    {
        $url = $this->api_urls . "/Api.aspx?action=api_getnewaddr&uid=" . $uid . "&rid=108&account=" . $this->api_account . "&accountpass=" . $this->api_password;
        // echo $url;
        $result = file_get_contents($url);
        $address = json_decode($result);
        if ($address && $address->code == 0) {
            return $address->result;
        } else {
            return "";
        }
    }

    function getTransactions($count, $from)
    {
        $url = $this->api_urls . "/Api.aspx?action=api_listtransactions&count=" . $count . "&from=" . $from . "&account=" . $this->api_account . "&accountpass=" . $this->api_password;
        // echo $url;
        $result = file_get_contents($url);
        $address = json_decode($result);
        if ($address && $address->code == 0) {
            return $address->result;
        } else {
            return "";
        }
    }

    function getTxinfo($txid)
    {
        $url = $this->api_urls . "/Api.aspx?action=api_gettransaction&tx=" . $txid . "&account=" . $this->api_account . "&accountpass=" . $this->api_password;
        // echo $url;
        $result = file_get_contents($url);
        $address = json_decode($result);
        if ($address && $address->code == 0) {
            return $address->result;
        } else {
            return "";
        }
    }
}

?>