<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>陶笛社区后台管理系统</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/login.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/md5a.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/aes/aes.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/aes/pad-zeropadding-min.js"></script>
</head>
<body>
		<!--SIGN UP-->
	<h1>陶笛社区后台管理系统</h1>
	<div class="login-form">
		<div class="close"></div>
		<div class="head-info">
			<label class="lbl-1"></label> 
			<label class="lbl-2"> </label> 
			<label class="lbl-3"> </label>
		</div>
		<div class="clear"></div>
		<div class="avtar">
			<img src="${pageContext.request.contextPath}/resources/img/avtar.png" />
		</div>
		<form action="${pageContext.request.contextPath}/login" method="post" onsubmit="logincheck(event)">
			<input type="text" id="username" class="text" name="userName" placeholder="请输入用户名">
			<div class="key">
				<input id="password" type="password" name="password" placeholder="请输入密码">
			</div>
			<div class="signin">
				<input type="submit" value="Login">
			</div>
		</form>
	</div>
	
	<script type="text/javascript">
		function logincheck(event) {
			var username = $("#username").val();
			var password = $("#password").val();
			if(password == '' || username == '') {
				alert("用户名和密码不能为空!");
				event.preventDefault();
				return false;
			}
			var newpassword = md5(password);
			$("#password").val(newpassword);
			if($("#password").val().length != 32){
				event.preventDefault();
				return false;
			}
			return true;
		}
	</script>
</body>
</html>