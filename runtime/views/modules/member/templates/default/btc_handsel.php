<form style="margin:0px;" method="post" id="ajaxform" name="ajaxform" action="/member/btc/handsel/?" enctype="multipart/form-data">
<h1>比特币赠送</h1>
<a href="javascript:hideMenu();" title="关闭" class="float_del">关闭</a>
<div class="popupmenu_inner" style="padding:20px; width:300px;">
	
	<div class="modal-body" style="padding:0px;">
			
			<div class="control-group">
				<label for="username">用户名</label>
				<div class="controls">
					<input type="text" id="name" class="span3" name="name" value="<?php echo $toUser['name']; ?>">
				</div>
			</div>
			
			<div class="control-group">
				<label for="msgcontent">赠送比特币</label>
				<div class="controls">
					 <input type="text" class="span3" name="btc" value="10">
				</div>
			</div>
			
		</div>

</div>

<div class="modal-footer">
	<span class="ajaxform_tip" id="__ajaxform"></span>
	<input type="hidden" name="uid" value="<?php echo $toUser['id']; ?>">
	<input type="submit" class="btn btn-primary submit" value="赠送" onclick="return ajaxPostForm('ajaxform', '', 'postFormHandle', '1000', '__ajaxform')"/>
</div>
</form>