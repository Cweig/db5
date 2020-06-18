<%--
  Created by IntelliJ IDEA.
  User: ckh
  Date: 2020/6/10
  Time: 23:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="author" content="chen">
    <title>Login</title>
    <link rel="stylesheet" href="../css/style.css">
</head>

<body>
<div class="container">
    <h1>Sign Up for free</h1>
    <form action="getID.jsp">
        <div class="input-wrapper">
            <div class="border-wrapper">
                <input class="input-item" type="text" name="name" placeholder="请输入您的名称">
            </div>
        </div>
       	 性&nbsp;&nbsp;别(单选框)：
        		<input type='radio' name = 'gender' value='male' checked>男
            	<input type='radio' name = 'gender' value='female' >女<br><br>
        <div class="input-wrapper">
            <div class="border-wrapper">
                <input class="input-item" type="password" id = 'p1' name="password" placeholder="请输入您的密码">
            </div>
        </div>
        <div class="input-wrapper">
            <div class="border-wrapper">
                <input class="input-item" type="password" id = 'p2' name="password" placeholder="再次输入密码">
            </div>
       
        </div>
        <div class="input-wrapper">
            <div class="border-wrapper">
                <input class="input-item" type="tel" name="cellphone" placeholder="请输入您的电话号码">
            </div>
        </div>
        <div class="input-wrapper">
            <div class="border-wrapper">
                <input class="input-item" type="text" name="address" placeholder="请输入您的住址">
            </div>
        </div>
        <div class="btn-wrapper">
            <input class="btn" type="submit" value="注册">
        </div>
    </form>
</div>

</body>

</html>
