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

.username{
	color:white;
	font-weight: bold;
	font-size: 20px;
}

.update{
	width:800px;
	
}
</style>
</head>
<body>
	<div class="container-fluid">
		<div class="page-header">
			<span class="brand">个人信息修改</span>
		</div>
		
		<div class="row">
			<div class="text-center username">${user.userName}</div>
		</div>
		
		<div class="row" style="margin-top: 20px;">
			<div class="center-block update">
				<form class="form-horizontal">
				
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
					
					<div class="form-group" >
						<label for="personalsign" class="col-md-3 control-label" style="color:white;font-size:20px;">交友宣言:</label>
						<div class="col-md-9">
							<textarea id="personalsign" class="form-control" name="personalsign" rows="3" cols="20"></textarea>
						</div>
					</div>
					
					<div class="form-group" >
						<label for="sex" class="col-md-3 control-label" style="color:white;font-size:20px;">性　　别:</label>
						<div class="col-md-9" style="margin-top: 10px">		
							<div class="row" style="color:white;">
								<label class="col-md-6">
									<input name="sex"  type="radio" value="男" checked="checked" id="man">男
								</label>
								<label class="col-md-6">
									<input type="radio" value="女" name="sex"> 女
								</label>
							</div>
						</div>
					</div>
					
					<div class="form-group">
						<div class="col-md-3 col-md-offset-3">
							<button class="btn btn-primary" type="button" id="btnupdate">修改</button>
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
		
		<script type="text/javascript">
			$("#btnupdate").click(function(event){
				var sex = $("#man").attr("checked") == "checked" ? "男" : "女";
				var sure = confirm("确认修改吗？");
				if(sure == true){
					$.ajax({
						url:"<%=response.encodeURL(request.getContextPath() + "/userMessageUpdate") %>",
						method:"post",
						contentType:"application/json;charset=utf-8",
						data:JSON.stringify({
							id:$("#id").val(),
							userName:$("#userName").val(),
							personalsign:$("#personalsign").val(),
							sex:sex
						}),
						success:function(data){ //"ok","error"
							if(data == "ok"){
								var url = "<%=response.encodeURL(request.getContextPath() + "/userMessage") %>"; 
								window.location.href = url;
							}else{
								alert("修改失败！");
							}
						}
					});
				}
			});
		</script>
</body>
</html>