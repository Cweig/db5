<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import='java.sql.*' %>
<%@page import='bean.DBBean' %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Register Return</title>
</head>
<body>
<jsp:useBean id="db" class="bean.DBBean" scope="page"/>
<% 
request.setCharacterEncoding("UTF-8");
String name = request.getParameter("name");
String pwd = request.getParameter("password");
String gender = request.getParameter("gender");
String cellphone = request.getParameter("cellphone");
String address = request.getParameter("address");
System.out.println(name+","+pwd+","+gender+","+cellphone+","+address);
int id = db.execInsertUser(name, pwd, gender, cellphone,address);
if(id != 0)
{	
	String s = new String(""+id);
	System.out.println(s);
	request.setAttribute("id",s);
	response.sendRedirect("../UI/return.jsp?id="+id);
}
%>
</body>
</html>