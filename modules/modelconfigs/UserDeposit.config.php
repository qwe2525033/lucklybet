<?php

/**
 * 用户配置
 * @author blueyb.java@gmail.com
 */
return array(
    'orm' => array(
        'table' => 'yyx_user_deposit',
        'pk' => 'id',
        'map' => array(
            'id' => 'id',
            'userid' => 'user_id',
            'walletaddress' => 'wallet_address',
            'confirmations' => 'confirmations',
            'amount' => 'amount',
            'txid' => 'txid',
            'txisok' => 'tx_is_ok',
            'addtime' => 'add_time',
            'adminuserid' => 'admin_user_id',
            'admininfo' => 'admin_info',
            'adminipv4' => 'admin_ipv4'
        )
    ),
    'rule' => array()
);