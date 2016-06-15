<form class="form-horizontal" style="margin:0px;" method="post" id="ajaxform" name="ajaxform" action="/guess/guessPoint/insert/?">
<input type="hidden" name="m_cate_id" id="m_cate_id" value="<?php echo $cateId; ?>"/>
<input type="hidden" name="m_status" id="m_status" value="1"/>
<h1>添加竞猜点</h1>
<a href="javascript:hideMenu();" title="关闭" class="float_del">关闭</a>
<div class="popupmenu_inner" id="wfModal" style="padding:20px;width:800px;">
		<div class="modal-body" style="padding-left: 20px;max-height: 1000px;">
			<div class="control-group">
				<dl class="dl-horizontal" style="margin-top: 0px;">
					<dt>竞猜点标题：</dt>
					<dd class="c9">
						<input type="text" name="m_title" id="m_title" value=""/>			
					</dd>
					<dt>参与截止时间：</dt>
					<dd class="c9">
						<input type="text" class="txt Wdate" name="m_play_deadline"  onClick="WdatePicker({'dateFmt':'yyyy-MM-dd HH:mm' })"/>
					</dd>
					<dt>竞猜点参数：</dt>
					<dd class="c9">
						竞猜点的参数通常是指被竞猜的对象，如足球的竞猜参数就是两支队伍，财经或者彩票的开盘号码等等。注意:财经与彩票类竞猜只需填写一个任意参数，详细参数系统会自动生成
						<!--&nbsp;<a href="javascript:;" onclick="ParamUtil.addParam()" style="float:right; margin-right:15px;">添加参数</a>-->
						<ul id="params"><?php echo $paramsHtml; ?></ul>
					</dd>
				</dl>
			</div>
		</div>
</div>
<div class="modal-footer">
	<span id="__ajaxform" class="ajaxform_tip" style="color: red;"></span>
	<input type="submit" class="btn btn-primary submit" onclick="return ajaxPostForm('ajaxform', '', 'addAjaxGuessPoint', '1000', '__ajaxform')" value="确定" />
</div>
</form>	