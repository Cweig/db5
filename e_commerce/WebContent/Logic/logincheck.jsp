<%@ page import="java.sql.ResultSet" language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
</head>
<body>
<jsp:useBean id="db" class="bean.DBBean" scope="page"/>
<%

    String uid = request.getParameter("uid");
    String password = request.getParameter("password");

    String sql = "select * from user where uid=" + uid;
    ResultSet rs = db.executeQuery(sql);
    try {
        if (rs.next()) {
            try {
                if (password.equals(rs.getObject("password"))) {
                    response.sendRedirect("../UI/index.jsp");
                } else {
                    out.print("<script language='javaScript'>alert('密码错误');</script>");
                    response.setHeader("refresh", "0;url=../UI/login.jsp");
                }
            } catch (SQLException sqlException) {
                sqlException.printStackTrace();
            }
        } else {
            out.print("<script language='javaScript'> alert('账号或密码错误');</script>");
            response.setHeader("refresh", "0;url=../UI/login.jsp");
        }
    } catch (SQLException sqlException) {
        sqlException.printStackTrace();
    }

%>
</body>
</html>