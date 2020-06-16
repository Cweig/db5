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
String oid=request.getParameter("oid");
ResultSet res= db.executeQuery("select gid,vid,QTY from shopping_record where oid="+oid+";");
ResultSet stock;
ArrayList<String> gidList = new ArrayList<String>();
ArrayList<String> vidList = new ArrayList<String>();
ArrayList<String> QTYList = new ArrayList<String>();
int index = 0;
System.out.println("\nmakeOrderDB: ");
try
{
	String gid,vid,QTY;
	while(res.next())
	{
		gidList.add(res.getString("gid"));
		vidList.add(res.getString("vid"));
		QTYList.add(res.getString("QTY"));
		
		stock = db.executeQuery("select stock from version where vid="+vidList.get(index)+";");
		try
		{
			System.out.println("check stock");
			if(stock.next())
			{	if(Integer.parseInt(stock.getString("stock")) < Integer.parseInt(QTYList.get(index)))
				{	
					System.out.println("will redirect to fail.jsp");
					response.sendRedirect("fail.jsp");
					
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
	
	int size = gidList.size();
	System.out.println("开始订货");
	for(int i = 0; i < size;i++)
	{
		db.executeUpdate("update version set stock=stock-"+QTYList.get(i)+" where vid="+vidList.get(i)+";");
	}
	System.out.println("will redirect to success.jsp");
	response.sendRedirect("success.jsp");
}
catch(SQLException e)
{
	System.out.println("订单不存在！"+e.getMessage());
}
%>
</body>
</html>