<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/6/18
  Time: 13:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page import="bean.DBBean" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html>
<head>
    <title>订单管理</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <style type="text/css">
        #con {
            margin-left: auto;
            margin-right: auto;
            margin-top: 10%;
        }
    </style>
</head>
<body>
<jsp:useBean id="db" class="bean.DBBean" scope="page"/>
<%
    System.out.println("jsp");
    String oid = request.getParameter("oid");
    String sql="select*from order_form where oid="+oid;
    ResultSet rs=null;
    rs=db.executeQuery(sql);
    String uid=null,total=null,shopping_address=null,cellphone=null;
    Timestamp date = null;
    try {
        if(rs.next()){
            uid=rs.getString("uid");
            total=rs.getString("total");
            shopping_address=rs.getString("shopping_address");
            System.out.println(shopping_address);
            date=rs.getTimestamp("date");
            cellphone=rs.getString("cellphone");
        }
    } catch (SQLException sqlException) {
        sqlException.printStackTrace();
    }
    try {
        rs.close();
    } catch (SQLException sqlException) {
        sqlException.printStackTrace();
    }
    System.out.println(date);
%>
<form class="form-horizontal" action="${pageContext.request.contextPath}/OrderFormServlet">
    <div class="form-group">
        <label for="Oid" class="col-sm-2 control-label">Oid</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="oid" value=<%=oid%> name="oid">
        </div>
    </div>
    <div class="form-group">
        <label for="UID" class="col-sm-2 control-label">Uid</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="uid" placeholder="uid" value=<%=uid%> name="uid" >
        </div>
    </div>
    <div class="form-group">
        <label for="TOTAL" class="col-sm-2 control-label">Total</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="total" placeholder="total" value=<%=total%> name="total" >
        </div>
    </div>
    <div class="form-group">
        <label for="SHOPPING_ADDRESS" class="col-sm-2 control-label">Shopping_Address</label>
		
        <div class="col-sm-10">
            <input type="text" class="form-control" id="shopping_address" placeholder="shopping_address" value=<%=shopping_address %> name="shopping_address" >
        </div>
    </div>
    <div class="form-group">
        <label for="DATE" class="col-sm-2 control-label">Date</label>
        <%
        	out.print("<div class='col-sm-10'>"+
                   		 "<input type='text' class='form-control' id='date' placeholder='date' value='"+date+"' name='date' >"+
                    "</div>");
        %>
    </div>
    <div class="form-group">
        <label for="CELLPHONE" class="col-sm-2 control-label">Cellphone</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="cellphone" placeholder="cellphone" value=<%=cellphone%> name="cellphone" >
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <button type="submit" class="btn btn-default">提交</button>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <a class="btn btn-default" href="order_form_manage.jsp" role="button">返回</a>
        </div>
    </div>
</form>
</body>
</html>
