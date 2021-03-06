<?php if($guesses){ ?>
<?php foreach($guesses as $item){ ?>

<?php if($item[cate_id] != 0){ ?>
	<?php $parentId = $guessCategory[$item[cate_id]]['parent_id']; ?>
	<?php if($parentId == 0) $categoryId = $item[cate_id]; else $categoryId = $parentId; ?>		
	<?php $categoryName = $guessCategory[$categoryId]['name']; ?>
<?php } ?>

<div class="guessitem">
<p class="c">
	<?php if($item[cate_id] != 0){ ?>
	<a href="/guess/list/?cateid=<?php echo $categoryId; ?>">[<?php echo $categoryName; ?>]</a>
	<?php }else{ ?>
	<a href="/guess/list/?cateid=0&custom=1">[自定义]</a>
	<?php } ?>
	<a href="<?php echo url("/guess/view/?id=$item[id]") ?>"><?php echo $item[title]; ?></a>
</p>
<p class="t"><span>竞猜时间：</span><?php echo date('Y年m月d日H:i', $item['play_start_time'])?> － <?php echo date('Y年m月d日H:i', $item['play_deadline'])?></p>
<p class="t"><span>发布庄家：</span><a href="<?php echo url("/member/space/?uid=$item[user_id]") ?>"><?php echo $_USERS[$item[user_id]]['name']; ?></a></p>
<p class="t"><span>竞猜玩法：</span></p>
<ul class="g">
	<?php if($item['play_datas']){ ?>
	<?php foreach($item['play_datas'] as $playWayData){ ?>
	<li><?php echo $playWayData->getName(); ?></li>
	<?php } ?>
	<?php }else{ ?>
	<li>自定义玩法</li>
	<?php } ?>
</ul>
<p class="r">
	<?php if($item['odds_type'] == 3){ ?>
	<!--
	<img src="/res/images/f1.gif" /> &nbsp;&nbsp;
	<img src="/res/images/f2.gif" />
	-->
	<span class="label label-success">浮动赔率</span>
	<span class="label label-important">固定赔率</span>
	<?php }elseif($item['odds_type'] == 2){ ?>
	<span class="label label-success">浮动赔率</span>
	<!-- <img src="/res/images/f1.gif" /> -->
	<?php }elseif($item['odds_type'] == 1){ ?>
	<!-- <img src="/res/images/f2.gif" /> -->
	<span class="label label-important">固定赔率</span>
	<?php } ?>
</p>
<div class="rinfo">
	<p class="user">参与人数</p>
	<p class="val"><?php echo $item['play_count']; ?></p>
	<?php if($item['custom']){ ?>
	<p class="tab">自定义</p>
	<?php }else{ ?>
	<p class="tab">投注<?php if($item['wealth_type'] == Guess::WEALTH_TYPE_MONEY){ ?>莱特币<?php }else{ ?>积分<?php } ?></p>
	<p class="val"><?php echo $item['play_wealth']; ?></p>
	<?php } ?>
	
</div>
</div>
<?php } ?>
<?php }else{ ?>
<div>暂无信息</div>
<?php } ?>