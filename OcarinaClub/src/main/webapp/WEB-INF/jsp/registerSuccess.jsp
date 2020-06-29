<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>注册成功</title>
</head>
<body>
	<div class="container">
		<p>
		恭喜<span style="font-weight: bold;">${username}</span>注册成功，返回重新
		<a href="<%=request.getContextPath()%>/" style="text-decoration: none">登录</a>
		</p>
	</div>
</body>
</html>