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
String recipient=request.getParameter("name");
String address=request.getParameter("address");
String cellphone = request.getParameter("cellphone");
////

System.out.println("\ncreateOrder:");
System.out.println(uid);
System.out.println(total);
System.out.println(Allin);
System.out.println(recipient);
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
ResultSet res;
for(int i = 0; i< size;i++)
{
	res = db.executeQuery("select price,stock,photo_path from version where gid="+gidSet.get(i)+" and vid="+vidSet.get(i)+";");
		try
		{
			if(res.next())
			{	
				if(Integer.parseInt(QTYSet.get(i)) > Integer.parseInt(res.getString("stock")))
				{
					res.close();
					enough = false;
					System.out.println("库存不足");
					response.sendRedirect("../UI/fail.jsp");
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
		
	///顺便操作一下
	AllQTY=AllQTY+QTYSet.get(i)+",";
}
///

///查询商品描述
for(int i = 0; i < size;i++)
{	res=db.executeQuery("select description from goods where gid="+gidSet.get(i)+";");
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
}
///


		///自动提交表单
		out.write("<form action='../UI/ordercheck.jsp' method='post' id='form'>"+
						"<input type='hidden' name = 'AllPhotoPath' value='"+AllPhotoPath+"'>"+
						"<input type='hidden' name='AllPrice' value='"+AllPrice+"'>"+
						"<input type='hidden' name='AllDesc' value='"+AllDesc+"'>"+
						"<input type='hidden' name='AllQTY' value='"+AllQTY+"'>"+
						"<input type='hidden' name='uid' value='"+uid+"'>"+
						"<input type='hidden' name='recipient' value='"+recipient+"'>"+
						"<input type='hidden' name='total' value='"+total+"'>"+
						"<input type='hidden' name='address' value='"+address+"'>"+
						"<input type='hidden' name='cellphone' value='"+cellphone+"'>"+
						"<input type='hidden' name='Allin' value='"+Allin+"'>"+
						"<input type='submit' ></form><script language='javascript'>document.getElementById('form').submit();</script>");
		///
%>
</body>
</html>