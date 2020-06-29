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
	.modal-body div{
		margin-bottom: 10px;
	}
	
	.login-info{
		margin-top: 20px;
		color:red;
		font-size: 20px;
	}
	
	.forgetpass{
		margin-top: 20px;
		color:red;
		font-size: 18px;
	}
	
	#myslide .carousel-inner > .item > img{
		display: block;
    	width:100%;
   		height:350px;
	}
</style>
</head>
<body>
	<nav class="navbar navbar-static-top navbar-inverse" style="padding-top: 12px;">
		<div class="container">
			<div class="row">
				<div class="navbar-header">
					<a href="<%=response.encodeURL(request.getContextPath() + "/")%>" class="navbar-brand" style="font-size:25px;">陶笛社区</a>
					<button class="navbar-toggle" type="button"
						data-target="#navbarmenu" data-toggle="collapse">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
				</div>

				<div class="collapse navbar-collapse" id="navbarmenu">
					<ul class="nav navbar-nav">
						<li><a href="<%=response.encodeURL(request.getContextPath() + "/")%>" style="font-size:18px;">陶笛视频</a></li>
						<li><a href="<%=response.encodeURL(request.getContextPath() + "/OcarinaMusicView")%>" style="font-size:18px;">陶笛乐曲</a></li>
						<li><a href="<%=response.encodeURL(request.getContextPath() + "/OcarinaBasicView")%>" style="font-size:18px;">陶笛基础</a></li>
						<li><a href="<%=response.encodeURL(request.getContextPath() + "/OcarinaClubView")%>" style="font-size:18px;">陶笛论坛</a></li>
						<li><a href="http://localhost:8081/OcarinaManage/" style="font-size:18px;">后台管理</a></li>
					</ul>
					
					<c:if test="${not empty user.userName}">
						<ul class="nav navbar-nav navbar-right">
							<li style="font-size:18px;" class="dropdown">
								<a  class="btn dropdown-toggle" type="button" id="dropmenue" data-toggle="dropdown" >
									<img style="width:40px; height:30px;border-radius: 50%" src="${user.img}"/> 
									${user.userName} 
									<span class="caret"></span>						
								</a>
								
								<ul class="dropdown-menu" style="background-color:#fee!important;">
									<li><a href="<%=response.encodeURL(request.getContextPath() + "/userMessage")%>">个人中心</a></li>
									<li class="divider "></li>
									<li><a href="<%=response.encodeURL(request.getContextPath() + "/safe")%>">安全中心</a></li>
								</ul>		
							</li>
							<li style="font-size:18px;"><a href="<%=response.encodeURL(request.getContextPath() + "/logout")%>">退出</a></li>
						</ul>
					</c:if> 
				</div>
			</div>
		</div>
	</nav>
	<div class="container">
		<div class="text-center">
			<video src="${play.path}" controls="controls" class="text-center"></video>
		</div>
	</div>
</body>
</html>