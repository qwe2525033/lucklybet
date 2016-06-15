<?php include_once('E:\phpWork\lucklybet\runtime/views\modules/admin\templates/default\header.php');?>

<div class="KK_ManageList_content">
	<?php include_once('E:\phpWork\lucklybet\runtime/views\modules/admin\templates/default\menu.php');?>
    <div class="KK_ManageList_mainRt_side right">
    	<div class="KK_ManageList_mainbox_top"></div>
        <div class="KK_ManageList_mainbox">
        	<div class="KK_ManageList_mainbox_inner">
            	<div class="KK_ManageList_position">当前位置 &gt;&gt; 管理员管理 &gt;&gt; 管理组</div>
                <h3>
	                <span class="right" style="margin-right: 15px;">
	                    <a href="<?php echo $act_url; ?>add/" style="float: right;">添加</a>
	                </span>
	            </h3>
                    <!-- EasyPHP表格组件开始 -->
<table id="" class="list_table" cellpadding="0" cellspacing="0" border="0">
<thead><tr>
	<th  align='center' class="first"><a href="javascript:sortBy('id','<?php echo $nextsort;?>')" title='click_sort_title'>ID<?php if($order == 'id') echo "<img src='/res/images/{$sort}.gif' align='absmiddle'/>";?></a></th>
	<th  align='center' ><a href="javascript:sortBy('name','<?php echo $nextsort;?>')" title='click_sort_title'>管理组名称<?php if($order == 'name') echo "<img src='/res/images/{$sort}.gif' align='absmiddle'/>";?></a></th>
	<th  align='left' ><a href="javascript:sortBy('summary','<?php echo $nextsort;?>')" title='click_sort_title'>管理组简介<?php if($order == 'summary') echo "<img src='/res/images/{$sort}.gif' align='absmiddle'/>";?></a></th>
	<th  align='left' ><a href="javascript:sortBy('create_time','<?php echo $nextsort;?>')" title='click_sort_title'>创建时间<?php if($order == 'create_time') echo "<img src='/res/images/{$sort}.gif' align='absmiddle'/>";?></a></th>
	<th>操作</th>
</tr></thead>
<tbody>
<?php
foreach($items as $key=>$item){
?>
	<tr>
			<td align='center' class='first'><span><?php echo $item[id] ; ?></span></td>
			<td align='center' ><span class='pointer' onclick=textEdit(this,'<?php echo $item[id] ; ?>','name')><?php echo $item[name] ; ?></span></td>
			<td align='left' ><span class='pointer' onclick=textEdit(this,'<?php echo $item[id] ; ?>','summary')><?php echo $item[summary] ; ?></span></td>
			<td align='left' ><span><?php echo date('Y-m-d H:i:s', "$item[create_time]") ; ?></span></td>
			<td align='center'><a    href='<?php echo $site_url ; ?>/admin/manageGroup/permission/?&id=<?php echo $item[id] ; ?>'>权限设置</a>&nbsp;&nbsp;<a    href='<?php echo $site_url ; ?>/admin/manageGroup/add/?&copyId=<?php echo $item[id] ; ?>'>复制成新组</a>&nbsp;&nbsp;<a  href='<?php echo $act_url ; ?>edit/?id=<?php echo $item[id] ; ?>'>修改</a>&nbsp;&nbsp;<a  href='<?php echo $act_url ; ?>del/?id=<?php echo $item[id] ; ?>' onclick='return opConfirm();'>删除</a>&nbsp;&nbsp;</td>
	</tr>
<?php
}
?>
</tbody></table>
<!-- EasyPHP表格组件结束 -->

				 <?php if($pages){ ?>
					<?php echo $pages; ?>
					<?php } ?>
            </div>
        </div>
        <div class="KK_ManageList_mainbox_bot"></div>
    </div>
    <div class="clear"></div>
</div>

<?php include_once('E:\phpWork\lucklybet\runtime/views\modules/admin\templates/default\footer.php');?>