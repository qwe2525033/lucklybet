<?php include_once('E:\phpWork\lucklybet\runtime/views\modules/admin\templates/default\header.php');?>
<script type="text/javascript">
<!--
	function allInputChecked(checkInput, parentId){
    	var checked = $(checkInput).attr('checked');
    	$('input', '#'+parentId).attr('checked', checked);
	}
//-->
</script>
<div class="KK_ManageList_content">
    <?php include_once('E:\phpWork\lucklybet\runtime/views\modules/admin\templates/default\menu.php');?>
    <div class="KK_ManageList_mainRt_side right">
        <div class="KK_ManageList_mainbox_top"></div>
        <div class="KK_ManageList_mainbox">
            <div class="KK_ManageList_mainbox_inner">
                <div class="KK_ManageList_position">当前位置&gt;&gt; 管理员管理 &gt;&gt; 分配管理组权限</div>
                <h3>
	                <span class="right" style="margin-right: 15px;">
	                    <a href="<?php echo $index_url; ?>" style="float: right;">返回列表</a>
	                </span>
                </h3>
                <div style="padding:8px;">当前的管理组为:<span style="color:red"><?php echo $item['name']; ?></span>，请为它分配权限</div>
                <div class="KK_content_list2_tab">
                    <ul class="tab">
                    	<?php $index = 0; ?>
                        <?php foreach($operations as $group=>$actions){ ?>
                        <?php $index += 1 ?>
                        <li id="tabone<?php echo $index; ?>" onmouseover="setTab('tabone','<?php echo $index; ?>',<?php echo $groupCount; ?>);" <?php if($index == 1){ ?>class="hover"<?php } ?>><?php echo $group; ?></li>
                        <?php } ?>
                    </ul>
                </div>
                <form action="<?php echo $act_url; ?>updatePermission" method="post">
                    <div class="KK_content_list2_con marginTop10">
                        <div class="KK_content_list2_table">
                        	<?php $index = 0; ?>
                            <?php foreach($operations as $group=>$actions){ ?>
                            	<?php $index += 1 ?>
                                <div id="con_tabone_<?php echo $index; ?>" <?php if($index == 1){ ?>class="hover"<?php }else{ ?>style="display:none;"<?php } ?>>
                                    <table>
                                        <colgroup>
                                            <col style="width:17%;" />
                                            <col style="width:83%;" />
                                        </colgroup>
                                        <?php foreach($actions as $actionKey=>$action){ ?>
                                                <tr>
                                                    <td class="name" style="color:red;">
                                                    <input type="checkbox" onclick="allInputChecked(this, '<?php echo $actionKey; ?>')">
                                                    <?php echo $action['name']; ?>：
                                                    </td>
                                                    <td class="cot" id="<?php echo $actionKey; ?>">
                                                        <?php foreach($action['methods'] as $method=>$methodName){ ?>
                                                        	<?php $key = "admin@$actionKey@$method" ?>
                                                        	<input type="checkbox" name="<?php echo $key; ?>" <?php if($item['permissions'][$key]){ ?>checked<?php } ?>><?php echo $methodName; ?>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                        <?php } ?>
                                                    </td>
                                                </tr>
                                        <?php } ?>
                                    </table>
                                    <table>
                                        <colgroup>
                                            <col style="width:17%;" />
                                            <col style="width:83%;" />
                                        </colgroup>
                                        <tr>
                                            <td class="name">&nbsp;</td>
                                            <td class="cot">&nbsp;
                                            	<input type="hidden" name="id" value="<?php echo $item['id']; ?>">
                                                <input type="submit" class="btn" value="保  存"/>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            <?php } ?>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <div class="KK_ManageList_mainbox_bot"></div>
    </div>
    <div class="clear"></div>
</div>

<?php include_once('E:\phpWork\lucklybet\runtime/views\modules/admin\templates/default\footer.php');?>