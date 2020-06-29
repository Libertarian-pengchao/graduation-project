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

	<div class="container">
		<div class="row" style="margin-top: 100px;">
			<div class="col-md-8 col-md-offset-2">
				<form class="form-horizontal">
					<div class="form-group">
						<label for="userName" class="col-md-3 control-label">用户名：</label>
						<div class="col-md-8">
							<input class="form-control" placeholder="请输入用户名" type="text" name="userName" id="userName" onfocus="userNamecheck()"/>
						</div>
					</div>
					<div class="col-md-offset-9 hidden" style="color:red;" id="userloglabe"></div>
						
					<div class="form-group">
						<label for="phone" class="col-md-3 control-label">手机号：</label>
						<div class="col-md-8">
							<div class=input-group>
								<input class="form-control" placeholder="请输入绑定手机号" type="text" name="phoneNumber" id="phone" onfocus="phonecheck()"/> 
								<span class="input-group-btn">
									<button class="btn btn-default" type="button" id="codebtn" onclick="getcode(event)">获取验证码</button>
								</span>
							</div>
						</div>
					</div>
					<div class="col-md-offset-8 hidden" style="color: red;" id="phoneloglabe"></div>
					
					<div class="form-group">
							<label for="passwordreg" class="col-md-3 control-label">密　码：</label>
							<div class="col-md-8">
								<input class="form-control" placeholder="请输入密码" type="password" name="password" id="password" maxlength="12" onfocus="passwordcheck()"/>
							</div>
						</div>
						<div class="col-md-offset-9 hidden" style="color:red;" id="passwordlabel"></div>
						
						
						<div class="form-group">
							<label for="repasswordreg" class="col-md-3 control-label">重复密码：</label>
							<div class="col-md-8">
								<input class="form-control" placeholder="请输入重复密码" type="password" name="repassword" id="repassword" maxlength="12" onfocus="repasswordrecheck()"/>
							</div>
						</div>
						<div class="col-md-offset-9 hidden" style="color:red;" id="repasswordlabel"></div>
						
					<div class="form-group">
						<label for="code" class="col-md-3 control-label">验证码：</label>
						<div class="col-md-8">
							<input class="form-control" placeholder="请输入验证码" type="text" name="code" id="code" onfocus="codecheck()"/>
						</div>
					</div>
					<div class="col-md-offset-9 hidden" style="color: red;" id="codeloglabe"></div>
					
					
					<div class="form-group">
						<div class="col-md-2 col-md-offset-3">
							<button  class="btn btn-primary" type="button" id="submit">确定</button>
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
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/static/lib/md5a.js"></script>
			
	<script type="text/javascript">
	
	// <%=response.encodeURL(request.getContextPath() + "/updatePassView") %>
	
	var phone = 0;
	var user = 0;
	var pass = 0;
	var repass = 0;
	var code = 0;
	
	$("#submit").click(function(){
		var password = $("#password").val();
		var newpassword = md5(password);
		$("#password").val(newpassword);
		$("#repassword").val(newpassword);
		
		if($("#password").val().length != 32){
			return false;
		}else{
			alert($("#password").val());
			$.ajax({
				url:"<%=response.encodeURL(request.getContextPath() + "/findPass") %>", 
				method:"post",
				contentType:"application/json;charset=utf-8",
				data:JSON.stringify({
					userName:$("#userName").val(),
					phoneNumber:$("#phone").val(),
					password:$("#password").val(),
					code:$("#code").val()
				}),
				success:function(data){ //"ok","error"
					if(data == "ok"){
						alert("密码修改成功！");
						var url = <%=response.encodeURL(request.getContextPath() + "/") %>
						window.location.href = url;
					}else{
						alert("密码修改失败！");
					}
				}
			});
		}
	});
	//手机号检测
	function phonecheck(){
		
		$("#phone").bind("blur",function(){
			$("#phone").val($("#phone").val().trim());
			var phoneNumber = $("#phone").val();  //电话号码
			var phoneNumberlabel = $("#phoneloglabe"); //电话号码信息提示
			
			if(phoneNumber == "" || phoneNumber == null){
				phoneNumberlabel.text("手机号码不能为空！");
				phoneNumberlabel.removeClass("hidden");
				phoneNumberlabel.addClass("show");
				phone = 0;
			}else{
				if(!(/^1[34578]\d{9}$/.test(phoneNumber))){
					phoneNumberlabel.text("请输入正确的手机号码！");
					phoneNumberlabel.removeClass("hidden");
					phoneNumberlabel.addClass("show");
					phone = 0;
				}else{
					phoneNumberlabel.addClass("hidden");
					phone = 1;
				}
			}
			
		});
	}
	
	function passwordcheck(){
	
		$("#password").bind("blur",function(){
			$("#password").val($("#password").val().trim());
			var password = $("#password").val();  //密码
			var passwordlabel = $("#passwordlabel");  //密码信息提示
			
			if(password == "" || password == null){
				passwordlabel.text("密码不能为空！");
				passwordlabel.removeClass("hidden");
				passwordlabel.addClass("show");
				pass = 0;
			}else{
				passwordlabel.addClass("hidden");
				pass = 1;
			}
		});
	}
	
	function repasswordrecheck(){
		
		$("#repassword").bind("blur",function(){
			var password = $("#password").val();  //密码
			$("#repassword").val($("#repassword").val().trim());
			var repassword = $("#repassword").val();  //重复密码
			var repasswordlabel = $("#repasswordlabel");  //重复密码信息提示
			
			if(repassword == "" || repassword == null){
				repasswordlabel.text("重复密码不能为空！");
				repasswordlabel.removeClass("hidden");
				repasswordlabel.addClass("show");
				repass = 0;
			}else{
				
				if(repassword != password){
					repasswordlabel.text("两次输入密码不一致");
					repasswordlabel.removeClass("hidden");
					repasswordlabel.addClass("show");
					repass = 0;
				}else{
					repasswordlabel.addClass("hidden");
					repass = 1;
				}
			}
				
			
		});
	}
	
	
		function codecheck(){
			$("#code").bind("blur",function(){
				$("#code").val($("#code").val().trim());
				var code = $("#code").val();
				var codeloglabe = $("#codeloglabe");
				
				if(code == "" || code == null){
					codeloglabe.text("验证码不能为空！");
					codeloglabe.removeClass("hidden");
					codeloglabe.addClass("show");
					code = 0;
				}else{
					codeloglabe.addClass("hidden");
					code = 1;
				}
			});
		}
		
		function userNamecheck(){
			$("#userName").bind("blur",function(){
				$("#userName").val($("#userName").val().trim());
				var userName = $("#userName").val();
				var userloglabe = $("#userloglabe");
				
				if(userName == "" || userName == null){
					userloglabe.text("用户名不能为空！");
					userloglabe.removeClass("hidden");
					userloglabe.addClass("show");
					user = 0;
				}else{
					userloglabe.addClass("hidden");
					user = 1;
				}
			});
		}
	
	
		function getcode(event){
			var phone = $("#phone").val();
			var phoneloglabe = $("#phoneloglabe");
			if(phone == "" || phone == null){
				phoneloglabe.text("手机号码不能为空！");
				phoneloglabe.removeClass("hidden");
				phoneloglabe.addClass("show");
			}else if(!(/^1[34578]\d{9}$/.test(phone))){
				phoneloglabe.text("请输入正确的手机号码！");
				phoneloglabe.removeClass("hidden");
				phoneloglabe.addClass("show");
			}else{
				$.ajax({
					url:"<%=response.encodeURL(request.getContextPath() + "/getFindPassCode") %>", 
					method:"post",
					contentType:"application/json;charset=utf-8",
					data:JSON.stringify({
						phoneNumber:phone
					}),
					success:function(data){ //"ok","error"
						if(data == "ok"){
							
						}else{
							$.messager.alert("信息提示","获取验证码失败！","info");
						}
					}
				});
			}
		}
	</script>
</body>
</html>