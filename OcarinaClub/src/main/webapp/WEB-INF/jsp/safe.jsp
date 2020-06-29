<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>陶笛社区</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/static/css/header.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/static/lib/bootstrap/css/bootstrap.min.css" />
<!--[if lt IE 9]>
     <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
     <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
<![endif]-->

<style type="text/css">

.left{
	width:300px;
	height:350px;
	margin-left: 100px;
	margin-top:30px;
	background-color: #F4F9FF;
}

.right{
	height:350px;
	margin-left: 20px;
	margin-top:30px;
	background-color: #FFFFFF;
	font-size:18px;
}
</style>
</head>
<body>
		<nav class="navbar navbar-static-top" style="height:80px; padding-top: 12px;background-color: #107BF8">
		<div class="container">
			<div class="row">
				<div class="navbar-header">
					<a href="<%=response.encodeURL(request.getContextPath() + "/safe")%>" class="navbar-brand" style="font-size:25px;color:black;">安全中心</a>
					<button class="navbar-toggle" type="button"
						data-target="#navbarmenu" data-toggle="collapse">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
				</div>

				<div class="collapse navbar-collapse" id="navbarmenu">	
					<ul class="nav navbar-nav navbar-right">
						<li style="font-size:18px;" class="dropdown">
							<a  class="btn dropdown-toggle disabled" type="button" id="dropmenue" data-toggle="dropdown" style="color:black;">
								<img style="width:40px; height:30px;border-radius: 50%" src="${user.img}"/> 
								${user.userName} 				
							</a>
		
						</li>
						<li style="font-size:18px;margin-top: 5px;"><a style="color:black;" href="<%=response.encodeURL(request.getContextPath() + "/")%>">首页</a></li>
					</ul>
				</div>
			</div>
		</div>
	</nav>
	
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-4 left">
				<div style="margin-top: 50px;">
					<img alt="" src="${user.img}" style="width:100px;height:100px;border-radius: 50%;" class="center-block">
				</div>
				
				<div class="text-center" style="margin-top: 30px;font-size:18px;">
					你好,<span style="font-weight: bolder;font-size:18px;">${user.userName} </span>
				</div>
				
				<div class="text-center">
					<a href="<%=response.encodeURL(request.getContextPath() + "/updatePassView") %>" class="btn btn-primary " style="margin-top: 30px;">修改密码</a>
				</div>
			</div>
			<div class="col-md-8 right">
				<div>我的密保</div>
				<div class="row">
					<div class="col-md-2">
						<span class="glyphicon glyphicon-phone" style="font-size:40px;color:#2F6DF6;margin-left: 40px;margin-top: 20px;"></span>
					</div>
					<div class="col-md-4">
						<div class="row" style="margin-top: 15px;">
							<div>
								<div>密保手机</div>
							</div>
							<div>
								<div>已设置：${user.phoneNumber}</div>
							</div>
						</div>
					</div>
					
					<div class="col-md-2 col-md-offset-4">
						<a href="<%=response.encodeURL(request.getContextPath() + "/updatePhoneView")%>" class="btn btn-primary btn-lg" style="margin-top: 25px;">更换</a>
					</div>
				</div>
			</div>
		</div>
	</div>
		<script type="text/javascript"
		src="<%=request.getContextPath()%>/static/lib/jquery/jquery.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/static/lib/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>