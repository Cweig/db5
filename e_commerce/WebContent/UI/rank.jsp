
<%@ page contentType="text/html;charset=UTF-8" language="java"  import="bean.Lin,java.sql.ResultSet" %>
<html>
<head>
    <title>商品排序</title>
    <link rel="stylesheet" type="text/css" href="css/rank.css">
    <script type="text/javascript">
        function send(m,g,l){
            //alert('mid='+m+',cid='+c);
            //window.open("./fullInfo.jsp?mid="+m+"&gid="+g+"&uid="+l);
            window.open("./fullInfo.jsp?mid="+m+"&gid="+g);
        }
    </script>
</head>
<body>
<%
    String active=(String) application.getAttribute("activelogin");
    //active="1000000002";
%>
<h1>销量排行</h1>
<%!
    public String show(String in){
        if(in==null)
            return "";
        return in;
    }
    //如果字符串是空字符，就不展示
%>
<div id="rankInfo">
    <ol type="1">
<%
    Lin uselin=new Lin();
    ResultSet goodList = uselin.getStmt().executeQuery("select * from (select vid,gid,mid,color,weight,other1,other2,other3 from version ) as t1 natural join(select vid,sum(qty) as s from shopping_record group by vid ) as t2 order by s desc ");
    Lin uselintoname=new Lin();
    Lin uselintomerchantname=new Lin();
    while (goodList.next()){
%>
        <li>
            <div style="border: orange 1px dotted">
                <p>商品名：<%
                    String findOutGoodsName="select name from goods where gid="+goodList.getString(2);
                    ResultSet goodsname=uselintoname.getStmt().executeQuery(findOutGoodsName);
                    //ResultSet goodsname=uselintoname.executeQuery(findOutGoodsName);
                    goodsname.next();
                %>
                    <myc onclick="send('<%=goodList.getString(3)%>','<%=goodList.getString(2)%>','<%=active%>')"><%=goodsname.getString(1)%></myc>
                    <%--进入商品的详细页面--%>
                    <%--输出商品名字--%>

                </p>
                <p>店面：<%
                        String findOutMerchantName="select name from merchants where mid="+goodList.getString(3);
                        ResultSet merchantname=uselintomerchantname.getStmt().executeQuery(findOutMerchantName);
                        merchantname.next();
                        %>
                    <%=merchantname.getString(1)%>
                    <%--查询并输出店名--%>
                </p>
                <p style="display: inline-block; border-bottom: rebeccapurple 1px">颜色：<%=goodList.getString(4)%></p>
                <p style="display: inline-block; border-bottom: greenyellow 1px">重量：<%=goodList.getString(5)%></p>
                <p style="display: inline-block; border-bottom: orange 1px ">其他属性：<%=show(goodList.getString(6))%>,  <%=show(goodList.getString(7))%>,  <%=show(goodList.getString(8))%></p>
                <h3>销量：<%=goodList.getString(9)%></h3>
            </div>
            <br>
        </li>

<%}
/*uselin.close();
uselintoname.close();
uselintomerchantname.close();*/

//uselin.getConn().close();

//uselintoname.getConn().close();

//uselintomerchantname.getConn().close();
    uselin.getStmt().close();
    uselintoname.getStmt().close();
    uselintomerchantname.getStmt().close();
%>
    </ol>
</div>
</body>
</html>
