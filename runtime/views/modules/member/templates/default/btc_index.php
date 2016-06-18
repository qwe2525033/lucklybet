<?php include_once('E:\phpWork\lucklybet\runtime/views\./templates/default\header.php');?>
<script type="text/javascript" src="/res/js/uploadify/swfobject.js"></script>
<script type="text/javascript" src="/res/js/uploadify/jquery.uploadify.v2.1.4.min.js"></script>
	<div class="setting_body">
		<div class="caption">我的莱特币</div>
        <ul class="nav nav-tabs" id="setting_tab">
        	<li><a href="/member/recharge/withdrawHistory/">提现记录</a></li>	
	        <li><a href="/member/recharge/history/">充值记录</a></li>			
			<li><a href="/member/btc/io/">收支明细</a></li>
	        <li class="active"><a href="/member/btc/">我的莱特币</a></li>			
        </ul>
        
        <div class="tab-content setting_list">
			<div class="tab-pane active">
				<div class="mybtc">
					<p class="mybtcinfo">当前可用莱特币为：<span><?php echo $user->getAvailableBtc(); ?></span>, 冻结莱特币为：<span><?php echo $user->getFreezeBtc(); ?></span></p>
					<a class="btn btn-success paybtn"  href="/member/recharge/index/" id="btc_recharge" onclick="ajaxmenu(event, this.id, 1)">充 值</a>&nbsp; &nbsp; <a class="btn btn-success paybtn"  href="/member/recharge/withdraw/" id="btc_withdraw" onclick="ajaxmenu(event, this.id, 1)">提现</a>
				</div>

				<!--table class="table mlist">
				<thead>
					<tr><th colspan="2">奖励莱特币的方式</th></tr>
				</thead>
				<tbody>
			        <tr>
						<td class="c">
			        		<p>通过个人推广链接推广：</p>
							<span class="c9">邀请到用户注册 +<?php echo get_config('integral_invite')?> 积分，如果该用户充值，充值莱特币的<?php echo R::getConfig()->getConfig('recharge_inviter_reward') * 100 ?>%系统赠送给您。同时该用户为您的永久下线，您享受该用户每次充值莱特币总额<?php echo R::getConfig()->getConfig('recharge_inviter_reward') * 100 ?>%的系统奖励。</span>
						</td>
			        </tr>
			        <tr>
						<td class="c">
			        		<p>你的专属推广链接：</p>
							<span class="c9"><?php echo get_config('site_url')?><?php echo url("/member/login/?yqcode=$yqcode") ?></span>
						</td>
			        </tr>
				</tbody>
		        </table-->
	        </div>
        </div>
	</div>
<?php include_once('E:\phpWork\lucklybet\runtime/views\./templates/default\footer.php');?>