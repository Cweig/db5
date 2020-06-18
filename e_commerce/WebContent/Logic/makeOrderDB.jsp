<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import='java.sql.*,java.util.*' %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="db" class='bean.DBBean'></jsp:useBean>
<%
System.out.println("\nmakeOrderDB: ");
request.setCharacterEncoding("UTF-8");


String uid=request.getParameter("uid");
String recipient=request.getParameter("recipient");
String total=request.getParameter("total");
String address = request.getParameter("address");
String cellphone=request.getParameter("cellphone");
String Allin=request.getParameter("Allin");
String AllQTY = request.getParameter("AllQTY");

System.out.println("uid:"+uid);
System.out.println("recipient:"+recipient);
System.out.println("total:"+total);
System.out.println("address:"+address);
System.out.println("cellphone:"+cellphone);
System.out.println("Allin:"+Allin);
System.out.println("AllQTY:"+AllQTY);
///从Allin中解析gid,vid,QTY
ArrayList<String> gidSet= new ArrayList<String>();
ArrayList<String> vidSet= new ArrayList<String>();
ArrayList<String> QTYSet = new ArrayList<String>();

int index = 0;
int length = Allin.length();
int begin = index;

while(index < length)
{
	begin = index;
	
	while(Allin.charAt(++index)!=',');
	
	gidSet.add(Allin.substring(begin,index));
	index++;
	vidSet.add(Allin.substring(index,index+=10));
	index++;
	begin = index;
	
	while(Allin.charAt(++index)!=',');
	
	QTYSet.add(Allin.substring(begin,index));
	
	index++;
}
///

///查询库存
index = 0;
int size = gidSet.size();
ResultSet stock;

	while(index<size)
	{	
		stock = db.executeQuery("select stock from version where vid="+vidSet.get(index)+";");
		try
		{
			System.out.println("check stock");
			if(stock.next())
			{	if(Integer.parseInt(stock.getString("stock")) < Integer.parseInt(QTYSet.get(index)))
				{	
					System.out.println("will redirect to fail.jsp");
					response.sendRedirect("../UI/fail.jsp");
					
				}
				System.out.println("库存足够");
			}			
		}
		catch(SQLException ex)
		{
			System.out.println("查询库存出错"+ex.getMessage());
		}
		
		index++;
	}
///

	///写订单记录
	int oid = db.execInsertOrder(uid,recipient,total, address, cellphone);
	System.out.println(oid);
	///

	///写购买记录
	index=0;
	if(oid!=0)
	{
		while(index < size)
		{
			db.execInsertShoppingRecord(oid, gidSet.get(index), vidSet.get(index), QTYSet.get(index));
			index++;
		}
	}
	else
		response.setHeader("refresh","../UI/fail.jsp");
///

	///开始订货
	System.out.println("开始订货");
	for(int i = 0; i < size;i++)
	{
		db.executeUpdate("update version set stock=stock-"+QTYSet.get(i)+" where vid="+vidSet.get(i)+";");
	}
	db.close();

	System.out.println("will redirect to ../UI/success.jsp");
	response.sendRedirect("../UI/success.jsp");
	///
%>
</body>
</html>