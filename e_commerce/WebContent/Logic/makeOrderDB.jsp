
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

String [] all = Allin.split(",");
while(index < all.length)
{
	gidSet.add(all[index++]);
	vidSet.add(all[index++]);
	QTYSet.add(all[index++]);
	index++;
}
///

///查询库存
index = 0;
int size = vidSet.size();
ResultSet stock;
String stmt = "select vid,stock from version  where vid = "+vidSet.get(0);
for(int i = 1; i < size;i++)
{
	stmt = stmt + " or vid="+vidSet.get(i);
}
stmt+=";";

int vid,qty;
stock = db.executeQuery(stmt);
		try
		{
			while(stock.next())
			{	
				index=0;
				vid = stock.getInt("vid");
				for(; index < size;index++)
				{
					if(Integer.parseInt(vidSet.get(index))==vid)
					{	
						System.out.println("find index "+index);
						break;
					}
				}
				
				//临时变量保存数量
				qty=Integer.parseInt(QTYSet.get(index));
				
				if(qty > stock.getInt("stock"))
				{
					stock.close();
					System.out.println("库存不足");
					response.sendRedirect("../UI/fail.jsp");
				}
			}
		}
		catch(SQLException ex)
		{
			System.out.println("查询库存出错"+ex.getMessage());
		}
		finally
		{
			stock.close();
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
		stmt = "insert into shopping_record values("+oid+","+ gidSet.get(0)+","+ vidSet.get(0)+","+ QTYSet.get(0)+")";
		index++;
		while(index < size)
		{
			stmt+=",("+oid+","+ gidSet.get(index)+","+ vidSet.get(index)+","+ QTYSet.get(index)+")";
			index++;
		}
		stmt+=";";
		db.execInsert(stmt);
	}
	else
		response.setHeader("refresh","../UI/fail.jsp");
///

	///开始订货
	System.out.println("开始订货");
	stmt = "update version set stock= case vid when "+vidSet.get(0)+" then "+"stock-"+QTYSet.get(0);
	String range = "("+vidSet.get(0);
	for(int i = 1; i < size;i++)
	{
		stmt += " when "+vidSet.get(i)+" then "+"stock-"+QTYSet.get(i);
		range+=","+vidSet.get(i);
	}
	stmt = stmt + " end where vid in"+range+");";
	System.out.println(stmt);
	db.executeUpdate(stmt);
	db.close();

	System.out.println("will redirect to ../UI/success.jsp");
	response.sendRedirect("../UI/success.jsp");
	///
%>
</body>
</html>