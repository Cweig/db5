<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/06/19
  Time: 8:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="bean.Lin,java.sql.*" %>
<html>
<head>
    <title>搜索商品</title>
    <script type="text/javascript">
        function send(m,g,l){
            //alert('mid='+m+',cid='+c);
            window.open("./fullInfo.jsp?mid="+m+"&gid="+g+"&uid="+l);
        }
    </script>
</head>
<body>
<%! String uid="100000002";%>
<%
    String word=request.getParameter("word");
    //获取查询的关键词

    String searchGidSql="select * from (version natural join goods) where name like \"%"+word+"%\"";
    //out.print(searchGidSql);
    //在版本表中查询这个商品的详细信息

    ResultSet rs=new Lin().getStmt().executeQuery(searchGidSql);
    while (rs.next()){
%>
<div style="border: brown 2px double">
    <p><%=rs.getString(12)%>  售价：<%=Integer.parseInt(rs.getString(3))/100.0%>元</p>
    <%--该商品的名字和售价--%>
    <%
        //查询商铺名
        String findOutStoreNameSql="select name from merchants where mid="+rs.getString(5);
        ResultSet name=new Lin().getStmt().executeQuery(findOutStoreNameSql);
        //out.print(findOutStoreNameSql);
        while (name.next())
            out.print("店面:"+name.getString(1)+" 有售-->");

    %>
    <input type="button" value="进店看看" onclick="send('<%=rs.getString(5)%>','<%=rs.getString(1)%>','<%=uid%>')">
</div>
<br>
<%
    }
%>

</body>
</html>
