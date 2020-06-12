<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/6/8
  Time: 20:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>index</title>
  </head>
  <body>
  Welcome!
  <%
    out.println("Your IP address is " + request.getRemoteAddr());
  %>
  <p>
    今天的日期是: <%= (new java.util.Date()).toLocaleString()%>
  </p>
  </body>
</html>
