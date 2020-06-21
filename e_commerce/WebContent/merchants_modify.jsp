<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/6/18
  Time: 12:43
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
    <title>商家管理</title>
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
    String mid = request.getParameter("mid");
    String sql="select*from merchants where mid="+mid;
    ResultSet rs=null;
    rs=db.executeQuery(sql);
    String name=null,city=null,phone=null;
    try {
        if(rs.next()){
            name=rs.getString("name");
            city=rs.getString("city");
            phone=rs.getString("phone");
        }
    } catch (SQLException sqlException) {
        sqlException.printStackTrace();
    }
    try {
        rs.close();
    } catch (SQLException sqlException) {
        sqlException.printStackTrace();
    }

%>
<form class="form-horizontal" action="${pageContext.request.contextPath}/MerchantsServlet">
    <div class="form-group">
        <label for="MID" class="col-sm-2 control-label">Mid</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="mid" value=<%=mid%> name="mid">
        </div>
    </div>
    <div class="form-group">
        <label for="NAME" class="col-sm-2 control-label">Name</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="name" placeholder="name" value=<%=name%> name="name" >
        </div>
    </div>
    <div class="form-group">
        <label for="CITY" class="col-sm-2 control-label">Cid</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="city" placeholder="address" value=<%=city%> name="city" >
        </div>
    </div>
    <div class="form-group">
        <label for="PHONE" class="col-sm-2 control-label">Phone</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="PHONE" placeholder="description" value=<%=phone%> name="phone" >
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <button type="submit" class="btn btn-default">提交</button>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <a class="btn btn-default" href="merchants_manage.jsp" role="button">返回</a>
        </div>
    </div>
</form>
</body>
</html>