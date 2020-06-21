<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/6/17
  Time: 23:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page import="bean.DBBean" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html>
<head>
    <title>用户管理</title>
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
    String uid = request.getParameter("uid");
    System.out.println(uid);
    String sql="select*from user where uid="+uid;
    ResultSet rs=null;
    rs=db.executeQuery(sql);
    String name=null,password=null,gender=null,cellphone=null,address=null;
    while(true){
        try {
            if (!rs.next()) break;
        } catch (SQLException sqlException) {
            sqlException.printStackTrace();
        }
        try {
            name=rs.getString("name");
        } catch (SQLException sqlException) {
            sqlException.printStackTrace();
        }
        try {
            password=rs.getString("password");
        } catch (SQLException sqlException) {
            sqlException.printStackTrace();
        }
        try {
            gender=rs.getString("gender");
        } catch (SQLException sqlException) {
            sqlException.printStackTrace();
        }
        try {
            cellphone=rs.getString("cellphone");
        } catch (SQLException sqlException) {
            sqlException.printStackTrace();
        }
        try {
            address=rs.getString("address");
        } catch (SQLException sqlException) {
            sqlException.printStackTrace();
        }
    }
    try {
        rs.close();
    } catch (SQLException sqlException) {
        sqlException.printStackTrace();
    }

%>
<form class="form-horizontal" action="${pageContext.request.contextPath}/UserServlet">
    <div class="form-group">
        <label for="UID" class="col-sm-2 control-label">UID</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="uid" value=<%=uid%> name="uid">
        </div>
    </div>
    <div class="form-group">
        <label for="inputPassword" class="col-sm-2 control-label">Password</label>
        <div class="col-sm-10">
            <input type="password" class="form-control" id="inputPassword" placeholder="Password" name="password" value=<%=password%>>
        </div>
    </div>
    <div class="form-group">
        <label for="name" class="col-sm-2 control-label">Name</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="name" placeholder="name" name="name" value=<%=name%>>
        </div>
    </div>
    <div class="form-group">
        <label for="gender" class="col-sm-2 control-label">Password</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="gender" placeholder="gender" name="gender" value=<%=gender%>>
        </div>
    </div>
    <div class="form-group">
        <label for="cellphone" class="col-sm-2 control-label">Cellphone</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="cellphone" placeholder="cellphone" name="cellphone" value=<%=cellphone%>>
        </div>
    </div>
    <div class="form-group">
        <label for="address" class="col-sm-2 control-label">Address</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="address" placeholder="address" name="address" value=<%=address%>>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <button type="submit" class="btn btn-default">提交</button>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <a class="btn btn-default" href="user_manage.jsp" role="button">返回</a>
        </div>
    </div>
</form>
</body>
</html>
