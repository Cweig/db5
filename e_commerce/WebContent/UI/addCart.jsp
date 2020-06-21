
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*,bean.Lin" %>
<html>
<head>
    <title>加入购物车</title>
<%--    <script type="text/javascript">
        function close() {window.parent.close();}
        function pageclose() {
            window.opener = null;
            window.open('', '_self');//注意：第一个是一对单引号
            window.close();
        }测试函数，没有实际用途
    </script>--%>
    <script type="text/javascript">
        function goToCart(uid) {
            alert("进入购物车");
            window.open("./cart.jsp?Parauid="+uid);
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
<%
    String gid=request.getParameter("gid");
    String vid=request.getParameter("vid");
    String uid=request.getParameter("uid");
    String qty=request.getParameter("num");
    //购买的数量
    Lin lin=new Lin();
    ResultSet Goods_name=lin.getStmt().executeQuery("select name from goods where gid="+gid);
    String gname="";
    //商品的名字
    while(Goods_name.next())
        gname=Goods_name.getString(1);

%>
<h2>您选择的商品：<%=gname%></h2>
<%
    ResultSet goods_mess = lin.getStmt().executeQuery("select * from version where vid="+vid);
    while (goods_mess.next())
        out.print("<h2>颜色："+goods_mess.getString(6)+" 重量："+goods_mess.getString(7)+"克，其他属性： "+show(goods_mess.getString(8))+" "+show(goods_mess.getString(9))+" "+show(goods_mess.getString(10))+" 数量："+qty+"</h2>");
    out.print("<h2>已经加入购物车！</h2><br>");
    String exist_sql="select * from shopping_cart where uid="+uid+" and gid="+gid+" and vid="+vid;
    //搜索表中是否已经有这个商品的记录
    //out.println(exist_sql);
    ResultSet exist = lin.getStmt().executeQuery(exist_sql);
    if(!exist.next()){
        String insert_sql="insert into shopping_cart value("+uid+","+gid+","+vid+","+qty+")";
        //out.println(insert_sql);
        lin.getStmt().executeUpdate(insert_sql);
        //购物车中不存在这条记录就直接添加
    }else{
        int nowqty=exist.getInt(4)+Integer.parseInt(qty);
        String up_sql="update shopping_cart set qty="+nowqty+" where uid="+uid+" and gid="+gid+" and vid="+vid;
        //out.println(up_sql);
        lin.getStmt().executeUpdate(up_sql);
        //购物车中存在这条记录就增加数量
    }

%>
<input type="button" value="查看我的购物车" onclick="goToCart(<%=uid%>)">

<%--<a href="javascript:window.opener=null;window.open('','_self');window.close();">关闭</a>
<input type="button" id="clo" value="关闭当前界面" onclick="close()">--%>
</body>
</html>
