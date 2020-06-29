<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>陶笛社区</title>

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/static/css/header.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/static/lib/bootstrap/css/bootstrap.min.css" />
<!--[if lt IE 9]>
     <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
     <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
<![endif]-->

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
		<div class="row">
			<div style="margin-bottom: 30px;">
				<div class="post" style="border: 1px solid #CCCCCC;padding: 20px;">
					<div class="row" style="line-height: 55.56px;">
						<h3>楼主：${post.publishUserName}</h3>
						<button data-toggle="modal" data-target="#report" class="btn btn-primary pull-right" style="margin-right: 50px;">举报</button>
					</div>
					<div class="row" style="padding:10px;">${post.time}</div>
					<div class="row">
						<div class="row" style="text-indent: 4em;">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${post.postContent} 
						</div>
						<div class="col-md-offset-11">
							<button  class="text-right btn btn-defalut" onclick="postreply()">回复</button>
						</div>
					</div>
				</div>
			
				<div class="row postform hidden" style="margin-top: -30px;">
					<div class="col-md-12">
						<form class="form-horizontal" class="hidden" action="<%=response.encodeURL(request.getContextPath() + "/comment")%>" method="post">
						<div class="form-group">
							<input  type="hidden" class="form-control" value="${post.id}" name="postId">
						</div>
						<div class="form-group">
							<input  type="hidden" class="form-control" value="${post.publishUserName}" name="userName">
						</div>
						<div class="form-group">
							<input  type="hidden" class="form-control" value="${user.userName}" name="replyUsername">
						</div>
						
						<div class="form-group">
							<textarea class="form-control" rows="5" style="resize: none;" name="content" id="postcontent"></textarea>
						</div>
						<div class="row">
							<div class="text-right">
								<button  class="btn btn-primary" type="submit">发表</button>
							</div>
						</div>
					</form>
					</div>
				</div>
			</div>
		</div>
		
		<c:forEach items="${allComment}" var="comment">
			<div class="content" style="margin-bottom: 30px;border: 1px solid #CCCCCC;padding-top: 10px;padding-bottom: 5px;padding-left: 5px;">
				<div class="row">
				<div class="col-md-5"><span>${comment.date}</span> <a href="<%=request.getContextPath()%>/watchothers?userName=${comment.replyUsername}">${comment.replyUsername}</a>回复<a href="<%=request.getContextPath()%>/watchothers?userName=${comment.userName}"> ${comment.userName}</a></div>	
				<div style="margin-top: 20px;">
				<div class="row" style="text-indent: 4em;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${comment.content}</div>
				<div class="col-md-offset-11">
						<button  class="text-right btn btn-defalut" onclick="commentreply()">回复</button>
				</div>
			</div>
			</div>
			</div>
						
			<div class="row commentform hidden " style="margin-top: -30px;">
				<div class="col-md-12">
					<form class="form-horizontal" action="<%=response.encodeURL(request.getContextPath() + "/comment")%>" method="post">
					<div class="form-group">
						<input  type="hidden" class="form-control" value="${post.id}" name="postId">
					</div>
					
					<div class="form-group">
						<input  type="hidden" class="form-control" value="${comment.userName}" name="userName">
					</div>
					<div class="form-group">
						<input  type="hidden" class="form-control" value="${user.userName}" name="replyUsername">
					</div>
					
					<div class="form-group">
						<textarea class="form-control" rows="5" style="resize: none;" name="content" id="commetcontent"></textarea>
					</div>
					<div class="row">
						<div class="text-right" style="margin-bottom: 20px;">
							<button  class="btn btn-primary" type="submit">发表</button>
						</div>
					</div>
				</form>
				</div>
			</div>
		</c:forEach>
	</div>
	
	<div class="modal fade" id="report" aria-hidden="true" data-backdrop="static">
		<div class="modal-dialog" id="userloginmodal">
			<div class="modal-content">
				<div class="modal-header text-center">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title">用户举报</h4>
				</div>
				
				<div class="modal-body">
					<form class="form-horizontal">
					
						<div class="form-group">
							<label for="title" class="col-md-3 control-label">举报标题：</label>
							<div class="col-md-8">
								<input class="form-control" type="text"  name="title" id="title"/>
							</div>
						</div>
						
						<div class="form-group">
							<label for="content" class="col-md-3 control-label">举报信息：</label>
							<div class="col-md-8">
								<textarea rows="5" class="form-control" name="content" id="content"></textarea>
							</div>
						</div>
						
						<div class="form-group">
							<div class="col-md-8">
								<input type="hidden" class="form-control" name="reporterName" id="reporterName" value="${user.userName}"/>
							</div>
						</div>
						
						<div class="form-group">
							<div class="col-md-8">
								<input type="hidden" class="form-control" name="reportPostName" id="reportPostName" value="${post.postName}"/>
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-offset-4 col-md-3">
								<button  class="btn btn-primary" type="button" onclick="report(event)">举报</button>
							</div>
							<div class="col-md-2 ">
								<input  class="btn btn-default" type="reset" value="取消" data-dismiss="modal">
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
		
		var comflag = false;
		var postflag = false;
		function commentreply(){
			if(comflag == false){
				$(".commentform").removeClass("hidden");
				$(".commentform").addClass("show");
				comflag = true;
			}else{
				$(".commentform").addClass("hidden");
				comflag = false;
			}
		}
		
		function postreply(){
			if(postflag == false){
				$(".postform").removeClass("hidden");
				$(".postform").addClass("show");
				postflag = true;
			}else{
				$(".postform").addClass("hidden");
				postflag = false;
			}
		}
		
		function report(){
			$.ajax({
				url:"<%=response.encodeURL(request.getContextPath() + "/report")%>",
				method:"post",
				contentType:"application/json;charset=utf-8",
				data:JSON.stringify({
					title:$("#title").val(),
					content:$("#content").val(),
					reporterName:$("#reporterName").val(),
					reportPostName:$("#reportPostName").val()
				}),
				success:function(data){ //"ok","error"
					if(data == "ok"){
						alert("举报成功，感谢您的帮忙！");
					}else{
						alert("出了点小问题，举报失败！");
					}
				}
			});
		}
	</script>
	
</body>
</html>