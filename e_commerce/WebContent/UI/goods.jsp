<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/06/08
  Time: 15:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" import="java.util.*,java.sql.*,bean.DBBean" %>
<%@ page import="bean.Lin" %>
<
<html>
<head>
	<meta charset="utf-8">
    <title>浏览商品</title>
    <link type="text/css" rel="stylesheet" href="../css/showGoods.css">
    <script type="text/javascript" src="jquery-3.5.1.min.js"></script>

    <script type="text/javascript">
        function send(number){
        	
            document.getElementById('form'+number).submit();
        }
        //打开某个商品的详细页
        function tbn() {
            window.open("./buyNow.jsp");
        }
        //测试函数
        function asc() {
            window.open("./addCart.jsp");
        }
        //测试函数
        function searchGoods() {
            var word=$('#searchbar').val();
            $('#searchbar').val("");
            window.open("./searchGoods.jsp?word="+word);
        }
        //获取关键字，进入搜索界面
        function showSearchBar() {
            $('.search').css('display','inline');
        }
        //展示搜索栏
        function disappSearchBar() {
            $('.search').css('display','none');
        }
        //消失搜索栏

    </script>
</head>
<body>
<%  String activelogin=request.getParameter("uid");%>
<% application.setAttribute("activelogin",activelogin);%>
<div id="button_bar">
    <div id="search_click" style="display: inline-block">
        <a onclick="showSearchBar()">搜索商品</a>
    </div>
    <div id="rank_click" style="display: inline-block">
        <a onclick="  window.open('./rank.jsp');">
            商品排序
        </a>
    </div>
</div>
<span class="search" style="display:none">
    <div>
        <div style="display: inline-block"><h3>搜索商品：</h3></div>
        <div style="display: inline-block"><input type="text" id="searchbar" placeholder="请输入商品名"></div>
    </div>    
    <div>
        <div id="searchbtn" style="display: inline-block"><a onclick="searchGoods()">搜索</a></div>
        <div id="displaybtn" style="display: inline-block"><a onclick="disappSearchBar()">隐藏搜索栏</a></div>
    </div>
</span>

<strong id="tit" style="margin-left: 10%">全部在售商品：</strong>
<%
    String getMidSql="select * from merchants where mid in (select distinct mid from version)order by mid limit 30;";

    Lin linformerchant=new Lin();
    ResultSet res;
    
    ArrayList<String> midList = new ArrayList<String>();
    ArrayList<String> nameList = new ArrayList<String>();
    ArrayList<String> cityList = new ArrayList<String>();
    ArrayList<String> phoneList = new ArrayList<String>();

    try{
         res = linformerchant.getStmt().executeQuery(getMidSql);
        while (res.next()){
            midList.add(res.getString("mid"));
            nameList.add(res.getString("name"));
            cityList.add(res.getString("city"));
            phoneList.add(res.getString("phone"));
        }
        //获取每个有商品出售的商家的信息

        int index = 0;//跳转到哪一个商品页面，一个商品一个index，递增，不管是否同个商家
        for(int i =0 ;i < midList.size();i++)
        {
            res = linformerchant.getStmt().executeQuery("select distinct gid,name,description,mid from (version natural join goods) where mid="+midList.get(i));
%>

<br>
<div  class='<%=midList.get(i) %>' style="border: orange 2px solid;margin-right: 200px;margin-left: 200px">
    <div style="text-align: center;border: skyblue 1px solid;background-color: #ff7464">
        <p style="font-size: larger">
            <%=nameList.get(i) %>
        </p>
        <pre> 地址：<%=cityList.get(i)%>  电话：<%=phoneList.get(i)%>  </pre>
    </div>
    <ul>
    <%

        //选择出这个商铺有售的商品的基本信息
        while (res.next()) {
    %>
        <li>
            <div class="goodname" style="height: auto">
                <p style="display: inline-block">
                	商品名：
                </p>	
                	<myc style="display: inline-block" onclick="send(<%=index%>)">
                    	<%=res.getString("name")%>
               	 	</myc>
                <p style="display: inline-block">
                             	描述：<%=res.getString("description")%>
                </p>
                <form id=<%="form"+index %> action = 'fullInfo.jsp' target="_blank" method='post'>

               		<input type='hidden' name='goodsName' value=<%=res.getString("name")%>>
               		<input type='hidden' name='gid' value=<%=res.getString("gid")%>>
               		<input type='hidden' name='mid' value=<%=midList.get(i)%>>
           	 		<input type='hidden' name='merchantsName' value=<%=nameList.get(i)%>>
           	 	</form>

            </div>
        </li>
    <%
    		index++;
           }
        out.println("</ul>");
        out.println("</div>");
        }
        
        res.close();
    %>

<%
    }
    catch (SQLException e){
        e.printStackTrace();
    }
    finally
    {
    	linformerchant.close();
    }
%>

</body>
</html>
