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

.title{
	font-size:18px;
}

.title a{
	font-size:20px;
	margin-left: 20px;
	color:black;
	cursor: pointer;
}

.content{
	margin-top:30px;
	margin-left: 5px;
}

.postcontainer div.post{
	margin-bottom: 10px;
	border-top: 1px solid #CCCCCC;
	border-bottom: 1px solid #CCCCCC;
	padding: 15px;
}

.postcontainer div.post:hover{
	background-color:  #CCCCCC;
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
					
				
					
					<form action="<%=response.encodeURL(request.getContextPath() + "/searchPost")%>" class="navbar-form navbar-right" method="post">
						<div class="form-group has-feedback ">
							<input type="text" class="form-control" placeholder="请输入帖子名" name="PostName"/>
							 <span class="glyphicon glyphicon-search form-control-feedback"></span>
						</div>
						<button class="btn btn-primary" type="submit">搜索</button>
					</form>
					
				</div>
			</div>
		</div>
	</nav>
	
	<div class="container">
		<div class="row">
			<ul class="nav nav-tabs">
				<li><a href="<%=response.encodeURL(request.getContextPath() + "/OcarinaClubView")%>">全部</a></li>
				<li><a href="<%=response.encodeURL(request.getContextPath() + "/theme")%>">主题帖</a></li>
				<li><a href="<%=response.encodeURL(request.getContextPath() + "/skill")%>">技术帖</a></li>
				<li><a href="<%=response.encodeURL(request.getContextPath() + "/ask")%>">提问帖</a></li>
				<li class="pull-right"><button class="btn btn-info" data-toggle="modal" data-target="#publishpost">发表新帖</button></li>
			</ul>
		</div>
		
		<c:forEach items="${post}" var="p">
			<div class="row postcontainer">
				<div class="row post">
					<div class="title">${p.publishUserName}<a href="<%=request.getContextPath()%>/postDetail?id=${p.id}">${p.postName}</a></div> 
					<div class="content">${p.postContent}</div>
				</div>
			</div>
		</c:forEach>
	</div>
	
	<!-- 发表新帖模态框 -->
	<div class="modal fade" id="publishpost" aria-hidden="true" data-backdrop="static">
		<div class="modal-dialog" id="userloginmodal">
			<div class="modal-content">
				<div class="modal-header text-center">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title">发表新帖</h4>
				</div>
				
				<div class="modal-body">
					<form class="form-horizontal" > <!-- onclick="login(event)" -->
						<div class="form-group">
							<label for="postName" class="col-md-3 control-label">帖子名：</label>
							<div class="col-md-8">
								<input class="form-control" placeholder="请输入帖子名" type="text" name="postName" id="postName" onfocus="userNamecheck()"/>
							</div>
						</div>
						<div class="col-md-offset-9 hidden" style="color:red;" id="postNamelabe"></div>
						
						<div class="form-group">
							<label for="type" class="col-md-3 control-label">类　型：</label>
							<div class="col-md-8">
								<select name="type" class="form-control" id="type">
									<option value="1" selected="selected">技术贴</option>
									<option value="2">提问帖</option>
									<option value="3">主题帖</option>
								</select>
							</div>
						</div>
						<div class="col-md-offset-9 hidden" style="color:red;" id="passloglabe"></div>
						
						<div class="form-group">
							<label for="postContent" class="col-md-3 control-label">内　容：</label>
							<div class="col-md-8">
								<textarea class="form-control" rows="10" style="resize: none;" name="postContent" id="postContent"></textarea>
							</div>
						</div>
						<div class="col-md-offset-8 hidden" style="color:red;" id="phoneloglabe"></div>
						
						<div class="row">
							<div class="col-md-8">
								<input class="form-control" type="hidden" name="publishUserName" id="publishUserName" value="${user.userName}"/>
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-offset-4 col-md-3">
								<button  class="btn btn-primary" type="button" onclick="publish(event)">发表</button>
							</div>
							<div class="col-md-2 ">
								<input  class="btn btn-default" type="reset" value="取消">
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript"
		src="<%=request.getContextPath()%>/static/lib/jquery/jquery.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/static/lib/bootstrap/js/bootstrap.min.js"></script>
		
	<script type="text/javascript">
		function publish(event){
			$.ajax({
				url:"<%=response.encodeURL(request.getContextPath() + "/publicPost") %>",
				method:"post",
				contentType:"application/json;charset=utf-8",
				data:JSON.stringify({
					postName:$("#postName").val(),
					type:$("#type").val(),
					postContent:$("#postContent").val(),
					publishUserName:$("#publishUserName").val(),
				}),
				success:function(data){ //"ok","error"
					if(data == "ok"){
						var url = "<%=response.encodeURL(request.getContextPath() + "/OcarinaClubView") %>"; 
						window.location.href = url;
					}else{
						alert("发表失败");
					}
				}
			});
		}
	</script>
</body>
</html>