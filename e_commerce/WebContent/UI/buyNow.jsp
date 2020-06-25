
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" import="java.sql.*,bean.Lin" %>
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
<p style="text-align: center">您已成功购买商品类型为:
    <%
        int nownum=0;
        //声明一个变量，表示当前商品库存
        request.setCharacterEncoding("utf-8");
        String gid=request.getParameter("gid");
        String vid=request.getParameter("vid");
        String qty=request.getParameter("num");
        Lin uselin = new Lin();
        ResultSet goods_mess = uselin.getStmt().executeQuery("select * from version where vid="+vid);

        //获取当前选择的商品的信息
        goods_mess.next();

        nownum=Integer.parseInt(goods_mess.getString(4));

            //out.print("当前库存:"+nownum);
        out.print("颜色："+goods_mess.getString(6)+" ，重量："+goods_mess.getString(7)+"克，其他属性："+show(goods_mess.getString(8))+"   "+show(goods_mess.getString(9))+"   "+show(goods_mess.getString(10)));
        int nowprice=Integer.parseInt(goods_mess.getString(3))*Integer.parseInt(qty);
        String price = String.valueOf(nowprice);
        price = price.subSequence(0, price.length()-2)+"."+price.substring(price.length()-2);
        //获取当前商品金额
		
    %>

    <br>
    数量为：
    <%=qty%>
</p>
<h4 style="text-align: center">谢谢！</h4>
<p style="text-align: center">
<%

    String orderName=request.getParameter("name");
    String orderAddress=request.getParameter("add");
    String orderPhone=request.getParameter("ph");
    String orderTotal=price;
    String orderuid=(String) application.getAttribute("activelogin");
    //orderuid=request.getParameter("uid");
    String add_order="insert into order_form(uid,recipient,total,shopping_address,date,cellphone) value("+orderuid+",\'"+orderName+"\',"+orderTotal+",\'"+orderAddress+"\',now(),\'"+orderPhone+"\')";
    //out.print(add_order);
    //在order表中添加一条订单记录，立即购买操作，每条购买记录只会有一个shopping_record记录\'
    uselin.getStmt().executeUpdate(add_order);

    String sql="select max(oid) from order_form";
    ResultSet rs=uselin.getStmt().executeQuery(sql);
    int nowoid=0;
    rs.next();
    nowoid = rs.getInt(1);
        //获取刚才新建的order记录的oid，作为外键添加到shopping_record中

    out.print("订单号："+nowoid);
    String sql2="insert into shopping_record value("+nowoid+","+gid+","+vid+","+qty+")";
    uselin.getStmt().executeUpdate(sql2);
    //添加一条shopping_record记录

    int laterNum=nownum-Integer.parseInt(qty);
    //计算购买后的库存，准备更新数据库库存信息
    String updatakuchunSql="update version set stock="+laterNum+" where vid="+vid;

    //out.print("<h1>"+updatakuchunSql+"</h1>");
    uselin.getStmt().executeUpdate(updatakuchunSql);
    uselin.close();
    //改变库存


%>
</p>
</body>
</html>
