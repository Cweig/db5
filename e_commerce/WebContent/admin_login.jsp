<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/6/16
  Time: 10:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>管理员登录页面</title>
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
<div id="con">
    <h2 class="text-center">管理员登录界面</h2>
    <form class="form-horizontal" action="${pageContext.request.contextPath}/adminLoginServlet" role="form" method="post">
        <div class="form-group">
            <div class="col-md-4 col-md-offset-4">
                <input type="text" class="form-control" name="aid" id="aid"
                       placeholder="请输入用户名">
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-4 col-md-offset-4">
                <input type="password" class="form-control" name="password" id="password"
                       placeholder="请输入密码">
            </div>
        </div>
        <div class="col-md-4 col-md-offset-4">
            <input type="submit" class="btn btn-success col-md-2 primary" value="登录"/>
        </div>
    </form>
</div>
</body>
</html>
