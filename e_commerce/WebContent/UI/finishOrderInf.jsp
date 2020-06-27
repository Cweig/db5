<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="../css/order_style.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>填写订单信息</title>
</head>
<style>
	body
	{
		background-image:url("../img/background.jpg");
		background-size:cover;
		width:100%;
		height:100%;
		min-height: 60vh;
	}
</style>
<jsp:useBean id="db" class="bean.DBBean" scope="page"/>
<%
System.out.println("\nfinishOrderInf:");

String uid=request.getParameter("uid");
String [] allGoodsSelected = request.getParameterValues("checkGoods");
String Allin = Arrays.toString(allGoodsSelected);
allGoodsSelected=Allin.split(" ");
Allin="";
for(int i = 0; i < allGoodsSelected.length;i++)
{
	Allin += allGoodsSelected[i];
}
Allin = Allin.substring(1,Allin.length()-1);
System.out.println(uid);
System.out.println(Allin);
System.out.println("allin size is "+Allin.length());
System.out.println("will redirect to ../Logic/cresteOrder.jsp");

ResultSet res = db.executeQuery("select name,address,cellphone from user where uid="+uid);
String userName="";
String userAddress="";
String userCellphone="";
try
{
	if(res.next())
	{
		userName = res.getString("name");
		userAddress = res.getString("address");
		userCellphone = res.getString("cellphone");
	}
}
catch(SQLException e)
{
	System.out.println("查询默认信息失败！"+e.getMessage());
}
finally
{
	res.close();
	db.close();
}
%>
<body >
<div class="Box">
	<div class="cont">
		<form action='../Logic/createOrder.jsp' method='post'  name ='form' onsubmit="return check()">
			<table>
				<tr><td>
					<div class='item'><span class="text_item"><i>*</i>收件人</span></div><div class="input_item"><input type="text"  name="name" class="input" value="<%=userName %>" onmousedown="this.value=''"><br/></div>
				</td></tr>
				<tr><td>
					<div class='item'><span class="text_item"><i>*</i>收件地址</span></div><div class="input_item"><input type="text"  name="address" class="input" value="<%=userAddress %>" onmousedown="this.value=''"><br/></div>
				</td></tr>
				<tr><td>
					<div class='item'><span class="text_item"><i>*</i>联系电话</span></div><div class="input_item"><input type="text" name="cellphone" class="input" value="<%=userCellphone %>" onmousedown="this.value=''"><br/></div>
				</td></tr>
				<tr><td>
					<span class="item">&nbsp;</span><button type='submit' class="btn" >提交信息</button>
				</td></tr>
			</table>
			<input type='hidden' name='uid' value=<%=uid %>>
			<input type='hidden' name='Allin' value=<%=Allin %>>
		</form>
	</div>
</div>
</body>
<script type="text/javascript">
	function check()
	{
		if(form.name.value=='')
		{	
			alert('请填写收件人姓名');
			return false;
		}
		else if(form.address.value=='')
		{	
			alert('请填写收件地址');
			return false;
		}
		else if(form.cellphone.value=='')
		{	
			alert('请填写联系电话');
			return false;
		}
		return true;
	}
</script>
</html>