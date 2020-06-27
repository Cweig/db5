
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" import="java.sql.*,bean.Lin" %>
<html>
<head>
    <title>加入购物车</title>
    <link href="../css/addCart.css" type="text/css" rel="stylesheet">
    <script type="text/javascript">
        function goToCart(uid) {
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
	request.setCharacterEncoding("utf-8");
    String gid=request.getParameter("gid");
    String vid=request.getParameter("vid");
    String uid=(String) application.getAttribute("activelogin");
    String qty=request.getParameter("num");
    String name = request.getParameter("goodsName");
    System.out.println(name);
    //购买的数量

%>
<h2>您选择的商品：<%=name%></h2>
<%
	Lin lin = new Lin();
    try
    {
    	ResultSet goods_mess = lin.getStmt().executeQuery("select * from version where vid="+vid);
 
    	if(goods_mess.next())
    	{	
    		out.print("<h2>颜色："+goods_mess.getString(6)+"，重量："+goods_mess.getString(7)+"克，其他属性： "+show(goods_mess.getString(8))+" "+show(goods_mess.getString(9))+" "+show(goods_mess.getString(10))+"  数量："+qty+"件</h2>");
   			out.print("<h2>已经加入购物车！</h2><br>");
    		goods_mess.close();
    	}

    	int sum = Integer.parseInt(qty);//最终可能的数量
    
    	String exist_sql="select qty from shopping_cart where uid="+uid+" and gid="+gid+" and vid="+vid;
    	//搜索表中是否已经有这个商品的记录,如果有可以获取到数量
    	ResultSet exist = lin.getStmt().executeQuery(exist_sql);
    	if(exist.next()){
        	sum  +=exist.getInt("qty");
        	System.out.println("qty is "+sum);
        	exist.close();
    	}
    	lin.getStmt().execute("replace into shopping_cart (uid,gid,vid,qty) values ("+uid+","+gid+","+vid+","+sum+");");
    }
    catch(SQLException e)
    {
    	System.out.println("加入购物车失败！"+e.getMessage());
    }
    finally
    {
    	lin.close();
    }
%>
<a id="aToCart" onclick="goToCart(<%=uid%>)">查看购物车</a>
</body>
</html>
