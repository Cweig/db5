<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/06/08
  Time: 15:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*" %>
<html>
  <head>
    <title>浏览商品</title>
    <link rel='sheetstyle' href='css/index.css'>
    <script type="text/javascript" src="./static/js/jquery-3.5.1.min.js"></script>
    <script type="text/javascript">
      function x(n) {
        alert(n+' disappointing...');
        $('#'+n).css('display','none');
      }
    </script>
    <script type="text/javascript">
      function send(m,c,g){
          //alert('mid='+m+',cid='+c);
          window.open("./showGoods.jsp?mid="+m+'&cid='+c+"&gid="+g);
      }
    </script>
	<script type="text/javascript">
	function openCart(m,c,g)
    {
  	  window.open("./cart.jsp?mid="+m+'&cid='+c+"&gid="+g);
    }
	</script>
  </head>
  <body>
  <%! String mid="1100000002"; String cid="F00000000001"; String gid="2";%>
<a href='cart.jsp'>我的购物车</a>
<div class="logo" style='text-align:center'>
			<img src="img/mall.jpg">
</div>
<div class="content">
		<div class="img_content">
			<ul>
				<li>
					<img src="img/apple.jpg" alt="图片文本描述" width="300" height="200" onclick="send('<%=mid%>','<%=cid%>','<%=gid%>')">
					<div class="info">
						<h3>苹果</h3>
						<p>
							一个水果商品
						</p>
						<div class="img_btn"> 
							<div class="price">¥ 2300</div>
							<!-- 购物车按钮 -->
							<div class="btn">
									<img src="img/cart.jpg" width="75" height="40" onclick="openCart('<%=mid%>','<%=cid%>','<%=gid%>')">
									<br><br>
							</div>
						</div>
					</div>
				</li>

				<li>
					<img src="img/iphonev1.jpg" alt="图片文本描述" width="300" height="200" onclick="send('<%=mid%>','<%=cid%>','<%=gid%>')">
					<div class="info">
						<h3>iPhone</h3>
						<p>
							一个电子产品
						</p>
						<div class="img_btn"> 
							<div class="price">¥ 2300</div>
							<!-- 购物车按钮 -->
							<div class="btn">
									<img src="img/cart.jpg" width="75" height="40" onclick="openCart('<%=mid%>','<%=cid%>','<%=gid%>')">
									<br><br>
							</div>
						</div>
					</div>
				</li>

				<li>
					<img src="img/iphonev2.jpg" alt="图片文本描述" width="300" height="200" onclick="send('<%=mid%>','<%=cid%>','<%=gid%>')">
					<div class="info">
						<h3>iPhone</h3>
						<p>
							一个电子产品
						</p>
						<div class="img_btn"> 
							<!-- 价格，购买logo -->
							<div class="price">¥ 2300</div>
							<!-- 购物车按钮 -->
							<div class="btn">
									<img src="img/cart.jpg" width="75" height="40" onclick="openCart('<%=mid%>','<%=cid%>','<%=gid%>')">
									<br><br>
							</div>
						</div>
					</div>
				</li>

				<li>
					<img src="img/apple.jpg" alt="图片文本描述" width="300" height="200" onclick="send('<%=mid%>','<%=cid%>','<%=gid%>')">
					<div class="info">
						<h3>无名女郎</h3>
						<p>
							图片描述可以分为多种，这里是一个关于展示的板块，这里是一个关于展示的板块，这里是一个关于展示的板块，这里是一个关于展示的板块，这里是一个关于展示的板块
						</p>
						<div class="img_btn"> 
							<!-- 价格，购买logo -->
							<div class="price">¥ 2300</div>
							<!-- 购物车按钮 -->
							<div class="btn">
									<img src="img/cart.jpg" width="75" height="40" onclick="openCart('<%=mid%>','<%=cid%>','<%=gid%>')">
									<br><br>
							</div>
						</div>
					</div>
				</li>

				<li>
					<img src="img/apple.jpg" alt="图片文本描述" width="300" height="200" onclick="send('<%=mid%>','<%=cid%>','<%=gid%>')">
					<div class="info">
						<h3>无名女郎</h3>
						<p>
							图片描述可以分为多种，这里是一个关于展示的板块，这里是一个关于展示的板块，这里是一个关于展示的板块，这里是一个关于展示的板块，这里是一个关于展示的板块
						</p>
						<div class="img_btn"> 
							<!-- 价格，购买logo -->
							<div class="price">¥ 2300</div>
							<!-- 购物车按钮 -->
							<div class="btn">
									<img src="img/cart.jpg" width="75" height="40" onclick="openCart('<%=mid%>','<%=cid%>','<%=gid%>')">
							</div>
						</div>
					</div>
				</li>

	
			</ul>
			
		</div>
</div>

  
  
  <%for(int num=0;num<=10;num++) {%>
  <input type="button" id="<%= num %>" onclick="x(<%= num%>)" value="<%= num %>">
  <%}%>
<%! String p="data";%>

  </body>
</html>
