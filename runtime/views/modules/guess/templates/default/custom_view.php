<?php include_once('E:\phpWork\lucklybet\runtime/views\./templates/default\header.php');?>
<script type="text/javascript" src="http://localhost/res/js/jquery/jquery.scrollTo.min.js"></script>
<script type="text/javascript" src="http://localhost/res/js/play.js"></script>
	<div class="read_body">
		<div class="left">
			<div class="alink">当前位置：<a href="/">首页</a> > <a href="/guess/list/">竞猜</a> > 
			<?php if($rootCategory){ ?>
			<a href="<?php echo url("/guess/list/?cateid=$rootCategory[id]") ?>"><?php echo $rootCategory[name]; ?></a> > <?php echo $subCategory[name]; ?>
			<?php }else{ ?>
			自定义
			<?php } ?>
			</div>
			<div class="content">
			<form id="ajaxform" name="ajaxform" action="/guess/play/custom/?inajax=1" method="post">
				<div class="title">
					
					<div class="fbtn">
						<?php if($guessIsFollow){ ?>
						<a class="btn"  href="/guess/follow/cancel/?id=<?php echo $guess->getId(); ?>" id="guess_follow_cancel_<?php echo $guess->getId(); ?>" onclick="ajaxmenu(event, this.id, 1)">取消关注</a>
						<?php }else{ ?>
						<a class="btn"  href="/guess/follow/index/?id=<?php echo $guess->getId(); ?>" id="guess_follow_<?php echo $guess->getId(); ?>" onclick="ajaxmenu(event, this.id, 1)">关注竞猜</a>
						<?php } ?>
						<a class="btn"  href="/member/share/index/?id=<?php echo $guess->getId(); ?>" id="guess_share_<?php echo $guess->getId(); ?>" onclick="ajaxmenu(event, this.id, 1)">分享竞猜</a>
					</div>
					
					<?php echo $guess->getTitle(); ?>					
				</div>
				<div class="t">
					<div class="t1">竞猜时间：<?php echo date('Y年m月d日 H：i', $guess->getPlayStartTime())?> — <?php echo date('Y年m月d日 H：i', $guess->getPlayDeadline())?> </div>
				</div>
				<div class="t">
					<div class="t1">下注形式：<?php echo $guess->getCustomType(); ?> </div>					
				</div>
				<div class="t" >
					<div style="float:right;width: 530px;line-height:40px;"><?php echo $guess->getSummary(); ?></div>
					<div style="float:left;width: 60px;line-height:40px;">竞猜说明：</div>
				</div>				
				<div class="clear"></div>
				<div id="play_lists"></div>
				<div class="playtype">自定义玩法(<a target="_blank" href="/news/list/">查看说明</a>)</div>
				<div class="h">
					<div class="w1">竞猜结果</div>
					<div class="w2" style="text-align:center;">投注人数</div>
					<div class="w2" style="text-align:center;">我的投注</div>
				</div>
				<?php $parameter = $guess->getParameter(); ?>
				<?php if($play)$playData = $play->getFirstPlayData(); ?>
				<?php foreach($parameter->getOptions() as $option){ ?>
				<div <?php if($guess->getStatus() == Guess::STATUS_END && $parameter->getValue() != '' && $parameter->getValue() == $option->getValue()){ ?>class="d choose"<?php }else{ ?>class="d"<?php } ?>>
					<div class="w1"><?php echo $option->getLabel(); ?></div>
					<div class="w2" style="text-align:center;"><?php if($play){ ?><?php echo $option->getPlayCount(); ?><?php }else{ ?>参与后显示<?php } ?></div>
					<div class="w2" style="text-align:center;"><input <?php if($play){ ?>onclick="return false;"<?php } ?> <?php if($playData && $option->getValue() == $playData->getChoose()){ ?>checked<?php } ?> type="radio" name="<?php echo $parameter->getName(); ?>" value="<?php echo $option->getValue(); ?>"/> </div>
				</div>
				<?php } ?>
				<div class="d tc">
					当前参与人数：<b><?php echo $guess->getPlayCount(); ?></b>人
				</div>
				
				<?php if($user->getId() != $guess->getUserId() && $guess->justFriendCanPlay() && !$isFollow){ ?>
				
				<?php }elseif($guess->isPlaying() && !$play){ ?>
				<div class="cbox">
					<label class="checkbox">
						<input type="checkbox" value="1" name="agree"> 我已阅读并且同意《 OK竞猜竞猜平台声明 》
					</label>
				</div>
				<div class="post">
					<input type="hidden" name="id" value="<?php echo $guess->getId(); ?>">
					<input type="submit" class="btn btn-primary" value="我要竞猜" onclick="return ajaxPostForm('ajaxform', '', 'postFormHandle', '1000', '__ajaxform')"/>
					<span class="ajaxform_tip" id="__ajaxform"></span>
				</div>
				<?php } ?>
				</form>
			</div>
			
			<!-- UY BEGIN -->
			<div id="uyan_frame" style="margin-top: 30px;"></div>
			<script type="text/javascript" id="UYScript" src="http://v1.uyan.cc/js/iframe.js?UYUserId=0" async=""></script>
			<!-- UY END -->				
			
		</div>
		
		<div class="right">
			<div class="ulist zz">
				<div class="content">	
					<?php $makers = $guess->getUser(); ?>
					<div class="userinfo">
						<img src="<?php echo $makers->getAvatar(); ?>" />
						<span class="username">发布庄家: <a href="<?php echo url("/member/space/?uid={$makers->getId()}") ?>"><?php echo $makers->getName(); ?></a></span>
						<span class="address">
						<?php if(!$makers->getProvince() && !$makers->getCity()){ ?>
							地址不详
						<?php }else{ ?>
							<?php echo $makers->getProvince(); ?><?php echo $makers->getCity(); ?>
						<?php } ?>
						</span>
						<span class="sign"><?php echo $makers->getSign(); ?></span>
					</div>
					
					<div class="guessinfo">	
					
						<ul>
							<li class="i1">
								<?php if($guess->getStatus() == Guess::STATUS_WAITING_RUDGE){ ?>
									<span class="bg-red">判定中</span>
								<?php }elseif($guess->getStatus() == Guess::STATUS_END){ ?>
									<span class="bg-red">已结束</span>
								<?php }elseif($guess->getStatus() == Guess::STATUS_CLOSE){ ?>
									<span class="bg-red">已关闭</span>
								<?php }elseif($guess->getStatus() == Guess::STATUS_WAITING_CKECK){ ?>
									<span class="bg-red">审核中</span>
								<?php }elseif($guess->getPlayDeadline() < time()){ ?>
									<span class="bg-red">已截止</span>
								<?php }else{ ?>
									<span class="bg-green">投注中</span>
								<?php } ?>
								投注状态
							</li>
							<li class="i2">
								<span>
								<?php if($guess->getPlayDeadline() < time()){ ?>
									-
								<?php }else{ ?>
									<?php if($guessDay){ ?><?php echo $guessDay; ?>天<?php } ?><?php echo $guessHour; ?>小时<?php echo $guessMinute; ?>分钟
								<?php } ?>
								</span>								
								距离结束
							</li>
							<li class="i3">
								<span><?php echo $guess->getplayCount(); ?>人</span>
								参与人数
							</li>
							<li class="i4">
								<span>-</span>
								投注总额
							</li>
						</ul>
					
					</div>
					
					
					<div class="bottom">
						<a href="/member/friend/add/?uid=<?php echo $makers->getId(); ?>" cancel="0" class="btn btn-primary" onclick="ajaxmenu(event, this.id, 1, 2000)" id="follow_add_<?php echo $makers->getId(); ?>" class="btn btn-primary">加好友</a> &nbsp;&nbsp;&nbsp;&nbsp;
						<a href="/member/message/send/?uid=<?php echo $makers->getId(); ?>" id="message_send_<?php echo $makers->getId(); ?>" onclick="ajaxmenu(event, this.id, 1)" class="btn btn-primary">站内信</a>
					</div>
				</div>
			</div>		
			
			<div class="ulist">
				<div class="title">最新竞猜用户</div>
					<?php include_once('E:\phpWork\lucklybet\runtime/views\./templates/default\users_list_box.php');?>
			</div>
		</div>
		
		<div class="clear"></div>
	</div>
	<script type="text/javascript">
	<!--
	<?php foreach($guess->getPlayDatas() as $playData){ ?>
		var playData = new PlayData();
		playData.setId('<?php echo $playData->getId(); ?>');
		playData.setName('<?php echo $playData->getName(); ?>');
		GuessPlayHelper.addPlayData(playData);
	<?php } ?>
	//-->
	</script>

<?php include_once('E:\phpWork\lucklybet\runtime/views\./templates/default\footer.php');?>