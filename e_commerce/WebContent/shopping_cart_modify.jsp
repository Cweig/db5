<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/6/18
  Time: 13:35
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
    String gid=request.getParameter("gid");
    String vid=request.getParameter("vid");
    String sql="select*from shopping_cart where uid="+uid+" and gid="+gid+" and vid="+vid;
    ResultSet rs=null;
    rs=db.executeQuery(sql);
    String qty=null;
    try {
        if(rs.next()){
            qty=rs.getString("qty");
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
<form class="form-horizontal" action="${pageContext.request.contextPath}/ShoppingCartServlet">
    <div class="form-group">
        <label for="UID" class="col-sm-2 control-label">Uid</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="uid" value=<%=uid%> name="uid">
        </div>
    </div>
    <div class="form-group">
        <label for="GID" class="col-sm-2 control-label">Gid</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="gid" placeholder="gid" value=<%=gid%> name="gid" >
        </div>
    </div>
    <div class="form-group">
        <label for="VID" class="col-sm-2 control-label">Vid</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="vid" placeholder="vid" value=<%=vid%> name="vid" >
        </div>
    </div>
    <div class="form-group">
        <label for="QTY" class="col-sm-2 control-label">Qty</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="qty" placeholder="qty" value=<%=qty%> name="qty" >
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <button type="submit" class="btn btn-default">提交</button>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <a class="btn btn-default" href="shopping_cart_manage.jsp" role="button">返回</a>
        </div>
    </div>
</form>
</body>
</html>