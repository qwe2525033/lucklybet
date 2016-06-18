<script type="text/javascript" src="/res/js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
<!--
GuessAddHelper.reset();
GuessAddHelper.setUserBtc(<?php echo $user->getAvailableBtc(); ?>);
GuessAddHelper.setUserIntegral(<?php echo $user->getAvailableIntegral(); ?>);
//-->
</script>
<dt>竞猜标题：</dt>
<dd class="c9">
	 <!--input type="text" class="span4" name="title" value="<?php echo $guessPoint->getTitle(); ?>" /-->
	 <input type="text" class="span4" name="title" readonly value="<?php echo $guessPoint->getTitle(); ?>"/>
</dd>
<dt>竞猜截止时间：</dt>
<dd class="c9">
	<?php
	$deadlineFormat = "{'dateFmt':'yyyy-MM-dd HH:mm', 'maxDate':'{$playDeadline }'}";
	?>
	 <input type="text" class="span2 Wdate" name="play_start_time" value="<?php echo date('Y-m-d H:i') ?>" onClick="WdatePicker(<?php echo $deadlineFormat; ?>)"/>&nbsp;-&nbsp;
	 <input type="text" class="span2 Wdate" name="play_deadline" value="<?php echo $recomdedDeadline; ?>" onClick="WdatePicker(<?php echo $deadlineFormat; ?>)"/>
	 <span class="input_tip">最大截止时间为<?php echo $playDeadline; ?></span>
</dd>
<dt>下注形式：</dt>
<dd>
	<label class="radio inline">
		<input type="radio" name="wealth_type" value="<?php echo Guess::WEALTH_TYPE_MONEY ?>" checked="checked" onclick="GuessAddHelper.setWealthType(this.value)"/> 莱特币投注
	</label>
	<!-- label class="radio inline">
		<input type="radio" name="wealth_type" value="<?php echo Guess::WEALTH_TYPE_INTEGRAL ?>" onclick="GuessAddHelper.setWealthType(this.value)"/> 积分投注
	</label-->
</dd>
<dt>玩法：</dt>
<dd>
	
	<select name="playWay" id="playWay">
	<?php foreach($playWays as $playWay){ ?>
		<option value="<?php echo $playWay->getId(); ?>"><?php echo $playWay->getName(); ?></option>
	<?php } ?>
	</select>
	
	<input type="button" class="btn" value="添加玩法" onclick="$get('guess_playway_'+getSelectValue('playWay')).click();" />
	
	<div id="playList" style="margin-top: 5px;">
		<?php foreach($playWays as $playWay){ ?>
		<p id="playinfo_<?php echo $playWay->getId(); ?>" style="display: none;" class="playinfo">
			<span id="play_way_<?php echo $playWay->getId(); ?>"><?php echo $playWay->getName(); ?></span>
			<span>
				<a href="/guess/add/playWay/?pwid=<?php echo $playWay->getId(); ?>&gpid=<?php echo $guessPoint->getId(); ?>" id="guess_playway_<?php echo $playWay->getId(); ?>" onclick="ajaxmenu(event, this.id, 1, 0, 'resetPlayWayData')">编辑</a>
				<a href="javascript:GuessAddHelper.deletePlayWayData(<?php echo $playWay->getId(); ?>)">删除</a>
			</span>
		</p>
		<?php } ?>
	</div>
	
</dd>
<dt>竞猜范围：</dt>
<dd>
	<label class="radio inline">
		<input type="radio" name="play_role" value="0" checked="checked" /> 允许所有会员参与竞猜
	</label>
	<label class="radio inline">
		<input type="radio" name="play_role" value="1" /> 只允许好友参与竞猜
	</label>						
</dd>
<dt>邀请好友参与：</dt>
<dd>
	<label class="radio inline">
		<input type="radio" name="invite_friend" value="1" checked="checked" /> 发送邀请通知
	</label>
	<label class="radio inline">
		<input type="radio" name="invite_friend" value="0" /> 不邀请
	</label>	
</dd>
<dt>竞猜说明：</dt>
<dd>
	<textarea style="width: 380px; height: 100px;" name="summary" placeholder="输入详细描述，必须确保描述清楚Yes和No分别代表的情况！"></textarea>						
</dd>

<dd class="post_btn" id="playWays">
	<input type="submit" class="btn btn-primary savebtn" value="发布竞猜" onclick="return ajaxPostForm('ajaxform', '', 'postFormHandle', '1000', '__ajaxform')"/>
	<span class="ajaxform_tip" id="__ajaxform"></span>
</dd>

