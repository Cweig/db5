<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>购物车</title>
</head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
</head>
<body>
<jsp:useBean id="db" class="bean.DBBean" scope="page"/>
<%

    String uid = request.getParameter("Parauid");

    String sql = "select * from shopping_cart,version,goods where uid=" + uid+" and shopping_cart.vid=version.vid and shopping_cart.gid=goods.gid";
    ResultSet rs = db.executeQuery(sql);
%>

<!-- 为了测试提交订单加的链接 -->
<a href='finishOrderInf.jsp?uid=1000000002&total=500&Allin=1,1900000001,1,' target='_blank'>提交订单</a>

<table border="1" width="600">
		<tr bgcolor="#dddddd">
			<td align="center" width="80">商品图片</td> 	
			<td align="center" width="80">商品名称</td> 
			<td align="center" width="80">商品描述</td> 
			<td align="center" width="80">商品总价</td>
			<td align="center" width="80">商品数量</td>
			<td align="center" width="80">点击添加</td>
			<td align="center" width="80">点击减少</td>
		</tr>		
			<%			
					String name,num,count,img,description,des1,des2,des3,vid;			//将查询结果集中的记录输出到页面上		
					int qty,price,total;
					while (rs.next()){				//从当前记录中读取各字段的值	
						qty=Integer.parseInt(rs.getString("qty").trim());
						if(qty<=0)
							continue;
						name = rs.getString("name").trim();	
						img=rs.getString("photo_path").trim();
						vid=rs.getString("vid").trim();
						
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
						
						out.println("<tr>");	
						out.println("<td><img src='../"+img+"' border=0 height=60 width=80></td>");
						out.println("<td>"+ name +"</td>");	
						out.println("<td>"+description+"</td>");
						out.println("<td>"+total/100+"."+total%100+"</td>");
						out.println("<td>"+qty+"</td>");
						out.println("<td><a href='../Logic/logicCart.jsp?op=add&Paramuid="+uid+"&Paramvid="+vid+"'>添加一份</a></td>");
						out.println("<td><a href='../Logic/logicCart.jsp?op=sub&Paramuid="+uid+"&Paramvid="+vid+"'>减少一份</a></td>");
						System.out.println(vid);
						out.println("</tr>");			
						}		
			%>			
			</table>

</body>
</html>