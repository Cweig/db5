<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/06/09
  Time: 22:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*,com.Lin" %>
<html>
<head>
    <title>商品详细信息</title>

    <script>
        function addCart(i) {
            alert("将商品gid为<%=(String)request.getParameter("gid")%>,版本号为"+i+"加入购物车");
        }
        function buyNow(i) {
            window.open('finishOrderInf.jsp');
        }
    </script>
    <script type="text/javascript" src="static/js/jquery-3.5.1.min.js"></script>
    <script>
        var fu=1;
        var shu=0;
        function checkFu() {
            if(parseInt(fu))
                $("#dis").css("disabled","disabled");
            else
                $("#dis").removeAttr("disabled");
        }
        function add() {
            shu+=1;

            console.warn(fu);
            fu=false;
            checkFu();
            $("#shu").text(shu);
            checkFu();
        }
        function dis() {
            shu-=1;
            checkFu();
            $("#shu").text(shu);
            if(parseInt(shu)<=0)
                $("#dis").css("disabled","disabled");
            checkFu();
        }
    </script>
</head>
<body>
<%!
    public String show(String in){
        if(in==null)
            return "";
        return in;
    }
%>
<% String mid=(String)request.getParameter("mid");
String cid=(String)request.getParameter("cid");
String gid=(String)request.getParameter("gid");

String sql="select * from version where gid="+gid+" and mid="+mid;
ResultSet rs=new Lin().getStmt().executeQuery(sql);
int i=1;
try{
    while (rs.next()){
%>
<div class="gid_<%=gid%>" id="<%=i%>" style="height: 150px; border: 1px solid red; width: 400px; ">

    <%
        String picurl=rs.getString(11);
        picurl="     ";
    %>
    <img src="<%=picurl%>"><br>
<% String vid= rs.getString(1);%>
    价格：
<%=Integer.parseInt(rs.getString(3))/100%>元<br>
    库存：
<%=rs.getString(4)%>件<br>
    颜色：
<%=rs.getString(6)%><br>
    重量：
<%=rs.getString(7)%>克<br>
    其他：
<%=show(rs.getString(8))%>&#32;&#32;
<%=show(rs.getString(9))%>&#32;&#32;
<%=show(rs.getString(10))%>&#32;&#32;
    <br>
<input type="button" id="a_<%=rs.getString(1)%>" onclick="addCart('<%=rs.getString(1)%>')" value="加入购物车">
<input type="button" id="b_<%=rs.getString(1)%>" onclick="buyNow('<%=rs.getString(1)%>')" value="立即购买">


</div>
<br>

<%
    i+=1;
    }}catch (SQLException e){
    e.printStackTrace();
    }
%>

<div class="shulaing">
    <input type="button" id="dis" value="减一份" disabled="disabled" onclick="dis()">
    <p id="shu">0</p>
    <input type="button" id="add" value="加一份" onclick="add()">
</div>

</body>
</html>
