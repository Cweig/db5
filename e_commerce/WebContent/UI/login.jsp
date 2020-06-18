<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="author" content="chen">
    <title>Login</title>
    <link rel="stylesheet" href="../css/style.css">
</head>

<body>
<div class="container">
    <h1>Sign In</h1>
    <form action="../Logic/logincheck.jsp">
        <div class="input-wrapper">
            <div class="border-wrapper">
                <input class="input-item" type="text" name="uid" placeholder="USERID">
            </div>
        </div>
        <div class="input-wrapper">
            <div class="border-wrapper">
                <input class="input-item" type="password" name="password" placeholder="PASSWORD">
            </div>
        </div>
        <div class="btn-wrapper">
            <input class="btn" type="submit" value="登录">
        </div>
    </form>
    <form action="../Logic/register.jsp">
        <div class="btn-wrapper">
            <input class="btn" type="submit" value="注册">
        </div>
    </form>
</div>

</body>

</html>