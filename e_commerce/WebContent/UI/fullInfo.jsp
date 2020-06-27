<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" import="java.sql.*,bean.Lin" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%request.setCharacterEncoding("utf-8"); %>
    <title>商品详细信息</title>
    <link rel="stylesheet" type="text/css" href="../css/fullInfo.css">
    <script type="text/javascript" src="jquery-3.5.1.min.js"></script>
    <script type="text/javascript">
    function addCartv2(vid,id,name) {
        var mun=$("#shu"+id).text();
        //选取当前的数字
        if(parseInt(mun)<=0)
        {
            alert("请重新选择数量");
        }
        else
        { 
            var myuid='<%=(String) application.getAttribute("activelogin")%>';
            //当前登录的用户
            var mygid='<%=request.getParameter("gid")%>';
            //选择的gid
            
        //开始创建表单
       	var ids = name;

        // 请求的url
        var url = "addCart.jsp?gid="+mygid+"&vid="+vid+"&num="+mun;
        
        // 创造一个Don元素,这里是表单
        var turnForm = document.createElement("form");

        // 将表单加入body中 
        document.body.appendChild(turnForm);

        //请求方式 默认为post
        var method = ids['methond'] || "POST"; 
        turnForm.method = method;
        
        // 弹出新窗口
        turnForm.target = '_blank';
        
        // 请求地址
        turnForm.action = url;

        // 创建表单元素，用来存储值，传递给后台。这里创建的隐藏域。
        var newElement = document.createElement("input");
        newElement.setAttribute("type", "hidden");

        // 设置Name属性
        newElement.setAttribute("name", "goodsName");

        // 将创造的隐藏域添加到Form中
        turnForm.appendChild(newElement);
        newElement.setAttribute("value", ids);// 赋值

        // 提交表单
        turnForm.submit();
        }
    }
        //加入购物车，检查数量
        
        
        function buyNowv2(i,nowkuchun,id) {
            var num=$("#shu"+id).text();
            //选取当前的数字
            if(parseInt(num)<=0 )
            {
                alert("数量有误，请重新选择数量");
            }else if(parseInt(num)>parseInt(nowkuchun)){
                alert("您选择的数量超出库存，请重新选择");
            }
            else
            { 
                var myuid='<%=(String) application.getAttribute("activelogin")%>';
                var mygid='<%=request.getParameter("gid")%>';

                window.open("./confirmOrder.jsp?gid="+mygid+"&vid="+i+"&num="+num);}
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
        
        function changeShowCol() {
            if($('.col').is('.showone')){
                $('.col').removeClass('showone');
                $('.col').addClass('showtwo');
                $('#btn').text('单列显示');
            }else {
                $('.col').addClass('showone');
                $('.col').removeClass('showtwo');
                $('#btn').text('双列显示');
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
<%
String goodsName= request.getParameter("goodsName");
%>
<div>
    <a id="btn" onclick="changeShowCol()" style="display:inline-block;">双行显示</a>
    <h1 id="username" >欢迎来到<%=request.getParameter("merchantsName")%>！用户：<%=(String) application.getAttribute("activelogin")%></h1>
    <h2 id="tit1">本店对您选择的商品（<%=goodsName%>），有以下版本在售：</h2>
</div>
<div style="width: 100%">
<%
String mid=request.getParameter("mid");
String gid=request.getParameter("gid");

String sql="select * from version where gid="+gid+" and mid="+mid;

Lin linforgoodsinfo=new Lin();

ResultSet rs=linforgoodsinfo.getStmt().executeQuery(sql);
int i=1;
int vid;
try{
    while (rs.next()){
%>
		<div class="gid_<%=gid%> col showone" id="<%=i%>" style=" border: 1px solid red;  height: auto">
    		<%
        	String picurl=rs.getString("photo_path");
    		picurl = "../"+picurl;
    		%>
    		<div>
    			<div style="display: inline-block">
                	<img src="<%=picurl%>" style="width: 200px; height: 200px;display: inline-block"><br>
            	</div>
    			<%--选取图片的地址--%>
        		<div style="display: inline-block">
        
				<% 
				vid= rs.getInt("vid");
				String price = rs.getString("price");
				price = price.subSequence(0, price.length()-2)+"."+price.substring(price.length()-2);
				%>
   				价格：<%=price%>元<br>
    			库存：<%=rs.getString("stock")%>件<br>
    			颜色：<%=rs.getString("color")%><br>
    			重量：<%=rs.getString("weight")%>克<br>
    			其他：<%=show(rs.getString("other1"))%><%=show(rs.getString("other2"))%><%=show(rs.getString("other3"))%><br>
        		
					<input type="button" id="a_<%=vid%>" onclick="addCartv2('<%=vid%>','<%=i%>','<%=goodsName %>')" value="加入购物车">
					<input type="button" id="b_<%=vid%>" onclick="buyNowv2(<%=vid%>,'<%=rs.getString(4)%>',<%=i%>)" value="立即购买">
    				<div id="shuliang" >
        				<input type="button" id="dis<%=i%>" value="减一份"  onclick="disv2(<%=i%>)" style="display: inline-block">
        				<p id="shu<%=i%>" style="display: inline-block">1</p>
        				<input type="button" id="add<%=i%>" value="加一份" onclick="addv2(<%=i%>)" style="display: inline-block">
    				</div>
    				<br>
				</div>
			</div>
		</div>
<%
    i+=1;
    }
   }
catch (SQLException e){
    e.printStackTrace();
}
finally {
    rs.close();
    linforgoodsinfo.close();
}
%>
</div>

</body>
</html>
