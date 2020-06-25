<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import='java.util.*' %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="../css/order_style.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
///获取订单信息
request.setCharacterEncoding("UTF-8");

String AllPhotoPath = request.getParameter("AllPhotoPath");
String AllPrice = request.getParameter("AllPrice");
String AllDesc = request.getParameter("AllDesc");
String AllQTY = request.getParameter("AllQTY");
String AllCellTotal = request.getParameter("AllCellTotal");

String total=request.getParameter("total");//处理总金额显示
String money = total.subSequence(0,total.length()-2)+"."+total.substring(total.length()-2);

String uid = request.getParameter("uid");
///

System.out.println("\nordercheck:\n will redirect to ../Logic/makeOrderDB.jsp");
System.out.println("AllPhotoPath:"+AllPhotoPath);
System.out.println("AllPrice:"+AllPrice);
System.out.println("AllDesc:"+AllDesc);
System.out.println("AllQTY:"+AllQTY);
System.out.println("AllCellTotal:"+AllCellTotal);

///解析商品信息
String []pathList = AllPhotoPath.split(",");
String []priceList = AllPrice.split(",");
String []descList = AllDesc.split("\\|");
String []QTYList = AllQTY.split(",");
String []cellTotalList = AllCellTotal.split(",");

int size = pathList.length;
%>
<title>确认订单</title>
</head>
<body>
	<form action="../Logic/makeOrderDB.jsp" method="post" class ='product-table'>
	<div style="verstical-align:middle">
	<div style="text-align:center">
		<span class='text_item'>账号<%=uid %><br></span>
		<span class='text_item'>收件人</span><div class='input_item'><input name="recipient" value="<%=request.getParameter("recipient") %>" class='input'></div>
		<span class='text_item'>送货地址</span><div class='input_item'><input name="address" value="<%=request.getParameter("address")%>" class='input'></div>
		<span class='text_item'>联系方式</span><div class='input_item'><input name="cellphone" value="<%=request.getParameter("cellphone") %>" class='input'></div>
	</div>	
	</div>
		<ul>
			<li><div class="submit-con">
    				<span>订单商品总价:</span>
    				<span class="submit-total">¥<%=money%></span>
    				<span class="btn order-submit"><input type='submit' value="确认提交"></span>
				</div>  
			</li>
			<li>
			<table class="product-table">
   				<tr><!-- 表头 -->
        			<th class="cell-img">&nbsp;</th>
        			<th class="cell-info">商品描述</th>
        			<th class="cell-price">价格</th>
        			<th class="cell-count">数量</th>
        			<th class="cell-total">小计</th>
    			</tr>
    			<%
    			String cell_total;
    			String price;
						for(int i= 0; i < size;i++)
						{	
							price=priceList[i];
							cell_total=cellTotalList[i];
							out.print(
									  "<tr>"+
       				                      "<td class='cell-img'>"+
           									"<a href=''showGoods?gid=' target='_blank'>"+
               				 					"<img class='p-img' src='../"+pathList[i]+"' alt='正在加载'>"+
            								"</a>"+
       									  "</td>"+
        								  "<td class='cell-info'>"+
            								"<a class='link' href='showGoods?gid' target='_blank'>"+descList[i]+
           							 		"</a>"+
        								  "</td>"+
        								  "<td class='cell-price'>¥"+price.subSequence(0, price.length()-2)+"."+price.substring(price.length()-2)+"</td>"+
       									  "<td class='cell-count'>"+QTYList[i]+"</td>"+
        								  "<td class='cell-total'>¥"+cell_total.subSequence(0, cell_total.length()-2)+"."+cell_total.substring(cell_total.length()-2)+"</td>"+
    								  "</tr>");
						}
				%>
			</table>
			</li>
		</ul>
		<input type='hidden' name='uid' value='<%=uid %>'>
		<input type='hidden' name='total' value="<%=total %>">
		<input type='hidden' name='Allin' value="<%=request.getParameter("Allin")%>">
		<input type='hidden' name='AllQTY' value="<%=AllQTY%>">
	</form> 
</body>
</html>