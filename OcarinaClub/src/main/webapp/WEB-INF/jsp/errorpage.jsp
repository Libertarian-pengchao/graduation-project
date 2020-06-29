<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>陶笛社区</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/static/css/header.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/static/lib/bootstrap/css/bootstrap.min.css" />
<!--[if lt IE 9]>
     <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
     <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
<![endif]-->

<style type="text/css">
	p{
		font-size:20px;
	}
</style>
</head>
<body>

	<div>
		<p class="pager">出现了一点小问题，返回<a href="<%=response.encodeURL(request.getContextPath() + "/")%>">首页</a></p>
	</div>
	
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/static/lib/jquery/jquery.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/static/lib/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>