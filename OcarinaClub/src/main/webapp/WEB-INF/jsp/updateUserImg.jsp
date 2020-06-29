<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
	border-bottom: 1px solid white;
}

.page-header .brand {
	color: white;
	text-decoration: none;
	float: left;
}
</style>
</head>
<body>
	<div class=container-fluid>
		<div class="page-header">
			<span class="brand">上传头像</span>
		</div>
		
		<div class="row">
			<div class="col-md-6 col-md-offset-2">
				<form class="form-horizontal" action="<%=response.encodeURL(request.getContextPath() + "/imgUpload")%>" method="post" enctype="multipart/form-data">
					<div class="form-group" >
						<div class="col-md-9">
							<input id="id" class="form-control" name="id" type="hidden" value="${user.id }"/>
						</div>
					</div>
					
					
					<div class="form-group" >
						<div class="col-md-9">
							<input id="userName" class="form-control" name="userName" type="hidden" value="${user.userName}"/>
						</div>
					</div>
					
					<div class="form-group">
						<label for="img" class="col-md-4 control-label">选择头像：</label>
						<div class="col-md-6">
							<input class="form-control" type="file" name="file" id="img"/>
						</div>
						<div class="col-md-2">
							<input class="form-control" type="submit" value="上传"/>
						</div>
					</div>
					
					
				</form>
			</div>
		</div>
		
	</div>
	
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/static/lib/jquery/jquery.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/static/lib/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>