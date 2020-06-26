<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>购物车</title>
<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js" type="text/javascript"></script>
</head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
<style>
	#cart_bg
	{
		background-image:url('../img/Cartbgimg.jpg');
		position:fixed;
		top:0;
		left:0;
		
		width:100%;
		height:100%;
		min-width:100%;
		
		z-index:-10;
		background-repeat:no-repeat;
		background-size:cover;
		-webkit-background-size: cover;
        -o-background-size: cover;
        
        background-position: center 0;
	}
	#table-2 th, #table-2 tr {
	border-top-width: 1px;
	border-top-style: solid;
	border-top-color: rgb(230, 189, 189);
	}
	#table-2 {
	border-bottom-width: 1px;
	border-bottom-style: solid;
	border-bottom-color: rgb(230, 189, 189);
	}
	
	/* Padding and font style */
	#table-2 td, #table-2 th {
	padding: 5px 10px;
	font-size: 12px;
	font-family: Verdana;
	color: rgb(177, 106, 104);
	}
	
	/* Alternating background colors */
	#table-2 tr:nth-child(even) {
	background: rgb(238, 211, 210)
	}
	input { font-family:"Arial", "Tahoma", "微软雅黑", "雅黑"; border:0;
	 vertical-align:middle; margin:8px; line-height:18px; font-size:18px } 
	.btns { width:143px; height:40px; background:url("../img/cartsubmit.jpg") no-repeat left top; color:#FFF; } 
</style>
<div class="wrapper">
	<div id="cart_bg"></div>
</div>
</head>
<body >
<jsp:useBean id="db" class="bean.DBBean" scope="page"/>
<%

    String uid = request.getParameter("Parauid");
	String vid="";
    String sql = "select * from shopping_cart,version,goods where uid=" + uid+" and shopping_cart.vid=version.vid and shopping_cart.gid=goods.gid";
    ResultSet rs = db.executeQuery(sql);
%>	
<form action="finishOrderInf.jsp" method="post">	
<table id="table-2" border="1" width="700">
		<tr bgcolor="#dddddd">
			<td align="center" width="80">选择购买</td> 
			<td align="center" width="80">商品图片</td> 	
			<td align="center" width="80">商品名称</td> 
			<td align="center" width="80">商品描述</td> 
			<td align="center" width="80">商品总价/¥</td>
			<td align="center" width="80">商品数量</td>
		</tr>		
			<%			
					String name,num,count,img,description,des1,des2,des3,gid;			//将查询结果集中的记录输出到页面上		
					int qty,price,total;
					while (rs.next()){				//从当前记录中读取各字段的值	
				
						qty=Integer.parseInt(rs.getString("qty").trim());
						if(qty<=0)
							continue;
						name = rs.getString("name").trim();	
						img=rs.getString("photo_path").trim();
						img = "../"+img;
						vid=rs.getString("vid").trim();
						gid=rs.getString("gid").trim();
						
						des1="";des2="";des3="";
						if(rs.getString("other1")!=null)
							des1=rs.getString("other1");
						if(rs.getString("other2")!=null)
							des2=","+rs.getString("other2");
						if(rs.getString("other3")!=null)
							des3=","+rs.getString("other3");
						description=rs.getString("description").trim()+","+des1+des2+des3;
						
						price=Integer.parseInt(rs.getString("price").trim());
						
						total=price*qty;
			%>			
						<tr>
						<td><input type="checkbox" name="checkGoods" value="<%=gid%>,<%=vid%>,<%=qty%>,<%=total%>" /></td>
						<td><img  src=<%=img%> border=0 height=60 width=80></td>
						<td><%=name %></td>
						<td><%=description %></td>
						<td><%
							String str=String.valueOf(total);
							StringBuilder sb=new StringBuilder(str);
							sb.insert(str.length()-2,".");
							str=sb.toString();
							out.println(str); %></td>
						<td>
								<input name="qty" version-id=<%=vid%> value=<%=qty%> oninput="var v=this.value||'';v=v.replace(/[^\d]/g,'');if(v.length==1 && v==0){v=''};this.value=v.substr(0,3);" />
						</td>
						</tr>
			<%		
						}		
					rs.close();
					db.close();
			%>
			<td><input type="hidden" name="uid" value=<%=uid %>></td>			
			</table>
			
			<div> 
			<input type="submit" class="btns" onmouseover="this.style.backgroundPosition='left -40px'"
			 onmouseout="this.style.backgroundPosition='left top'" value="提交" /> 
			</div> 
			<label id="showTotalprice"></label>
</form>
<script type="text/javascript">
$("input[name=qty]").blur(function(){
	var qty=$(this).val();
	var vid=$(this).attr("version-id");
	window.location.href="../Logic/logicCart.jsp?op=changeQty&Paramuid="+<%=uid%>+"&Paramvid="+vid+"&QTY="+qty;
});

	$("input[name=checkGoods]").bind("click",function(){		
	var result = 0;		
	var chks=$("input[name=checkGoods]:checked");		
	for(var i=0;i<chks.length;i++){	
		var chksSplit=chks[i].value.split(",");
		result+=parseInt(chksSplit[3]);	
		
	} 
	result=result.toString();
	let arr=result.split('');
	arr.splice(arr.length-2,0,'.');
	result=arr.join('');
	$("#showTotalprice").text("选中商品总价：¥"+result);	
	});
</script>
</body>
</html>