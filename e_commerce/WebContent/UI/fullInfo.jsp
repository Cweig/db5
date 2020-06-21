<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*,bean.Lin" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>商品详细信息</title>
    <script type="text/javascript" src="jquery-3.5.1.min.js"></script>
    <script type="text/javascript">
        function addCart(i) {
            var mun=$("#shu").text();
            //选取当前的数字
            if(parseInt(mun)<=0)
            {
                alert("请重新选择数量");
            }
           else
               { alert("将商品gid为<%=(String)request.getParameter("gid")%>,版本号为"+i+"加入购物车");
                var myuid='<%=request.getParameter("uid")%>';
                //当前登录的用户
                var mygid='<%=request.getParameter("gid")%>';
                //选择的gid
                window.open("./addCart.jsp?uid="+myuid+"&gid="+mygid+"&vid="+i+"&num="+mun);
               }
        }
//本函数暂不使用，使用v2版本的函数
        function addCartv2(i,id) {
            var mun=$("#shu"+id).text();
            //选取当前的数字
            if(parseInt(mun)<=0)
            {
                alert("请重新选择数量");
            }
            else
            { alert("将商品gid为<%=(String)request.getParameter("gid")%>,版本号为"+i+"加入购物车");
                var myuid='<%=request.getParameter("uid")%>';
                //当前登录的用户
                var mygid='<%=request.getParameter("gid")%>';
                //选择的gid
                window.open("./addCart.jsp?uid="+myuid+"&gid="+mygid+"&vid="+i+"&num="+mun);
            }
        }
        //加入购物车，检查数量
        function buyNow(i,nowkuchun) {
            var mun=$("#shu").text();
            //选取当前的数字
            if(parseInt(mun)<=0 )
            {
                alert("数量为0，请重新选择数量");
            }else if(parseInt(mun)>parseInt(nowkuchun)){
                alert("您选择的数量超出库存，请重新选择");
            }
            else
           { alert("将商品gid为<%=(String)request.getParameter("gid")%>,版本号为"+i+"立即购买");
            var myuid='<%=request.getParameter("uid")%>';
            var mygid='<%=request.getParameter("gid")%>';

            window.open("./buyNow.jsp?uid="+myuid+"&gid="+mygid+"&vid="+i+"&num="+mun);}
        }
//本函数暂不使用，使用v2版本的函数
        function buyNowv2(i,nowkuchun,id) {
            var mun=$("#shu"+id).text();
            //选取当前的数字
            if(parseInt(mun)<=0 )
            {
                alert("数量有误，请重新选择数量");
            }else if(parseInt(mun)>parseInt(nowkuchun)){
                alert("您选择的数量超出库存，请重新选择");
            }
            else
            { alert("将商品gid为<%=(String)request.getParameter("gid")%>,版本号为"+i+"立即购买");
                var myuid='<%=request.getParameter("uid")%>';
                var mygid='<%=request.getParameter("gid")%>';

                window.open("./buyNow.jsp?uid="+myuid+"&gid="+mygid+"&vid="+i+"&num="+mun);}
        }
    </script>

    <script type="text/javascript">
        var fu=true;//当前选择数字是否小于等于0
        var shu=0;
        //当前选择数字
        function checkFu() {
            if(fu)
                $("#dis").attr('disabled','disabled');

            else
                $("#dis").removeAttr("disabled");
        }
        //如果当前是选择的负数，就禁用减一按钮
/*        function add() {
            shu+=1;

            fu=false;
            checkFu();
            $("#shu").text(shu);
            checkFu();
        }*/
        //加一
        //本函数暂不使用，使用v2版本的函数
