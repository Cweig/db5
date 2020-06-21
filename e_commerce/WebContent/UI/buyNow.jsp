
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*,bean.Lin" %>
<html>
<head>
    <title>立即购买</title>
</head>
<body>
<%!
    public String show(String in){
        if(in==null)
            return "";
        return in;
    }
%>
<p>您已成功购买商品类型为:
    <%
        int nownum=0;
        //声明一个变量，表示当前商品库存
        Lin lin=new Lin();
        String gid=request.getParameter("gid");
        String vid=request.getParameter("vid");
        String qty=request.getParameter("num");
        ResultSet goods_mess = lin.getStmt().executeQuery("select * from version where vid="+vid);
        //获取当前选择的商品的信息
        while (goods_mess.next())
        {
            nownum=Integer.parseInt(goods_mess.getString(4));

            //out.print("当前库存:"+nownum);
            out.print("颜色："+goods_mess.getString(6)+" ，重量："+goods_mess.getString(7)+"克，其他属性："+show(goods_mess.getString(8))+"   "+show(goods_mess.getString(9))+"   "+show(goods_mess.getString(10)));
        }

    %>

    <br>
    数量为：
    <%=qty%>
</p>
<h4>谢谢！</h4>
<%


    String add_order="insert into order_form(shopping_address,date,cellphone) value(\"蓝洞公司\",now(),\"13977889900\")";
    lin.getStmt().executeUpdate(add_order);
    //在order表中添加一条订单记录，立即购买操作，每条购买记录只会有一个shopping_record记录

    String sql="select max(oid) from order_form";
    ResultSet rs=lin.getStmt().executeQuery(sql);
    int nowoid=0;
    while (rs.next()){
        nowoid = rs.getInt(1);
        //获取刚才新建的order记录的oid，作为外键添加到shopping_record中
    }
    out.print("订单号："+nowoid);
    String sql2="insert into shopping_record value("+nowoid+","+gid+","+vid+","+qty+")";
    lin.getStmt().executeUpdate(sql2);
    //添加一条shopping_record记录

    int laterNum=nownum-Integer.parseInt(qty);
    //计算购买后的库存，准备更新数据库库存信息
    String updatakuchunSql="update version set stock="+laterNum+" where vid="+vid;

    //out.print("<h1>"+updatakuchunSql+"</h1>");
    new Lin().getStmt().executeUpdate(updatakuchunSql);
    //改变库存


%>

</body>
</html>
