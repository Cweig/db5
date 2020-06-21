<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%@ page import="java.sql.*"%>
<jsp:useBean id="db" class="bean.DBBean" scope="page"/>
<%

		

		

	

	
		String sql=null;
		String op = request.getParameter("op");
		String uid=request.getParameter("Paramuid");

	

	//将商品放入购物车

	if (op.equals("add")){

		//从商品库中取出所选购商品的数据

		String vid = request.getParameter("Paramvid");

		String name=null,price=null;

		sql = "select * from version where vid="+vid;
		ResultSet rs=db.executeQuery(sql);
		
		String gid;
		if(rs.next())
		{
			gid=rs.getString("gid").trim();
			System.out.println(uid+","+gid+","+vid+",");
			db.execUpdateCartGoods(uid,gid,vid,1);
		}

		

		
		rs.close();

		

		


		
		
		

		//重定向到购物车页面

		response.sendRedirect("../UI/cart.jsp?Parauid="+uid);

	}
	else if (op.equals("sub")){

		//从商品库中取出所选购商品的数据

		String vid = request.getParameter("Paramvid");

		String name=null,price=null;

		sql = "select * from version where vid="+vid;
		ResultSet rs=db.executeQuery(sql);
		
		String gid;
		if(rs.next())
		{
			gid=rs.getString("gid").trim();
			System.out.println(uid+","+gid+","+vid+",");
			db.execUpdateCartGoods(uid,gid,vid,-1);
		}

		

		
		rs.close();

		//重定向到购物车页面

		response.sendRedirect("../UI/cart.jsp?Parauid="+uid);

	}

	

	

%> 