/*        function dis() {
            shu-=1;
            checkFu();
            if(parseInt(shu)<=0)
                fu=true;
            $("#shu").text(shu);
            checkFu();
        }*/
        //本函数暂不使用，使用v2版本的函数
        function checkv2(i) {

        }
        function addv2(i) {

            var selectNum=$("#shu"+i).text();
            var addSelectNum=parseInt(selectNum)+1;
            if(parseInt(addSelectNum)>=1)
                $("#dis"+i).removeAttr("disabled");
            $("#shu"+i).text(addSelectNum);

        }
        //加一
        function disv2(i) {
            var selectNum=$("#shu"+i).text();
            var disSelectNum=parseInt(selectNum)-1;
            if(parseInt(disSelectNum)<=0)
                $("#dis"+i).attr('disabled','disabled');
            $("#shu"+i).text(disSelectNum);
        }
        //减一
/*        function sheajax() {
            var num=1;
            var it='aaa';
            var my=$('#shu').text();
            //alert(my);
            $.ajax({
                type:"GET",
                url:"/Servlet1",
                data:{
                    "num":my,
                },
                success:function (da) {

                    alert(da.text());
                },
                error:function (da) {
                    alert("数据请求错误，请重试");
                }
            })
        }*/
        //这个函数用不上，测试函数

    </script>
</head>
<body>
<%!
    public String show(String in){
        if(in==null)
            return "";
        return in;
    }
    //如果字符串是空字符，就不展示
%>
<h1 id="username">欢迎来到<%
ResultSet theMerchantName=new Lin().getStmt().executeQuery("select name from merchants where mid="+request.getParameter("mid"));
if(theMerchantName.next())
    out.print(theMerchantName.getString(1));
%>！用户：<%=request.getParameter("uid")%></h1>
<h2>本店对您选择的商品（<%
ResultSet theGoodsName=new Lin().getStmt().executeQuery("select name from goods where gid="+request.getParameter("gid"));
if(theGoodsName.next())
    out.print(theGoodsName.getString(1));
%>），有以下版本在售：</h2>
<%--获取商品的名字--%>

<% String mid=(String)request.getParameter("mid");

String gid=(String)request.getParameter("gid");

String sql="select * from version where gid="+gid+" and mid="+mid;
//out.print(sql);
ResultSet rs=new Lin().getStmt().executeQuery(sql);
int i=1;
try{
    while (rs.next()){
%>
<div class="gid_<%=gid%>" id="<%=i%>" style=" border: 1px solid red; width: auto; height: auto">

    <%
        String picurl=rs.getString(11);
    	picurl="../"+picurl;
    %>
    <img src="<%=picurl%>"><br>
    <%--选取图片的地址--%>
<% int vid= rs.getInt(1);%>
    价格：
<%=Integer.parseInt(rs.getString(3))/100.0%>元<br>
    库存：
<%=rs.getString(4)%>件<br>
    颜色：
<%=rs.getString(6)%><br>
    重量：
<%=rs.getString(7)%>克<br>
    其他：
<%=show(rs.getString(8))%>
<%=show(rs.getString(9))%>
<%=show(rs.getString(10))%>
    <br>
<input type="button" id="a_<%=rs.getString(1)%>" onclick="addCartv2(<%=rs.getInt(1)%>,<%=i%>)" value="加入购物车">
<input type="button" id="b_<%=rs.getString(1)%>" onclick="buyNowv2(<%=rs.getInt(1)%>,'<%=rs.getString(4)%>',<%=i%>)" value="立即购买">
    <div id="shuliang" >
        <input type="button" id="dis<%=i%>" value="减一份" disabled="disabled" onclick="disv2(<%=i%>)" style="display: inline-block">
        <p id="shu<%=i%>" style="display: inline-block">0</p>
        <input type="button" id="add<%=i%>" value="加一份" onclick="addv2(<%=i%>)" style="display: inline-block">
    </div>

</div>
<br>


<%
    i+=1;
    }}catch (SQLException e){
    e.printStackTrace();
    }
%>

<%--<div id="shuliang" >
    <input type="button" id="dis" value="减一份" disabled="true" onclick="dis()" style="display: inline-block">
    <p id="shu" style="display: inline-block">0</p>
    <input type="button" id="add" value="加一份" onclick="add()" style="display: inline-block">
</div>--%>

</body>
</html>
