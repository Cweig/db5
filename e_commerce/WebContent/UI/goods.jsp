<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/06/08
  Time: 15:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*,bean.DBBean" %>
<%@ page import="bean.Lin" %>
<html>
  <head>
    <title>浏览商品</title>
    <script type="text/javascript" src="jquery-3.5.1.min.js"></script>
    <script type="text/javascript">
/*      function x(n) {
        alert(n+' disappointing...');
        $('#'+n).css('display','none');
      }*/
      //测试函数，没有实际意义
    </script>
    <script type="text/javascript">
      function send(m,g,l){
          //alert('mid='+m+',cid='+c);
          window.open("./fullInfo.jsp?mid="+m+"&gid="+g+"&uid="+l);
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
      function search() {
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
<%--  <%
      ResultSet rs=new Lin().getLink();

      while(rs.next()) {%>
  <%=rs.getString(1)%>
  <%=rs.getString(2)%>
  <%}%>--%>
  <%! String mid="1100000001"; String cid="F00000000001"; String gid="2"; String login="1000000002";%>
<%--<input type="button" value="商品详情页测试入口" onclick="send('<%=mid%>','<%=gid%>','<%=login%>')">--%>
<input type="button" value="开启搜索" onclick="showSearchBar()">
<span class="search" style="display:none">
    <h4>搜索商品：</h4>
    <input type="text" id="searchbar" placeholder="请输入商品名">
    <input type="button" id="searchbutton" value="搜索" onclick="search()">
    <input type="button" value="隐藏搜索栏" onclick="disappSearchBar()">
</span>
<h3>全部在售商品：</h3>
<%
  String getMidSql="select distinct mid from version";
  Lin lin=new Lin();
  ResultSet midList = lin.getStmt().executeQuery(getMidSql);
  //lin.getStmt().close();
  while (midList.next()){
    String nowmid=Integer.toString(midList.getInt(1));
    //获取每个有商品的商家的mid
    String getMerchantSql="";
  %>
<br>
<div class="<%=nowmid%>" style="border: orange 2px solid;width: 800px">
<%
  getMerchantSql="select * from merchants where mid="+nowmid;
  //out.print(getMerchantSql);
  Lin linForMerInfo=new Lin();
  ResultSet  merchantinfo = linForMerInfo.getStmt().executeQuery(getMerchantSql);
  while (merchantinfo.next()) {
    out.print("商铺ID：" + merchantinfo.getString(1) + " 商铺名： " + merchantinfo.getString(2) + "  商铺地址：" + merchantinfo.getString(3) + " 商铺电话：" + merchantinfo.getString(4));
  };
  String findOutGoodsSql="select distinct gid,name,description from (version natural join goods) where mid="+nowmid;
  //选择出这个商铺有售的商品的基本信息
  //out.print(findOutGoodsSql);
  ResultSet goodsList = linForMerInfo.getStmt().executeQuery(findOutGoodsSql);
  while (goodsList.next()) {
    out.print("<br>"+"商品名："+goodsList.getString(2)+" 描述："+goodsList.getString(3));
    %>
  <input type='button' value='查看详情' onclick="send('<%=nowmid%>','<%=goodsList.getString(1)%>','<%=login%>')">
  <%
  }
%>

</div>


<%
  }
%>



<%--  <%for(int num=0;num<=50;num++) {%>
  <input type="button" id="<%= num %>" onclick="x(<%= num%>)" value="<%= num %>">
  <%}%>--%>
<%--验证jQuery是否被正确导入，无实际意义 --%>
<%--<%! String p="data";%>--%>

<%--  <input type="button" value="立即购买测试" onclick="tbn()" >
  <input type="button" value="加入购物车测试" onclick="asc()">--%>

  </body>
</html>
