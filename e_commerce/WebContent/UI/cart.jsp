<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>购物车</title>
<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js" type="text/javascript"></script>
</head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
</head>
<body>
<jsp:useBean id="db" class="bean.DBBean" scope="page"/>
<%

    String uid = request.getParameter("Parauid");
    String password = request.getParameter("password");
    String sql = "select * from shopping_cart,version,goods where uid=" + uid+" and shopping_cart.vid=version.vid and shopping_cart.gid=goods.gid";
    ResultSet rs = db.executeQuery(sql);
%>	
<form action="finishOrderInf.jsp?uid="<%=uid %> method="post">	
<table border="1" width="600">
		<tr bgcolor="#dddddd">
			<td align="center" width="80">选择购买</td> 
			<td align="center" width="80">商品图片</td> 	
			<td align="center" width="80">商品名称</td> 
			<td align="center" width="80">商品描述</td> 
			<td align="center" width="80">商品总价</td>
			<td align="center" width="80">商品数量</td>
		</tr>		
			<%			
					String name,num,count,img,description,des1,des2,des3,vid,gid;			//将查询结果集中的记录输出到页面上		
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
						<td><%=total %></td>
						<td><input name="addone" type="button" value="-" onclick="location.href='../Logic/logicCart.jsp?op=sub&Paramuid=<%=uid%>&Paramvid=<%=vid%>'"/><%=qty %><input name="addone" type="button" value="+" onclick="location.href='logicCart.jsp?op=add&Paramuid=<%=uid%>&Paramvid=<%=vid%>'"/></td>
						
						</tr>
						
			<%		
						}		
					rs.close();
					db.close();
			%>			
			</table>
			
			<input type="submit" value="提交订单"/>
			<label id="showTotalprice"></label>
</form>
<script type="text/javascript">
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
	$("#showTotalprice").text("选中商品总价："+result);	
	});
</script>
</body>
</html>