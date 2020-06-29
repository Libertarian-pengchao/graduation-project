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

</head>
<body>
<nav class="navbar navbar-static-top" style="height:80px; padding-top: 12px;background-color: #107BF8">
		<div class="container">
			<div class="row">
				<div class="navbar-header">
					<a href="<%=response.encodeURL(request.getContextPath() + "/safe")%>" class="navbar-brand" style="font-size:25px;color:black;">安全中心 | 更换密保手机</a>
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
					<label for="oldphone" class="col-md-3 control-label">旧手机号：</label>
					<div class="col-md-8">
						<input class="form-control" placeholder="请输入旧手机号码" type="text" name="oldphone" id="oldphone" onfocus="oldphonecheck()"/>
					</div>
				</div>
				<div class="col-md-offset-8 hidden" style="color:red;" id="oldphonelabel" ></div>
				
				<div class="form-group">
					<label for="newphone" class="col-md-3 control-label">新手机号：</label>
					<div class="col-md-8">
						<input class="form-control" placeholder="请输入新手机号码" type="text" name="newphone" id="newphone" onfocus="newphonecheck()"/>
					</div>
				</div>
				<div class="col-md-offset-8 hidden" style="color:red;" id="newphonelabel" ></div>
				
				
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
		
	<script type="text/javascript">
	
		var isUpdate = 0;
		
		function oldphonecheck(){
			$("#oldphone").bind("blur",function(){
				$("#oldphone").val($("#oldphone").val().trim());
				var oldphone = $("#oldphone").val();  //旧手机号
				var oldphonelabel = $("#oldphonelabel");  //旧手机号信息提示
				
				if(oldphone == "" || oldphone == null){
					oldphonelabel.text("手机号不能为空！");
					oldphonelabel.removeClass("hidden");
					oldphonelabel.addClass("show");
					isupdate = 0;
				}else{
					if(!(/^1[34578]\d{9}$/.test(oldphone))){
						oldphonelabel.text("请输入正确的手机号码！");
						oldphonelabel.removeClass("hidden");
						oldphonelabel.addClass("show");
						isupdate = 0;
					}else{
						oldphonelabel.addClass("hidden");
						isupdate = 1;
					}	
					
				}
				
			});
		}
		
		function newphonecheck(){
			$("#newphone").bind("blur",function(){
				$("#newphone").val($("#newphone").val().trim());
				var newphone = $("#newphone").val();  //新手机号
				var newphonelabel = $("#newphonelabel");  //新手机号信息提示
				
				if(newphone == "" || newphone == null){
					newphonelabel.text("手机号不能为空！");
					newphonelabel.removeClass("hidden");
					newphonelabel.addClass("show");
					isupdate = 0;
				}else{
					if(!(/^1[34578]\d{9}$/.test(newphone))){
						newphonelabel.text("请输入正确的手机号码！");
						newphonelabel.removeClass("hidden");
						newphonelabel.addClass("show");
						isupdate = 0;
					}else{
						newphonelabel.addClass("hidden");
						isupdate = 1;
					}	
				}
				
			});
		}
		
		function update(event){
			var sure = confirm("确认修改？");
			if(sure == true){
				$.ajax({
					url:"<%=response.encodeURL(request.getContextPath() + "/phoneNumberUpdate") %>",
					method:"post",
					contentType:"application/json;charset=utf-8",
					data:JSON.stringify({
						oldphone:$("#oldphone").val(),
						newphone:$("#newphone").val(),
						userName:$("#userName").val()
					}),
					success:function(data){ //"ok","error"
						if(data == "ok"){
							alert("修改成功");
							$("#oldphone").val("");
							$("#newphone").val("");
						}else{
							alert("修改失败");
							$("#oldphone").val("");
							$("#newphone").val("");
						}
					}
				});
			}
		}
	</script>
</body>
</html>