<?php include_once('E:\phpWork\lucklybet\runtime/views\./templates/default\header.php');?>
<script type="text/javascript" src="/res/js/uploadify/swfobject.js"></script>
<script type="text/javascript" src="/res/js/uploadify/jquery.uploadify.v2.1.4.min.js"></script>
	<div class="setting_body">
		<div class="caption">充值记录</div>
        <ul class="nav nav-tabs" id="setting_tab">
        	<li class="active"><a href="/member/recharge/withdrawHistory/">提现记录</a></li>	
	        <li><a href="/member/recharge/history/">充值记录</a></li>			
			<li><a href="/member/btc/io/">收支明细</a></li>
	        <li><a href="/member/btc/">我的莱特币</a></li>			
        </ul>
        
        <div class="tab-content setting_list">
			<div class="tab-pane active">
				<table class="table mlist table-striped">
				<thead>
					<tr>
						<th width="25%">时间</th>
						<th width="25%">交易号</th>
						<th width="25%">提现金额</th>
						<th width="15%">提现地址</th>
						<th width="10%">提现状态</th>
					</tr>
				</thead>
				<tbody>
				<?php foreach($items as $item){ ?>
			        <tr>
						<td><?php echo $item['add_time']; ?></td>
						<td><a href="http://qukuai.com/ltc/tx/<?php echo $item['txid']; ?>"><?php echo $item['txid']; ?></a></td>
						<td><?php echo $item['amount']; ?></td>	
						<td><?php echo $item['to_wallet_address']; ?></td>						
						<td><?php if($item['status'] == 0 ){ ?>等待提现<?php }elseif($item['status'] == 2){ ?>提现成功<?php }else{ ?>提现失败<?php } ?></td>
			        </tr>
			     <?php } ?>
				</tbody>
		        </table>
		        <?php echo $pages; ?>
	        </div>
        </div>
	</div>
<?php include_once('E:\phpWork\lucklybet\runtime/views\./templates/default\footer.php');?>