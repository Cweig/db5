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
    <link rel="stylesheet" type="text/css" href="../css/searchGoods.css">
    <script type="text/javascript" src="jquery-3.5.1.min.js"></script>
    <script type="text/javascript">
        function send(m,g,goodsname,merchantsname){
            //alert('mid='+m+',cid='+c);
            //window.open("./fullInfo.jsp?mid="+m+"&gid="+g+"&uid="+l);
            window.open("./fullInfo.jsp?mid="+m+"&gid="+g+"&goodsName="+goodsname+"&merchantsName="+merchantsname);
        }
        function changeShowCol() {
            if($('.col').is('.showone')){
                $('.col').removeClass('showone');
                $('.col').addClass('showtwo');
                $('.displaymess').text('单列显示');
            }else {
                $('.col').addClass('showone');
                $('.col').removeClass('showtwo');
                $('.displaymess').text('双列显示');
            }
        }
    </script>
</head>
<body>
<%!
    public String show(String in){
        if(in==null)
            return "";
        return in+";";
    }
    //如果字符串是空字符，就不展示
%>
<% String uid=(String) application.getAttribute("activelogin");%>
<%--<%
    uid=(String)request.getAttribute("login");
%>--%>
<div style="width: 100%">
    <a class="displaymess" onclick="changeShowCol()">双列显示</a>
    <%--<input type="button" value="双行显示" id="changeCol" onclick="changeShowCol()" style="display: inline-block;">--%>
    <h1 style="text-align: center;">“<%=request.getParameter("word")%>”的搜索结果：</h1>

</div>

<%
    Lin linformerchantsname=new Lin();
    Lin linforgoodslist=new Lin();
    String word=request.getParameter("word");
    //获取查询的关键词

    String searchGidSql="select * from (version natural join goods) where name like \"%"+word+"%\"";
    //out.print(searchGidSql);
    //在版本表中查询这个商品的详细信息

    ResultSet rs=linforgoodslist.getStmt().executeQuery(searchGidSql);
    while (rs.next()){
        String price = rs.getString("price");
        price = price.subSequence(0, price.length()-2)+"."+price.substring(price.length()-2);
%>

<div style="width: 100% ">
<div class="showone col" >
    <div>
        <div style="display: inline-block;">
            <img style="width: 200px;height: 200px;" src="<%="../"+rs.getString("photo_path")%>">
        </div>
        <div style="display: inline-block">
            <p style="font-size: larger"><%=rs.getString(12)%>  售价：<%=price%>元</p>
            <%--该商品的名字和售价--%>

            <p style="text-decoration: underline">颜色：<%=rs.getString(6)%>  ;重量：<%=rs.getString(7) %>  ;其他属性：<%=show(rs.getString(8))%><%=show(rs.getString(9))%><%=show(rs.getString(10))%></p>
            <%
                //查询商铺名


                String findOutStoreNameSql="select name from merchants where mid="+rs.getString(5);
                ResultSet name=linformerchantsname.getStmt().executeQuery(findOutStoreNameSql);
                //out.print(findOutStoreNameSql);
                name.next();
                out.print(name.getString(1)+" 有售-->");


            %>

            <input type="button" value="进店看看" onclick="send('<%=rs.getString(5)%>','<%=rs.getString(1)%>','<%=rs.getString(12)%>','<%=name.getString(1)%>')">
        </div>
    </div>

</div>

<%
        name.close();
    }
    rs.close();
    linformerchantsname.getStmt().close();
    linforgoodslist.getStmt().close();


%>
</div>
</body>
</html>
