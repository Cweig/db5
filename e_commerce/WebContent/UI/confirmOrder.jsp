<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/06/22
  Time: 14:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.ResultSet,bean.Lin,bean.DBBean" %>
<html>
<head>
    <title>确认订单</title>
    <script type="text/javascript" src="jquery-3.5.1.min.js"></script>
    <script type="text/javascript">
        function buy(myuid,mygid,thisvid,num) {
            var name=$('#name').val();
            var add=$('#address').val();
            var call=$('#phone').val();
            //window.open("./buyNow.jsp?uid="+myuid+"&gid="+mygid+"&vid="+thisvid+"&num="+num+"&name="+name+"&add="+add+"&ph="+call);
            window.open("./buyNow.jsp?gid="+mygid+"&vid="+thisvid+"&num="+num+"&name="+name+"&add="+add+"&ph="+call);
        }
    </script>
</head>
<body>
<%!
    public String show(String in){
        if(in==null)
            return "";
        return in;
    };

%>


<div id="orderinfo">
    <p style="text-align: center;text-decoration: underline ;font-size: larger">您选择了:<%

            //int nownum=0;
            //声明一个变量，表示当前商品库存
            String gid=request.getParameter("gid");
            String vid=request.getParameter("vid");
            String qty=request.getParameter("num");
            String uid=(String) application.getAttribute("activelogin");
            //uid=request.getParameter("uid");
            DBBean myd=new DBBean();
            ResultSet gname=myd.executeQuery("select name from goods where gid="+gid);
            //ResultSet gname=new Lin().getStmt().executeQuery("select name from goods where gid="+gid);
            gname.next();
            out.print(gname.getString(1)+"<br>");
            gname.close();
            ResultSet goods_mess=myd.executeQuery("select * from version where vid="+vid);
            //ResultSet goods_mess = new Lin().getStmt().executeQuery("select * from version where vid="+vid);
            //获取当前选择的商品的信息
            goods_mess.next();
            String price=String.valueOf(goods_mess.getInt(3)*Integer.parseInt(qty));
            price = price.subSequence(0, price.length()-2)+"."+price.substring(price.length()-2);
            
                //nownum=Integer.parseInt(goods_mess.getString(4));
            out.print("颜色："+goods_mess.getString(6)+" ，重量："+goods_mess.getString(7)+"克，其他属性："+show(goods_mess.getString(8))+"   "+show(goods_mess.getString(9))+"   "+show(goods_mess.getString(10)));
            goods_mess.close();
            myd.close();

        %>

        <br>
        数量为：
        <%=qty%><br>
        总价：
        ¥<%=price%>
    </p>
</div>

<div id="confirm" style="border: orange 3px solid; background-color: skyblue ; margin: auto;text-align:center ;width: 400px"  >
    <h2>请填写收件信息：</h2>
    <div id="comName">
        <h4 style="display: inline-block">收件人姓名:</h4>
        <input type="text" id="name" placeholder="名字"  style="display: inline-block">
    </div>
    <div id="comAdd">
        <h4 style="display: inline-block">收件人地址:</h4>
        <input type="text" id="address" placeholder="地址"  style="display: inline-block">
    </div>
    <div id="comPhone">
        <h4 style="display: inline-block">收件人电话:</h4>
        <input type="text" id="phone" placeholder="电话"  style="display: inline-block">
    </div>
    <input type="button" value="确定提交订单"  onclick="buy('<%=uid%>','<%=gid%>','<%=vid%>','<%=qty%>')">
</div>


</body>
</html>
