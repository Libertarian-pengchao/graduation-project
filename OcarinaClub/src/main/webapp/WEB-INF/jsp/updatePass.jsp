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
</style>
</head>
<body>
	
	<nav class="navbar navbar-static-top" style="height:80px; padding-top: 12px;background-color: #107BF8">
		<div class="container">
			<div class="row">
				<div class="navbar-header">
					<a href="<%=response.encodeURL(request.getContextPath() + "/safe")%>" class="navbar-brand" style="font-size:25px;color:black;">安全中心 | 修改密码</a>
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
	
	<div class="container">
		<div class="row center-block" style="width:500px; margin-top: 50px;">
			<form action="" class="form-horizontal">
				
				<div class="form-group">
					<div class="col-md-8">
						<input class="form-control"  type="hidden" name="userName" value="${user.userName}" id="userName"/>
					</div>
				</div>
			
				<div class="form-group">
					<label for="oldpass" class="col-md-3 control-label">旧密码：</label>
					<div class="col-md-8">
						<input class="form-control" placeholder="请输入旧密码" type="password" name="oldpass" id="oldpass" onfocus="oldpasscheck()"/>
					</div>
				</div>
				<div class="col-md-offset-9 hidden" style="color:red;" id="oldpasslabel" ></div>
				
				<div class="form-group">
					<label for="newpass" class="col-md-3 control-label">新密码：</label>
					<div class="col-md-8">
						<input class="form-control" placeholder="请输入新密码" type="password" name="password" id="newpass" onfocus="newpasscheck()"/>
					</div>
				</div>
				<div class="col-md-offset-9 hidden" style="color:red;" id="newpasslabel" ></div>
				
				<div class="form-group">
					<label for="" class="col-md-3 control-label">重复密码：</label>
					<div class="col-md-8">
						<input class="form-control" placeholder="请重复新密码" type="password" name="renewpass" id="renewpass" onfocus="renewpasscheck()"/>
					</div>
				</div>
				<div class="col-md-offset-8 hidden" style="color:red;" id="renewpasslabel" ></div>
				
				<div class="row" style="margin-top: 10px;">
					<div class="col-md-offset-4 col-md-3">
						<button  class="btn btn-primary" type="button" onclick="update(event)">修改</button>
					</div>
					<div class="col-md-2 ">
						<input  class="btn btn-default" type="reset" value="取消">
					</div>
				</div>
			</form>
		</div>
	</div>
	
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/static/lib/jquery/jquery.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/static/lib/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/static/lib/md5a.js"></script>
		
	<script type="text/javascript">
	
	var isupdate = 0;
	
	function renewpasscheck(){
		$("#renewpass").bind("blur",function(){
			$("#renewpass").val($("#renewpass").val().trim());
			var newpass = $("#newpass").val();  //新密码
			var renewpass = $("#renewpass").val();  //重复密码
			var renewpasslabel = $("#renewpasslabel");  //重复密码信息提示
			
			if(renewpass == "" || renewpass == null){
				renewpasslabel.text("重复密码不能为空！");
				renewpasslabel.removeClass("hidden");
				renewpasslabel.addClass("show");
				isupdate = 0;
			}else{
				if(renewpass != newpass){
					renewpasslabel.text("两次输入密码不一致！");
					renewpasslabel.removeClass("hidden");
					renewpasslabel.addClass("show");
					isupdate = 0;
				}else{
					renewpasslabel.addClass("hidden");
					isupdate = 1;
				}
			}
			
		});
	}
	
	function oldpasscheck(){
		$("#oldpass").bind("blur",function(){
			$("#oldpass").val($("#oldpass").val().trim());
			var oldpass = $("#oldpass").val();  //旧密码
			var oldpasslabel = $("#oldpasslabel");  //旧密码信息提示
			
			if(oldpass == "" || oldpass == null){
				oldpasslabel.text("密码不能为空！");
				oldpasslabel.removeClass("hidden");
				oldpasslabel.addClass("show");
				isupdate = 0;
			}else{
				oldpasslabel.addClass("hidden");
				isupdate = 1;
			}
			
		});
	}
	
	
	function newpasscheck(){
		$("#newpass").bind("blur",function(){
			$("#newpass").val($("#newpass").val().trim());
			var newpass = $("#newpass").val();  //新密码
			var newpasslabel = $("#newpasslabel");  //新密码信息提示
			
			if(newpass == "" || newpass == null){
				newpasslabel.text("密码不能为空！");
				newpasslabel.removeClass("hidden");
				newpasslabel.addClass("show");
				isupdate = 0;
			}else{
				newpasslabel.addClass("hidden");
				isupdate = 1;
			}
			
		});
	}
	
	function update(event){
		var newpass = $("#newpass").val();  //新密码
		var renewpass = $("#renewpass").val();  //重复密码
		
		if(isupdate == 1){
			var isUpdate = confirm("确认修改？");
			if(isUpdate == true){
				var newpassword = md5(newpass);
				$("#newpass").val(newpassword);
				$("#renewpass").val(newpassword);
				$("#oldpass").val(md5($("#oldpass").val()));  //旧密码
				if($("#newpass").val().length != 32){
					event.preventDefault();
					return false;
				}else{
					$.ajax({
						url:"<%=response.encodeURL(request.getContextPath() + "/userPasswordUpdate") %>",
						method:"post",
						contentType:"application/json;charset=utf-8",
						data:JSON.stringify({
							userName:$("#userName").val(),
							oldpass:$("#oldpass").val(),
							password:$("#newpass").val()
						}),
						success:function(data){ //"ok","error"
							if(data == "ok"){
								alert("密码修改成功");
								$("#newpass").val("");
								$("#renewpass").val("");
								$("#oldpass").val("");
							}else{
								alert("密码修改失败");
								$("#newpass").val("");
								$("#renewpass").val("");
								$("#oldpass").val("");
							}
						}
					});
				}
			}
		}
	}
	</script>
</body>
</html>