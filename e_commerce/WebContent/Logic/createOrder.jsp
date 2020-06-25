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
String Allin=request.getParameter("Allin");
String recipient=request.getParameter("name");
String address=request.getParameter("address");
String cellphone = request.getParameter("cellphone");
////

System.out.println("\ncreateOrder:");
System.out.println(uid);
System.out.println(Allin);
System.out.println(recipient);
System.out.println(address);
System.out.println(cellphone);

///从Allin中解析gid,vid,QTY,cellTotal
ArrayList<String> gidSet= new ArrayList<String>();
ArrayList<String> vidSet= new ArrayList<String>();
ArrayList<String> QTYSet = new ArrayList<String>();
ArrayList<String> cellTotalSet = new ArrayList<String>();

String [] all = Allin.split(",");
int index = 0;
while(index < all.length)
{
	gidSet.add(all[index++]);
	vidSet.add(all[index++]);
	QTYSet.add(all[index++]);
	cellTotalSet.add(all[index++]);
}
///

///查看库存并获取图片路径
boolean enough = true;
int size = gidSet.size();

String AllPhotoPath="";
String AllPrice="";
String AllDesc="";
String AllQTY="";
String AllCellTotal="";
int total = 0;
int price ;
int qty;
ResultSet res;
String stmt = "select vid,price,stock,photo_path,description from version natural join goods where vid = "+vidSet.get(0);
for(int i = 1; i < size;i++)
{
	stmt = stmt + " or vid="+vidSet.get(i);
}
stmt+=";";
int vid;
res = db.executeQuery(stmt);
		try
		{
			while(res.next())
			{	
				index=0;
				vid = res.getInt("vid");
				for(; index < size;index++)
				{
					if(Integer.parseInt(vidSet.get(index))==vid)
					{	
						System.out.println("find index "+index);
						break;
					}
				}
				
				//临时变量保存单价与数量
				price = res.getInt("price");
				qty=Integer.parseInt(QTYSet.get(index));
				total += price * qty;//计算总金额
				
				if(qty > res.getInt("stock"))
				{
					res.close();
					enough = false;
					System.out.println("库存不足");
					response.sendRedirect("../UI/fail.jsp");
				}
				
				
				//把确认订单所需的商品信息（单价，图片路径，数量，小计,描述）封装起来，用于返回给确认订单页面
				AllPhotoPath=AllPhotoPath+res.getString("photo_path")+",";
				AllPrice=AllPrice+res.getString("price")+",";
				AllDesc = AllDesc + res.getString("description")+"|";
				AllQTY=AllQTY+qty+",";
				AllCellTotal=AllCellTotal+cellTotalSet.get(index)+",";
			}
			
		}
		catch(SQLException e)
		{
			System.out.println("查询商品单价，图片与库存出错");
		}
		finally
		{
			res.close();
			db.close();
		}
///



		///自动提交表单
		out.write("<form action='../UI/ordercheck.jsp' method='post' id='form'>"+
						"<input type='hidden' name = 'AllPhotoPath' value='"+AllPhotoPath+"'>"+
						"<input type='hidden' name='AllPrice' value='"+AllPrice+"'>"+
						"<input type='hidden' name='AllDesc' value='"+AllDesc+"'>"+
						"<input type='hidden' name='AllQTY' value='"+AllQTY+"'>"+
						"<input type='hidden' name='AllCellTotal' value='"+AllCellTotal+"'>"+
						"<input type='hidden' name='total' value='"+total+"'>"+
						"<input type='hidden' name='uid' value='"+uid+"'>"+
						"<input type='hidden' name='recipient' value='"+recipient+"'>"+
						"<input type='hidden' name='address' value='"+address+"'>"+
						"<input type='hidden' name='cellphone' value='"+cellphone+"'>"+
						"<input type='hidden' name='Allin' value='"+Allin+"'>"+
						"<input type='submit' ></form><script language='javascript'>document.getElementById('form').submit();</script>");
		///
%>
</body>
</html>