<?php

/**
 * 用户配置
 * @author blueyb.java@gmail.com
 */
return array(
    'orm' => array(
        'table' => 'yyx_address_multiaddrs',
        'pk' => 'id',
        'map' => array(
            'id' => 'id',
            'category' => 'category',
            'account' => 'account',
            'fee' => 'fee',
            'blockhash' => 'blockhash',
            'blockindex' => 'blockindex',
            'mtime' => 'm_time',
            'txid' => 'txid',
            'blocktime' => 'blocktime',
            'amount' => 'amount',
            'confirmations' => 'confirmations',
            'timereceived' => 'timereceived',
            'address' => 'address',
            'isload' => 'is_load',
            'isexist' => 'is_exist',
            'info' => 'info'
        )
    ),
    'rule' => array()
);