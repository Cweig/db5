<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="../css/order_style.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>填写订单</title>
</head>
<%
System.out.println("\nfinishOrderInf:");

String uid=request.getParameter("uid");
String total=request.getParameter("total");
String Allin=request.getParameter("Allin");

System.out.println(uid);
System.out.println(total);
System.out.println(Allin);

System.out.println("will redirect to ../Logic/cresteOrder.jsp");
%>
<body background='../img/background.jpg'>
<div class="Box">
	<div class="cont">
		<form action='../Logic/createOrder.jsp' method='post'>
			<!-- 不知道要不要考虑收件人，以及订单的取消 -->
			<table>
				<tr><td>
					<div class='item'><span class="text_item"><i>*</i>收件人</span></div><div class="input_item"><input type="text" name="name" class="input"><br/></div>
				</td></tr>
				<tr><td>
					<div class='item'><span class="text_item"><i>*</i>收件地址</span></div><div class="input_item"><input type="text" name="address" class="input"><br/></div>
				</td></tr>
				<tr><td>
					<div class='item'><span class="text_item"><i>*</i>联系电话</span></div><div class="input_item"><input type="text" name="cellphone" class="input"><br/></div>
				</td></tr>
				<tr><td>
					<span class="item">&nbsp;</span><input type='submit' value="提交信息" class="btn"  >
				</td></tr>
			</table>
			<input type='hidden' name='uid' value=<%=uid %>>
			<input type='hidden' name='total' value=<%=total %>>
			<input type='hidden' name='Allin' value=<%=Allin %>>
		</form>
	</div>
</div>
</body>
</html>