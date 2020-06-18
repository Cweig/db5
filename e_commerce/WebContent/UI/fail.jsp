<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>库存数量不足</title>
</head>
<style>
	body
	{
	height:100vh;
	width:100%;
	margin:0 auto;
	background-repeat:no-repeat;
	background-position:center center;
	overflow:auto;
	}
</style>
<body  background='../img/fail.jpg' >
<div style='text-align:center;font-family:宋体;'>
	<h2 >库存不足，请检查商品数量</h2>
</div>

<script>
window.setTimeout("close()",5000);
</script>
</body>
</html>