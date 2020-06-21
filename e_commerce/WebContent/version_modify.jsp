<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/6/18
  Time: 14:20
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
    <title>版本管理</title>
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
    String gid=request.getParameter("gid");
    String vid=request.getParameter("vid");
    String sql="select*from version where vid="+vid+" and gid="+gid;
    ResultSet rs=null;
    rs=db.executeQuery(sql);
    String price=null,stock=null,mid=null,color=null,weight=null,other1=null,other2=null,other3=null,photo_path=null;
    try {
        if(rs.next()){
            price=rs.getString("price");
            stock=rs.getString("stock");
            mid=rs.getString("mid");
            color=rs.getString("color");
            weight=rs.getString("weight");
            other1=rs.getString("other1");
            other2=rs.getString("other2");
            other3=rs.getString("other3");
            photo_path=rs.getString("photo_path");
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
<form class="form-horizontal" action="${pageContext.request.contextPath}/VersionServlet">
    <div class="form-group">
        <label for="VID" class="col-sm-2 control-label">Vid</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="vid" value=<%=vid%> name="vid">
        </div>
    </div>
    <div class="form-group">
        <label for="GID" class="col-sm-2 control-label">Gid</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="gid" placeholder="gid" value=<%=gid%> name="gid" >
        </div>
    </div>
    <div class="form-group">
        <label for="Price" class="col-sm-2 control-label">Price</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="price" placeholder="price" value=<%=price%> name="price" >
        </div>
    </div>
    <div class="form-group">
        <label for="STOCK" class="col-sm-2 control-label">Stock</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="stock" placeholder="stock" value=<%=stock%> name="stock" >
        </div>
    </div>
    <div class="form-group">
        <label for="Mid" class="col-sm-2 control-label">Mid</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="mid" placeholder="mid" value=<%=mid%> name="mid" >
        </div>
    </div>
    <div class="form-group">
        <label for="COLOR" class="col-sm-2 control-label">Color</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="color" placeholder="color" value=<%=color%> name="color" >
        </div>
    </div>
    <div class="form-group">
        <label for="WEIGHT" class="col-sm-2 control-label">weight</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="weight" placeholder="weight" value=<%=weight%> name="weight" >
        </div>
    </div>
    <div class="form-group">
        <label for="OTHER1" class="col-sm-2 control-label">other1</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="other1" placeholder="other1" value=<%=other1%> name="other1" >
        </div>
    </div>
    <div class="form-group">
        <label for="OTHER2" class="col-sm-2 control-label">other2</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="other2" placeholder="other2" value=<%=other2%> name="other2" >
        </div>
    </div>
    <div class="form-group">
        <label for="OTHER3" class="col-sm-2 control-label">other3</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="other3" placeholder="other3" value=<%=other3%> name="other3" >
        </div>
    </div>
    <div class="form-group">
        <label for="photo_path" class="col-sm-2 control-label">photo_path</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="photo_path" placeholder="other3" value=<%=photo_path%> name="photo_path" >
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <button type="submit" class="btn btn-default">提交</button>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <a class="btn btn-default" href="version_manage.jsp" role="button">返回</a>
        </div>
    </div>
</form>
</body>
</html>