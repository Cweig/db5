<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/6/17
  Time: 21:15
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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.js"></script>
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.5.1/jquery.js"></script>

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

<sql:query dataSource="${snapshot}" var="result">
    SELECT * from category;
</sql:query>

<div class="container">
    <ul class="nav nav-tabs">
        <li><a href="manage_perform.jsp">首页</a></li>
        <li><a href="user_manage.jsp">用户管理</a></li>
        <li class="active"><a href="category_manage.jsp">种类管理</a></li>
        <li><a href="goods_manage.jsp">商品管理</a></li>
        <li><a href="merchants_manage.jsp">商家管理</a></li>
        <li><a href="order_form_manage.jsp">订单管理</a></li>
        <li><a href="shopping_cart_manage.jsp">购物车管理</a></li>
        <li><a href="shopping_record_manage.jsp">销售记录管理</a></li>
        <li><a href="version_manage.jsp">版本管理</a></li>
    </ul>
    <div class="col-md-8 col-md-offset-2 lg=6">
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>种类ID</th>
                <th>种类名称</th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="row" items="${result.rows}">
                <tr>
                    <td><c:out value="${row.cid}"/></td>
                    <td><c:out value="${row.name}"/></td>
                    <td><a class="btn btn-default" href="category_modify.jsp?cid=${row.cid}" role="button">修改</a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>
