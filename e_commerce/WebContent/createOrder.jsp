<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import='java.util.*,java.sql.*' %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="db" class="bean.DBBean" scope="page"></jsp:useBean>
<%
////获取请求的参数信息
request.setCharacterEncoding("UTF-8");
String uid=request.getParameter("uid");
String total=request.getParameter("total");
String Allin=request.getParameter("Allin");
String address=request.getParameter("address");
String cellphone = request.getParameter("cellphone");
////

System.out.println("\ncreateOrder:");
System.out.println(uid);
System.out.println(total);
System.out.println(Allin);
System.out.println(address);
System.out.println(cellphone);

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

///查看库存并获取图片路径
boolean enough = true;
int size = gidSet.size();

String AllPhotoPath="";
String AllPrice="";
String AllDesc="";
String AllQTY="";
for(int i = 0; i< size;i++)
{
	ResultSet res = db.executeQuery("select price,stock,photo_path from version where gid="+gidSet.get(i)+" and vid="+vidSet.get(i)+";");
		try
		{
			if(res.next())
			{	
				if(Integer.parseInt(QTYSet.get(i)) > Integer.parseInt(res.getString("stock")))
				{
					res.close();
					enough = false;
					System.out.println("库存不足");
					response.sendRedirect("fail.jsp");
					break;
				}
				AllPrice=AllPrice+res.getString("price")+",";
				AllPhotoPath=AllPhotoPath+res.getString("photo_path")+",";
			}
			
		}
		catch(SQLException e)
		{
			System.out.println("查询图片与库存出错");
		}
	
	///查询商品描述
	res=db.executeQuery("select description from goods where gid="+gidSet.get(i)+";");
	try
	{
		if(res.next())
		{	
			AllDesc=AllDesc+res.getString("description")+"^";//不确定商品描述是否会出现这个符号，比起其他符号，这个出现的频率应该较小
		}
		
	}
	catch(SQLException e)
	{
		System.out.println("查询商品描述出错");
	}
	///
	
	///顺便操作一下
	AllQTY=AllQTY+QTYSet.get(i)+",";
}
///

///插入订单，取得订单号
if(enough)
{
	int oid = db.execInsertOrder(uid, total, address, cellphone);
	System.out.println(oid);
	///

	///写购买记录
	if(oid!=0)
	{
		int i = 0;
		while(i < size)
		{
			db.execInsertShoppingRecord(oid, gidSet.get(i), vidSet.get(i), QTYSet.get(i));
			i++;
		}
		System.out.println("will redirect to ordercheck.jsp");

		///自动提交表单给ordercheck
		System.out.println("oid:"+oid);
		System.out.println("total:"+total);
		System.out.println("AllPhotoPath:"+AllPhotoPath);
		System.out.println("AllPrice:"+AllPrice);
		System.out.println("AllDesc:"+AllDesc);
		System.out.println("AllQTY:"+AllQTY);
		out.write("<form action='ordercheck.jsp' method='post' id='form'>"+
						"<input type='password' name='oid' value='"+oid+"'>"+
						"<input type='password' name='total' value='"+total+"'>"+
						"<input type='password' name = 'AllPhotoPath' value='"+AllPhotoPath+"'>"+
						"<input type='password' name='AllPrice' value='"+AllPrice+"'>"+
						"<input type='password' name='AllDesc' value='"+AllDesc+"'>"+
						"<input type='password' name='AllQTY' value='"+AllQTY+"'>"+
						"<input type='submit' ></form><script language='javascript'>document.getElementById('form').submit();</script>");
		///
	}
	///
}
%>
</body>
</html>