<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>购物车</title>
</head>
<body>
<img src='../img/green_apple.jpg'>
<%String url="finishOrderInf.jsp?uid=1000000001&total=1990&Allin=3,1900000005,1,1,1900000006,1,"; 
System.out.println("\ncart:\n will redirect to "+url);%>
<a href="<%=url%>" target='_blank'>结算</a>
</body>
</html>