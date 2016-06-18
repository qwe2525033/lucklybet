<?php if(!$hidePlacard){ ?>
<script type="text/javascript" src="/res/js/jquery/jquery.cookie.js"></script>
<div class="notice" id="notice">
	<a class="close" data-dismiss="alert" href="javascript:;" onclick="closePlacard();">&times;</a>
	<div class="notice_title">OK竞猜公告</div>
	<div class="notice_content"><?php echo get_config('placard')?></div>
</div>
<?php } ?>