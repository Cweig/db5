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
String uid = request.getParameter("uid");
String total=request.getParameter("total");
String money = total.subSequence(0,total.length()-2)+"."+total.substring(total.length()-2);

String AllPhotoPath = request.getParameter("AllPhotoPath");
String AllPrice = request.getParameter("AllPrice");
String AllDesc = request.getParameter("AllDesc");
String AllQTY = request.getParameter("AllQTY");
///

System.out.println("\nordercheck:\n will redirect to ../Logic/makeOrderDB.jsp");
System.out.println("AllPhotoPath:"+AllPhotoPath);
System.out.println("AllPrice:"+AllPrice);
System.out.println("AllDesc:"+AllDesc);
System.out.println("AllQTY:"+AllQTY);
ArrayList<String> pathList = new ArrayList<String>();
ArrayList<String> priceList = new ArrayList<String>();
ArrayList<String> descList = new ArrayList<String>();
ArrayList<String> QTYList = new ArrayList<String>();
int index = 0;
int begin;
int length = AllPhotoPath.length();

while(index < length)
{
	begin = index;
	while(AllPhotoPath.charAt(++index)!=',');
	
	pathList.add(AllPhotoPath.substring(begin,index));
	index++;
}

length = AllPrice.length();
index=0;
while(index < length)
{
	begin = index;
	while(AllPrice.charAt(++index)!=',');
	
	priceList.add(AllPrice.substring(begin,index));
	index++;
}

length = AllDesc.length();
index=0;
while(index < length)
{
	begin = index;
	while(AllDesc.charAt(++index)!='^');
	
	descList.add(AllDesc.substring(begin,index));
	index++;
}

length = AllQTY.length();
index=0;
while(index < length)
{
	begin = index;
	while(AllQTY.charAt(++index)!=',');
	
	QTYList.add(AllQTY.substring(begin,index));
	index++;
}

System.out.println("path list's size:"+pathList.size());
System.out.println("price list's size:"+priceList.size());
System.out.println("desc list's size:"+descList.size());
System.out.println("qty list's size:"+QTYList.size());
%>
<title>确认订单</title>
</head>
<body>
	<form action="../Logic/makeOrderDB.jsp" method="post" class ='product-table'>
		<span class='text_item'>账号<%=uid %></span>
		<span class='text_item'>收件人</span><div class='input_item'><input name="recipient" value="<%=request.getParameter("recipient") %>" class='input'></div>
		<span class='text_item'>送货地址</span><div class='input_item'><input name="address" value="<%=request.getParameter("address")%>" class='input'></div>
		<span class='text_item'>联系方式</span><div class='input_item'><input name="cellphone" value="<%=request.getParameter("cellphone") %>" class='input'></div>
		<ul>
			<li><div class="submit-con">
    				<span>订单商品总价:</span>
    				<span class="submit-total"><%=money%> 元</span>
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
						for(int i= 0; i < pathList.size();i++)
						{	
							price=priceList.get(i);
							
							cell_total=Integer.toString(Integer.parseInt(price)*Integer.parseInt(QTYList.get(i)));

							out.print(
									  "<tr>"+
       				                      "<td class='cell-img'>"+
           									"<a href=''showGoods?gid=' target='_blank'>"+
               				 					"<img class='p-img' src='../"+pathList.get(i)+"' alt='正在加载'>"+
            								"</a>"+
       									  "</td>"+
        								  "<td class='cell-info'>"+
            								"<a class='link' href='showGoods?gid' target='_blank'>"+descList.get(i)+
           							 		"</a>"+
        								  "</td>"+
        								  "<td class='cell-price'>¥"+price.subSequence(0, price.length()-2)+"."+price.substring(price.length()-2)+"</td>"+
       									  "<td class='cell-count'>"+QTYList.get(i)+"</td>"+
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