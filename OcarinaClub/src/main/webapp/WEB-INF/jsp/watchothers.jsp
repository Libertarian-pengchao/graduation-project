<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>陶笛视频</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/static/lib/bootstrap/css/bootstrap.min.css" />
<!--[if lt IE 9]>
     <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
     <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
<![endif]-->

<style type="text/css">
body {
	background: linear-gradient(135deg, #3023AE, #C86DD7);
	background-attachment: fixed;
	font-size: 15px;
	font-family: "Helvetica Neue", Helvetica, Microsoft Yahei;
}

* {
	margin: 0;
}

.page-header {
	padding: 20px 30px;
	overflow: hidden;
}

.page-header .brand {
	color: white;
	text-decoration: none;
	float: left;
}

.panel {
	margin: 120px auto 60px;
	text-align: center;
	background-color: white;
	width: 500px;
	border-radius: 10px; /* 来个圆角 */
	padding: 1px;
	transition: box-shadow .30s;
}

.panel:hover {
	box-shadow: #fff 5px 5px 25px;
}

.avatar img {
	width: 120px;
	height: 120px;
	border-radius: 60px;
	margin-top: -60px;
}

h3 {
	font-weight: bold;
	font-size: 16px;
	margin: 15px 0 20px;
}

p.lead {
	color: #333;
	font-style: italic;
	margin-bottom: 30px;
}

p.leadsex{
	color: #333;
	font-style: italic;
	margin-bottom: 20px;
	font-size:15px;
}

.btn {
	color: white;
	background: rgb(48, 35, 174);
	font-size: 16px;
	line-height: 38px;
	height: 38px;
	padding: 0 20px;
	border-radius: 3px;
	display: inline-block;
	text-decoration: none;
	transition: background .15s;
}

.btn:hover {
	background-color: rgb(81, 67, 224);
}

.tags {
	margin-top: 50px;
	margin-bottom: 20px;
	color: #999;
}

.tag {
	margin: 0 15px;
}

.tag:before {
	content: '#'
}
</style>
</head>
<body>
	<div class="container-fluid">
		<div class="page-header">
			<a class="brand"
				href="<%=response.encodeURL(request.getContextPath() + "/")%>">陶笛社区</a>
		</div>

		<section class="panel">
			<p class="avatar">
				<img src="${his.img}" alt="">
			</p>
			<h3>${his.userName}</h3>
			<p class="leadsex">${his.sex}</p>
			<p class="lead">${his.personalsign}</p>
			<p>
				<a class="btn" href="<%=response.encodeURL(request.getContextPath() + "/hisVideos")%>"> 
					<i class="fa fa-bars"></i> 他的作品
				</a>
			</p>
			<p class="tags">
				<span class="tag">ocarina</span> <span class="tag">communicate</span>
				<span class="tag">share</span>
			</p>
		</section>
	</div>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/static/lib/jquery/jquery.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/static/lib/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>