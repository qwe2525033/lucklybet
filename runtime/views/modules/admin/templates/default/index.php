<?php include_once('E:\phpWork\lucklybet\runtime/views\modules/admin\templates/default\header.php');?>
<div class="wrapper960">
	<div class="KK_ManageIndex_mainbox">
    	<div class="KK_ManageIndex_mainbox_inner">
        	<div class="KK_ManageIndex_logo">
        	<?php echo get_config('site_name')?>管理系统
        	<!-- 
        	<img src="http://localhost/res/images/admin/logo.png" />
        	 -->
        	</div>
            <div class="KK_ManageIndex_nav">
            	<ul class="KK_ManageIndex_list">
                    <li id="o1" jqkey="0"><a href="/admin/guess/">
                    	<dl class="pic"><img src="http://localhost/res/images/admin/icon/li_bg6.png" /></dl>
                        <dl class="btn">竞猜管理</dl></a>
                    </li>
                    <li id="o2" jqkey="1"><a href="/admin/user/">
                    	<dl class="pic"><img src="http://localhost/res/images/admin/icon/li_bg2.png" /></dl>
                        <dl class="btn">用户管理</dl></a>
                    </li>
                    <li id="o3" jqkey="2"><a href="/admin/exchange/">
                    	<dl class="pic"><img src="http://localhost/res/images/admin/icon/li_bg4.png" /></dl>
                        <dl class="btn">商城管理</dl></a>
                    </li>
                    <li id="o5" jqkey="4"><a href="/admin/user/">
                    	<dl class="pic"><img src="http://localhost/res/images/admin/icon/li_bg2.png" /></dl>
                        <dl class="btn">管理员管理</dl></a>
                    </li>
                    <li id="o4" jqkey="3"><a href="/admin/config/">
                    	<dl class="pic"><img src="http://localhost/res/images/admin/icon/li_bg.png" /></dl>
                        <dl class="btn">系统管理</dl></a>
                    </li>
                    <li id="o6" jqkey="5"><a href="/admin/news/">
                    	<dl class="pic"><img src="http://localhost/res/images/admin/icon/li_bg4.png" /></dl>
                        <dl class="btn">资讯管理</dl></a>
                    </li>
                </ul>
            </div>
        </div>
    </div>	
</div>

<script type="text/javascript">
jq(document).ready(function(){
	jq(".KK_ManageIndex_list").find("li").each(function(){
		fei(jq(this));
	});
});

function fei(obj){
var t=0,v=0.004,m=500,opacity=0,k=0,xv=0,yv=0,n=0;

var o=document.getElementById(obj.attr("id"));
o.style.opacity = 0;
k = obj.attr("jqkey");

n=Math.floor(Math.random()*2-1)==0?1:-1;
xv=n * Math.random();
n=Math.floor(Math.random()*2-1)==0?1:-1;
xy=n * Math.random();
n=Math.floor(Math.random()*2-1)==0?1:-1;
var timeid = setInterval(function(){
	if(0.04 * (m - t)<5)
	{
		t = t + 5;
	}
	else{
		t = t + 0.04 * (m - t);
	}
	if(n==1){
		x=(k%3)*120+(m-t)*Math.sin(t*v+xv);
		y=parseInt(k/3)*100+(m-t)*Math.cos(t*v+yv);
	}else{
		x=(k%3)*120+(t-m)*Math.cos(t*v+xv);
		y=parseInt(k/3)*100+(t-m)*Math.sin(t*v+yv);
	}
	opacity+=0.02;
	
    o.style.left=x+'px';
	o.style.top=y+'px';
	o.style.opacity=opacity;
	
	if(Math.abs(t-m)<5){
		o.style.left=(k%3)*120+'px';
		o.style.top=parseInt(k/3)*100+'px';
		o.style.opacity = 1;
		clearInterval(timeid);
	}
},10);
}
</script>
<?php include_once('E:\phpWork\lucklybet\runtime/views\modules/admin\templates/default\footer.php');?>