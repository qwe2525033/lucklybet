<form style="margin:0px;" method="post" id="ajaxform" name="ajaxform" action="/member/message/send/?" enctype="multipart/form-data">
<h1>发私信</h1>
<a href="javascript:hideMenu();" title="关闭" class="float_del">关闭</a>
<div class="popupmenu_inner" style="padding:20px;">
		<div class="modal-body" style="padding:0px;">
				
				<div class="control-group">
					<label for="username">收件人</label>
					<div class="controls">
						<input type="text" id="name" class="span3" name="name" value="<?php echo $toUser['name']; ?>">
					</div>
				</div>
				
				<div class="control-group">
					<label for="msgcontent">内容</label>
					<div class="controls">
						 <textarea style="width: 400px; height: 100px;" name="content"></textarea>
					</div>
				</div>
				
				<div class="control-group">
					<label for="yzcode">验证码</label>
					<div class="controls">
						<input type="text" id="code" class="span2" name="code">
						<img src="/ajax/verify/image/" id="image" alt="点击重新获取" title="点击重新获取" onclick="showVerificationCode('image')">
					</div>
				</div>																		
				
			</div>

</div>

<div class="modal-footer">
	<span class="ajaxform_tip" id="__ajaxform"></span>
	<input type="hidden" name="uid" value="<?php echo $toUserId; ?>">
	<input type="submit" class="btn btn-primary submit" value="发送信息" onclick="return ajaxPostForm('ajaxform', '', 'postFormHandle', '1000', '__ajaxform')"/>
</div>

</form>