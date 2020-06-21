<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/6/17
  Time: 19:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html>
<head>
    <title>管理页面</title>
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
<sql:setDataSource var="snapshot" driver="com.mysql.cj.jdbc.Driver"
                   url="jdbc:mysql://47.113.122.126:3306/e_commerce?useSSL=false&serverTimezone=Asia/Shanghai"
                   user="eins"  password="F0rg@vEM3"/>

<sql:query dataSource="${snapshot}" var="user">
    SELECT * from user;
</sql:query>
<sql:query dataSource="${snapshot}" var="category">
    SELECT * from category;
</sql:query>
<sql:query dataSource="${snapshot}" var="goods">
    SELECT * from goods;
</sql:query>
<sql:query dataSource="${snapshot}" var="merchants">
    SELECT * from merchants;
</sql:query>
<sql:query dataSource="${snapshot}" var="order_form">
    SELECT * from order_form;
</sql:query>

<div class="container">
    <ul class="nav nav-tabs">
        <li class="active"><a data-toggle="tab" href="manage_perform.jsp">首页</a></li>
        <li><a href="user_manage.jsp">用户管理</a></li>
        <li><a href="category_manage.jsp">种类管理</a></li>
        <li><a href="goods_manage.jsp">商品管理</a></li>
        <li><a href="merchants_manage.jsp">商家管理</a></li>
        <li><a href="order_form_manage.jsp">订单管理</a></li>
        <li><a href="shopping_cart_manage.jsp">购物车管理</a></li>
        <li><a href="shopping_record_manage.jsp">销售记录管理</a></li>
        <li><a href="version_manage.jsp">版本管理</a></li>
    </ul>

    <div class="tab-content">
        <div id="home" class="tab-pane fade in active">
            <h3>首页</h3>
            <p>null</p>
        </div>

    </div>
</div>

</body>
</html>
