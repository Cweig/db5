<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> Index</title>
<meta name="Generator" content="EditPlus">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
</head>
<link href="../css/index.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="jquery-1.2.6.pack.js"></script>
<script type="text/javascript" src="categorys.js"></script>
<SCRIPT defer type=text/javascript>
$(function(){
    showSubCategory();
})
</SCRIPT>
<script>
<!--
function setTab(name,cursel,n){
 for(i=1;i<=n;i++){
  var menu=document.getElementById(name+i);
  var con=document.getElementById("con_"+name+"_"+i);
  menu.className=i==cursel?"hover":"";
  con.style.display=i==cursel?"block":"none";
 }
}
//-->
</script>

<body bgcolor="F8F8FF"  >
<div id="all">
 <div id="top">
   <div id="enter">
    <span>
	   <a href="#">个人登录</a>|
	   <a href="#">商家登录</a>|
	   <a href="#">最近浏览</a>|
	   <a href="#">关于我们</a>|
	   <a href="#">个人免费注册</a>|
	   <a href="#">商家免费注册</a>
   </span>
   </div>
   <div id="search">
     <div id="search_l"><a href="#"><img src="img/logo.png" width="80px" height="80px"/></a></div>
     <div id="search_m">
	   <div class="s1">
	   <input type="text" class="search" />
	   <input type="submit" class="submit" value="查 询"/>
	   <a href="#">高级搜索</a>
	   </div>
	   <div class="s2">热门搜索:
	   <a href="#">手机</a>&nbsp; 
	   <a href="#">女装</a>&nbsp; 
	   <a href="#">内衣</a>&nbsp; 
	   <a href="#">电脑</a>&nbsp; 
	   <a href="#">潮流女包</a>&nbsp; 
	   <a href="#">女性护理</a>&nbsp; 
	   </div>
	 </div>
     <div id="search_r">
	   <a href="#"><img src="../img/shoplist.jpg" class="buy"  width="45px" height="45px"/></a>
	   <a href="#"><img src="../img/collect.jpg" class="collect" width="45px" height="45px"/></a>
	 </div>
   </div>
 </div>
 <div id="nav">
   <div id="nav_top">
     <ul>
	   <li><a href="#">商城首页</a></li>
	   <li><a href="#">服装鞋帽</a></li>
	   <li><a href="#">母婴专区</a></li>
	   <li><a href="#">儿童玩具</a></li>
	   <li><a href="#">家用电器</a></li>
	   <li><a href="#">商城新闻</a></li>
	   <li><a href="#">软件下载</a></li>
	   <li><a href="#">导航分类</a></li>
	 </ul>
   </div>
   <div id="nav_r">
     <div id="AllSort">
      <h3><a href="#">全部商品分类</a></h3>
		<dl id="EFF_dl_0">
		<dt id="EFF_dt_00"><a href="#">手机数码</a></dt>
		<dd class="noDis" id="EFF_dd_00">
		<span><a href="#">洗衣机</a></span>
		<span><a href="#">平板电视</a></span>
		<span><a href="#">电热水器</a></span>
		<span><a href="#">家庭音响</a></span>
		<span><a href="#">燃气热水器</a></span>
		<span><a href="#">空调</a></span>
		<span><a href="#">冰箱</a></span>
		<span><a href="#">冷柜</a></span>
		<span><a href="#">DVD/USB播放器</a></span>
		<span><a href="#">电视附件</a></span></dd>
		<dt id="EFF_dt_01"><a href="#">音乐器材</a></dt>
		<dd class="noDis" id="EFF_dd_01">
		<span><a href="#">吸尘器</a></span>
		<span><a href="#">电熨斗</a></span>
		<span><a href="#">饮水机</a></span>
		<span><a href="#">取暖电器</a></span>
		<span><a href="#">加湿器</a></span>
		<span><a href="#">净化器</a></span>
		<span><a href="#">电动工具</a></span></dd>
		<dt id="EFF_dt_02"><a href="#">电脑办公</a></dt>
		<dd class="noDis" id="EFF_dd_02">
		<span><a href="#">平板电视</a></span>
		<span><a href="#">电热水器</a></span>
		<span><a href="#">家庭音响</a></span>
		<span><a href="#">燃气热水器</a></span>
		<span><a href="#">空调</a></span>
		<span><a href="#">冰箱</a></span>
		<span><a href="#">冷柜</a></span>
		<span><a href="#">DVD/USB播放器</a></span>
		<span><a href="#">电视附件</a></span></dd>
		<dt id="EFF_dt_03"><a href="#">个人化妆</a></dt>
		<dd class="noDis" id="EFF_dd_03">
		<span><a href="#">洗衣机</a></span>
		<span><a href="#">平板电视</a></span>
		<span><a href="#">电热水器</a></span>
		<span><a href="#">家庭音响</a></span>
		<span><a href="#">燃气热水器</a></span>
		<span><a href="#">空调</a></span>
		<span><a href="#">冰箱</a></span>
		<span><a href="#">冷柜</a></span>
		<span><a href="#">DVD/USB播放器</a></span>
		<span><a href="#">电视附件</a></span></dd>
		<dt id="EFF_dt_04"><a href="#">礼品箱包</a></dt>
		<dd class="noDis" id="EFF_dd_04">
		<span><a href="#">吸尘器</a></span>
		<span><a href="#">电熨斗</a></span>
		<span><a href="#">饮水机</a></span>
		<span><a href="#">取暖电器</a></span>
		<span><a href="#">加湿器</a></span>
		<span><a href="#">净化器</a></span>
		<span><a href="#">电动工具</a></span></dd>
		<dt id="EFF_dt_05"><a href="#">服饰鞋帽</a></dt>
		<dd class="noDis" id="EFF_dd_05">
		<span><a href="#">洗衣机</a></span>
		<span><a href="#">平板电视</a></span>
		<span><a href="#">电热水器</a></span>
		<span><a href="#">家庭音响</a></span>
		<span><a href="#">燃气热水器</a></span>
		<span><a href="#">空调</a></span>
		<span><a href="#">冰箱</a></span>
		<span><a href="#">冷柜</a></span>
		<span><a href="#">DVD/USB播放器</a></span>
		<span><a href="#">电视附件</a></span></dd>
		<dt id="EFF_dt_06"><a href="#">运动健康</a></dt>
		<dd class="noDis" id="EFF_dd_06">
		<span><a href="#">吸尘器</a></span>
		<span><a href="#">电熨斗</a></span>
		<span><a href="#">饮水机</a></span>
		<span><a href="#">取暖电器</a></span>
		<span><a href="#">加湿器</a></span>
		<span><a href="#">净化器</a></span>
		<span><a href="#">电动工具</a></span></dd>
		<dt id="EFF_dt_07"><a href="#">家庭家具</a></dt>
		<dd class="noDis" id="EFF_dd_07">
		<span><a href="#">平板电视</a></span>
		<span><a href="#">电热水器</a></span>
		<span><a href="#">家庭音响</a></span>
		<span><a href="#">燃气热水器</a></span>
		<span><a href="#">空调</a></span>
		<span><a href="#">冰箱</a></span>
		<span><a href="#">冷柜</a></span>
		<span><a href="#">DVD/USB播放器</a></span>
		<span><a href="#">电视附件</a></span></dd>
		<dt id="EFF_dt_08"><a href="#">汽车用品</a></dt>
		<dd class="noDis" id="EFF_dd_08">
		<span><a href="#">洗衣机</a></span>
		<span><a href="#">平板电视</a></span>
		<span><a href="#">电热水器</a></span>
		<span><a href="#">家庭音响</a></span>
		<span><a href="#">燃气热水器</a></span>
		<span><a href="#">空调</a></span>
		<span><a href="#">冰箱</a></span>
		<span><a href="#">冷柜</a></span>
		<span><a href="#">DVD/USB播放器</a></span>
		<span><a href="#">电视附件</a></span></dd>
		<dt id="EFF_dt_09"><a href="#">母婴专区</a></dt>
		<dd class="noDis" id="EFF_dd_09">
		<span><a href="#">吸尘器</a></span>
		<span><a href="#">电熨斗</a></span>
		<span><a href="#">饮水机</a></span>
		<span><a href="#">取暖电器</a></span>
		<span><a href="#">加湿器</a></span>
		<span><a href="#">净化器</a></span>
		<span><a href="#">电动工具</a></span></dd>
		<dt id="EFF_dt_10"><a href="#">家用电器</a></dt>
		<dd class="noDis" id="EFF_dd_10">
		<span><a href="#">平板电视</a></span>
		<span><a href="#">电热水器</a></span>
		<span><a href="#">家庭音响</a></span>
		<span><a href="#">燃气热水器</a></span>
		<span><a href="#">空调</a></span>
		<span><a href="#">冰箱</a></span>
		<span><a href="#">冷柜</a></span>
		<span><a href="#">DVD/USB播放器</a></span>
		<span><a href="#">电视附件</a></span></dd>
		<dt id="EFF_dt_11"><a href="#">儿童玩具</a></dt>
		<dd class="noDis" id="EFF_dd_11">
		<span><a href="#">洗衣机</a></span>
		<span><a href="#">平板电视</a></span>
		<span><a href="#">电热水器</a></span>
		<span><a href="#">家庭音响</a></span>
		<span><a href="#">燃气热水器</a></span>
		<span><a href="#">空调</a></span>
		<span><a href="#">冰箱</a></span>
		<span><a href="#">冷柜</a></span>
		<span><a href="#">DVD/USB播放器</a></span>
		<span><a href="#">电视附件</a></span></dd>
		<dt id="EFF_dt_12"><a href="#">钟表珠宝</a></dt>
		<dd class="noDis" id="EFF_dd_12">
		<span><a href="#">吸尘器</a></span>
		<span><a href="#">电熨斗</a></span>
		<span><a href="#">饮水机</a></span>
		<span><a href="#">取暖电器</a></span>
		<span><a href="#">加湿器</a></span>
		<span><a href="#">净化器</a></span>
		<span><a href="#">电动工具</a></span></dd>
		<dt id="EFF_dt_13"><a href="#">日杂百货</a></dt>
		<dd class="noDis" id="EFF_dd_13">
		<span><a href="#">吸尘器</a></span>
		<span><a href="#">电熨斗</a></span>
		<span><a href="#">饮水机</a></span>
		<span><a href="#">取暖电器</a></span>
		<span><a href="#">加湿器</a></span>
		<span><a href="#">净化器</a></span>
		<span><a href="#">电动工具</a></span></dd>
		</dl>
    </div>
   </div>
   <div id="nav_l">
     
     <div id="news">
	   <div class="title"><span>商城首页</span><a href="">更多资讯...</a></div>
	   <div class="content">
	     <ul>
		   <li><a href="#">......</a><span>2020-6-21</span></li>
		   <li><a href="#">......</a><span>2020-6-17</span></li>
		   <li><a href="#">......</a><span>2020-6-13</span></li>
		   <li><a href="#">......</a><span>2020-6-9</span></li>
		   <li><a href="#">......</a><span>2020-6-5</span></li>
		   <li><a href="#">......</a><span>2020-6-1</span></li>
		   <li><a href="#">......</a><span>2020-5-28</span></li>
		 </ul>
	   </div>
	 </div>
	 <div id="slide"><img src="img/timg.jpg" width="699px" height="222px" /></div>
     <div id="goods">
	   <div class="title"><span>最新商品</span><a href="#">更多新品...</a></div>
	   <div class="content">
	    <div class="products">
		  <div class="picture">
		   <a href="#"><img src="../img/green_apple.jpg" width="165px" height="145px"/></a>
		   <h2><a href="#">apple</a><h2>
		  </div>
		  <div class="price">&nbsp;&nbsp;价格:<span>￥5.00</span></div>
		</div>
	    <div class="products">
		  <div class="picture">
		   <a href="#"><img src="../img/iphonev1.jpg" width="165px" height="145px" /></a>
		   <h2><a href="#">iphone</a><h2>
		  </div>
		  <div class="price">&nbsp;&nbsp;会员价:<span>￥5000.00</span></div>
		</div>
	    <div class="products">
		  <div class="picture">
		   <a href="#"><img src="../img/xiaomi10-1.PNG" width="165px" height="145px"/></a>
		   <h2><a href="#">小米手机</a><h2>
		  </div>
		  <div class="price">&nbsp;&nbsp;会员价:<span>￥2099.00</span></div>
		</div>
	    <div class="products">
		  <div class="picture">
		   <a href="#"><img src="../img/xinhuaDic.jpg" width="165px" height="145px"/></a>
		   <h2><a href="#">新华字典</a><h2>
		  </div>
		  <div class="price">&nbsp;&nbsp;会员价:<span>￥19.90</span></div>
		</div>
	    <div class="products">
		  <div class="picture">
		   <a href="#"><img src="../img/ak47.jpg" width="165px" height="145px"/></a>
		   <h2><a href="#">AK47</a><h2>
		  </div>
		  <div class="price">&nbsp;&nbsp;会员价:<span>￥2700.00</span></div>
		</div>
	   </div>
	 </div>
   </div>
 </div>

   
 </div>
 <div id="foot">
   <div id="foot_nav">
   
     <div class="footNav">
	   <ul>
	     <li><h4>购物指南</h4></li>
	     <li><a href="#">购物流程</a></li>
	     <li><a href="#">会员通道</a></li>
	     <li><a href="#">常见问题</a></li>
	     <li><a href="#">联系客服</a></li>
	   </ul>
	 </div>
     <div class="footNav">
	   <ul>
	     <li><h4>配送方式</h4></li>
	     <li><a href="#">上门自提</a></li>
	     <li><a href="#">211限时达</a></li>
	     <li><a href="#">快递运输</a></li>
	     <li><a href="#">如何送礼</a></li>
	     <li><a href="#">Global Shipping</a></li>
	   </ul>
	 </div>
     <div class="footNav">
	   <ul>
	     <li><h4>支付方式</h4></li>
	     <li><a href="#">货到付款</a></li>
	     <li><a href="#">再线支付</a></li>
	     <li><a href="#">分期付款</a></li>
	     <li><a href="#">邮局汇款</a></li>
	     <li><a href="#">公司转帐</a></li>
	   </ul>
	 </div>
     <div class="footNav">
	   <ul>
	     <li><h4>售后服务</h4></li>
	     <li><a href="#">售后服务政策</a></li>
	     <li><a href="#">售后服务流程</a></li>
	     <li><a href="#">价格保护</a></li>
	     <li><a href="#">退款说明</a></li>
	     <li><a href="#">返修/退换货</a></li>
	     <li><a href="#">取消订单</a></li>
	   </ul>
	 </div>
   </div>
   <div id="foot_copyright">
     <ul>
	   <li><a href="#">购物首页</a></li>
	   <li><a href="#">版权声明</a><span>&nbsp;|&nbsp;</span></li>
	   <li><a href="#">联系我们</a><span>&nbsp;|&nbsp;</span></li>
	   <li><a href="#">订单查询</a><span>&nbsp;|&nbsp;</span></li>
	   <li><a href="#">付款方式</a><span>&nbsp;|&nbsp;</span></li>
	   <li><a href="#">留言建议</a><span>&nbsp;|&nbsp;</span></li>
	   <li><a href="#">帮助(？)</a><span>&nbsp;|&nbsp;</span></li>
	   <li><a href="#">关于我们</a><span>&nbsp;|&nbsp;</span></li>
	 </ul>
	 <p>客服电话:8888-88888888&nbsp;&nbsp;公司地址:广州市番禺区大学城华南理工大学C10</p>
	 <p>网上购物|电子购物|网络商城&nbsp;网站备案:粤ICP备10086111号-1&nbsp;经营性ICP苏C10-123456789</p>
	 <p>广州华工实训敢死队项目小组&nbsp;</p>
	
   </div>
 </div>

 </body>
</html>


