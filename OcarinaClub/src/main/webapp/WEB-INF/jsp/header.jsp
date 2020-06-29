<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
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
					
					<c:if test="${empty user.userName}">
						<ul class="nav navbar-nav navbar-right">
							<li style="font-size:18px;"><a href="#" data-toggle="modal" data-target="#login"><span class="glyphicon glyphicon-log-in"></span>
									登录</a></li>
							<li style="font-size:18px;"><a href="#" data-toggle="modal" data-target="#register"><span class="glyphicon glyphicon-user"></span>
									注册</a></li>
						</ul>
					</c:if>

				</div>
			</div>
		</div>
	</nav>
	
	<!-- 用户登录框 -->
	<div class="modal fade" id="login" aria-hidden="true" data-backdrop="static">
		<div class="modal-dialog" id="userloginmodal">
			<div class="modal-content">
				<div class="modal-header text-center">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title">用户登录</h4>
				</div>
				
				<div class="modal-body">
					<form class="form-horizontal" > <!-- onclick="login(event)" -->
						<div class="form-group">
							<label for="userName" class="col-md-3 control-label">用户名：</label>
							<div class="col-md-8">
								<input class="form-control" placeholder="请输入用户名" type="text" name="userName" id="userName" onfocus="userNamecheck()"/>
							</div>
						</div>
						<div class="col-md-offset-9 hidden" style="color:red;" id="userloglabe"></div>
						
						<div class="form-group">
							<label for="password" class="col-md-3 control-label">密　码：</label>
							<div class="col-md-8">
								<input class="form-control" placeholder="请输入密码" type="password" name="password" id="password" onfocus="passwordcheck()"/>
							</div>
						</div>
						<div class="col-md-offset-9 hidden" style="color:red;" id="passloglabe"></div>
						
						<div class="form-group">
							<label for="phone" class="col-md-3 control-label">手机号：</label>
							<div class="col-md-8">
								<div class=input-group>
									<input class="form-control" placeholder="请输入手机号" type="text" name="phoneNumber" id="phone" onfocus="phonecheck()"/>
									<span class="input-group-btn">
										<button class="btn btn-default" type="button" id="codebtn" onclick="getcode(event)">获取验证码</button>
									</span>
								</div>
							</div>
						</div>
						<div class="col-md-offset-8 hidden" style="color:red;" id="phoneloglabe"></div>
						
						<div class="form-group">
							<label for="code" class="col-md-3 control-label">验证码：</label>
							<div class="col-md-8">
								<input class="form-control" placeholder="请输入验证码" type="text" name="code" id="code" onfocus="codecheck()"/>
							</div>
						</div>
						<div class="col-md-offset-9 hidden" style="color:red;" id="codeloglabe" ></div>
						
						<div class="row">
							<div class="col-md-offset-4 col-md-3">
								<button  class="btn btn-primary" type="button" onclick="login(event)">登录</button>
							</div>
							<div class="col-md-2 ">
								<input  class="btn btn-default" type="reset" value="取消">
							</div>
						</div>
					</form>
					<div class="login-info text-center hidden" id="logininfo"></div>
					<div class="row">
						<div class="">
							<a class="forgetpass col-md-3 col-md-offset-5" href="<%=response.encodeURL(request.getContextPath() + "/findPassword") %>">忘记密码</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	
	<!-- 用户注册框 -->
	<div id="register" class="modal fade" aria-hidden="true" data-backdrop="static">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header text-center">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title">用户注册</h4>
				</div>
				
				<div class="modal-body">
					<form id="registerform" class="form-horizontal" >
						<div class="form-group">
							<label for="userNamereg" class="col-md-3 control-label">用户名：</label>
							<div class="col-md-8">
								<input class="form-control" placeholder="请输入用户名" type="text" name="userName" id="userNamereg" onfocus="reuserNamecheck()" onchange="ckeckName()"/>
							</div>
						</div>
						<div class="col-md-offset-9 hidden" style="color:red;" id="usernamelabel"></div>
						
						<div class="form-group">
							<label for="passwordreg" class="col-md-3 control-label">密　码：</label>
							<div class="col-md-8">
								<input class="form-control" placeholder="请输入密码" type="password" name="password" id="passwordreg" maxlength="12" onfocus="repasswordcheck()"/>
							</div>
						</div>
						<div class="col-md-offset-9 hidden" style="color:red;" id="passwordlabel"></div>
						
						
						<div class="form-group">
							<label for="repasswordreg" class="col-md-3 control-label">重复密码：</label>
							<div class="col-md-8">
								<input class="form-control" placeholder="请输入重复密码" type="password" name="repassword" id="repasswordreg" maxlength="12" onfocus="repasswordrecheck()"/>
							</div>
						</div>
						<div class="col-md-offset-9 hidden" style="color:red;" id="repasswordlabel"></div>
						
						
						
						<div class="form-group">
							<label for="phoneNumberreg" class="col-sm-3 control-label">手机号码：</label>
							<div class="col-md-8">
								<input class="form-control" placeholder="请输入手机号码" type="text" name="phoneNumber" id="phoneNumberreg" onfocus="registerphonecheck()"/>
							</div>
						</div>
						<div class="col-md-offset-8 hidden" style="color:red;" id="phoneNumberlabel"></div>
						
						
						<div class="form-group">
							<label for="sexreg" class="col-md-3 control-label">性　别：</label>
							<div class="col-md-8">
								<div class="row">
									<label class="col-md-4">
										<input type="radio" value="男" checked="checked" name="sex" id="man"> 男
									</label>
									<label class="col-md-4">
										<input type="radio" value="女" name="sex"> 女
									</label>
								</div>
							</div>
						</div>
						
						
						<div class="row">
							<div class="col-md-offset-4 col-md-3">
								<button  class="btn btn-primary" type="button" id="regbtn" onclick="register(event)">注册</button>
							</div>
							<div class="col-md-2 ">
								<input  class="btn btn-default" type="reset" value="取消" >
							</div>
						</div>
						<div class="login-info text-center hidden" id="registerinfo"></div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<div class="container" style="margin-top: -22px;">
		<div class="row">
			<div class="carousel slide" id="myslide" data-ride="carousel">
				<ol class="carousel-indicators">
    				<li data-target="#myslide" data-slide-to="0" class="active"></li>
   					<li data-target="#myslide" data-slide-to="1"></li>
    				<li data-target="#myslide" data-slide-to="2"></li>
    				<li data-target="#myslide" data-slide-to="3"></li>
  				</ol>
  				
  				<div class="carousel-inner" style="height:350px;">
  					 <div class="item active">
  					 	<img src="<%=response.encodeURL(request.getContextPath() + "/static/img/故乡的原风景.jpg")%>" alt="故乡的原风景">
						<div class="carousel-caption">故乡的原风景</div>
  					 </div>
  					 
  					 <div class="item">
  					 	<img src="<%=response.encodeURL(request.getContextPath() + "/static/img/宗次郎.jpg")%>" alt="宗次郎" >
						<div class="carousel-caption">宗次郎</div>
  					 </div>
  					 
  					 <div class="item">
  					 	<img src="<%=response.encodeURL(request.getContextPath() + "/static/img/游学志.jpg")%>" alt="游学志">
						<div class="carousel-caption">游学志</div>
  					 </div>
  					 
  					 <div class="item">
  					 	<img src="<%=response.encodeURL(request.getContextPath() + "/static/img/周子雷.jpg")%>" alt="周子雷">
						<div class="carousel-caption">周子雷</div>
  					 </div>
  					 
  					
  				</div>
  				
  				<a class="left carousel-control" href="#myslide" role="button" data-slide="prev">
  					<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    				<span class="sr-only">上一张</span>
  				</a>
  				
  				<a class="right carousel-control" href="#myslide" role="button" data-slide="next">
  					<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    				<span class="sr-only">下一张</span>
  				</a>
			</div>
		</div>
	</div>
	
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/static/lib/jquery/jquery.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/static/lib/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/static/js/header.js"></script>
	
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/static/lib/md5a.js"></script>
		
		
	<script type="text/javascript">
	
	<%response.encodeURL(request.getContextPath() + "/userNameRegCheck"); %>
	var isSubmit = 0;
	var isRegister = 0;
	
	//检测注册用户名是否重复
	function ckeckName(){
		var username = $("#userNamereg").val();  //用户名
		var usernamelabel = $("#usernamelabel");  //用户名信息提示
		$.ajax({
			url:"<%=response.encodeURL(request.getContextPath() + "/userNameRegCheck") %>",
			method:"post",
			contentType:"application/json;charset=utf-8",
			data:JSON.stringify({
				userName:username,
			}),
			success:function(data){ //"ok","error"
				if(data == "ok"){
					isRegister = 1;
				}else{
					isRegister = 0;
					usernamelabel.text("用户名已存在！");
					usernamelabel.removeClass("hidden");
					usernamelabel.addClass("show");
				}
			}
		});
	}
	
	//注册用户名检测
	function reuserNamecheck(){
		$("#userNamereg").bind("blur",function(){
			$("#userNamereg").val($("#userNamereg").val().trim());
			var username = $("#userNamereg").val();  //用户名
			var usernamelabel = $("#usernamelabel");  //用户名信息提示
			
			if(username == "" || username == null){
				usernamelabel.text("用户名不能为空！");
				usernamelabel.removeClass("hidden");
				usernamelabel.addClass("show");
				isRegister = 0;
			}else{
				usernamelabel.addClass("hidden");
				isRegister = 1;
			}
			
		});
	}
	
	//注册密码检测
	function repasswordcheck(){
	
		$("#passwordreg").bind("blur",function(){
			$("#passwordreg").val($("#passwordreg").val().trim());
			var password = $("#passwordreg").val();  //密码
			var passwordlabel = $("#passwordlabel");  //密码信息提示
			
			if(password == "" || password == null){
				passwordlabel.text("密码不能为空！");
				passwordlabel.removeClass("hidden");
				passwordlabel.addClass("show");
				isRegister = 0;
			}else{
				passwordlabel.addClass("hidden");
				isRegister = 1;
			}
		});
	}
	
	//注册重复密码检测
	function repasswordrecheck(){
		
		$("#repasswordreg").bind("blur",function(){
			var password = $("#passwordreg").val();  //密码
			$("#repasswordreg").val($("#repasswordreg").val().trim());
			var repassword = $("#repasswordreg").val();  //重复密码
			var repasswordlabel = $("#repasswordlabel");  //重复密码信息提示
			
			if(repassword == "" || repassword == null){
				repasswordlabel.text("重复密码不能为空！");
				repasswordlabel.removeClass("hidden");
				repasswordlabel.addClass("show");
				isRegister = 0;
			}else{
				
				if(repassword != password){
					repasswordlabel.text("两次输入密码不一致");
					repasswordlabel.removeClass("hidden");
					repasswordlabel.addClass("show");
					isRegister = 0;
				}else{
					repasswordlabel.addClass("hidden");
					isRegister = 1;
				}
			}
				
			
		});
	}
	
	//注册手机号检测
	function registerphonecheck(){
		
		$("#phoneNumberreg").bind("blur",function(){
			$("#phoneNumberreg").val($("#phoneNumberreg").val().trim());
			var phoneNumber = $("#phoneNumberreg").val();  //电话号码
			var phoneNumberlabel = $("#phoneNumberlabel"); //电话号码信息提示
			
			if(phoneNumber == "" || phoneNumber == null){
				phoneNumberlabel.text("手机号码不能为空！");
				phoneNumberlabel.removeClass("hidden");
				phoneNumberlabel.addClass("show");
				isRegister = 0;
			}else{
				if(!(/^1[34578]\d{9}$/.test(phoneNumber))){
					phoneNumberlabel.text("请输入正确的手机号码！");
					phoneNumberlabel.removeClass("hidden");
					phoneNumberlabel.addClass("show");
					isRegister = 0;
				}else{
					phoneNumberlabel.addClass("hidden");
					isRegister = 1;
				}
			}
			
		});
	}
	
	function registerCheckAll(){
		$("#phoneNumberreg").val($("#phoneNumberreg").val().trim());
		var phoneNumber = $("#phoneNumberreg").val();  //电话号码
		var phoneNumberlabel = $("#phoneNumberlabel"); //电话号码信息提示
		
		if(phoneNumber == "" || phoneNumber == null){
			phoneNumberlabel.text("手机号码不能为空！");
			phoneNumberlabel.removeClass("hidden");
			phoneNumberlabel.addClass("show");
			isRegister = 0;
		}else{
			if(!(/^1[34578]\d{9}$/.test(phoneNumber))){
				phoneNumberlabel.text("请输入正确的手机号码！");
				phoneNumberlabel.removeClass("hidden");
				phoneNumberlabel.addClass("show");
				isRegister = 0;
			}else{
				phoneNumberlabel.addClass("hidden");
				isRegister = 1;
			}
		}
		
		var password = $("#passwordreg").val();  //密码
		$("#repasswordreg").val($("#repasswordreg").val().trim());
		var repassword = $("#repasswordreg").val();  //重复密码
		var repasswordlabel = $("#repasswordlabel");  //重复密码信息提示
		
		if(repassword == "" || repassword == null){
			repasswordlabel.text("重复密码不能为空！");
			repasswordlabel.removeClass("hidden");
			repasswordlabel.addClass("show");
			isRegister = 0;
		}else{
			
			if(repassword != password){
				repasswordlabel.text("两次输入密码不一致");
				repasswordlabel.removeClass("hidden");
				repasswordlabel.addClass("show");
				isRegister = 0;
			}else{
				repasswordlabel.addClass("hidden");
				isRegister = 1;
			}
		}
		
		$("#passwordreg").val($("#passwordreg").val().trim());
		var password = $("#passwordreg").val();  //密码
		var passwordlabel = $("#passwordlabel");  //密码信息提示
		
		if(password == "" || password == null){
			passwordlabel.text("密码不能为空！");
			passwordlabel.removeClass("hidden");
			passwordlabel.addClass("show");
			isRegister = 0;
		}else{
			passwordlabel.addClass("hidden");
			isRegister = 1;
		}
		
		$("#userNamereg").val($("#userNamereg").val().trim());
		var username = $("#userNamereg").val();  //用户名
		var usernamelabel = $("#usernamelabel");  //用户名信息提示
		
		if(username == "" || username == null){
			usernamelabel.text("用户名不能为空！");
			usernamelabel.removeClass("hidden");
			usernamelabel.addClass("show");
			isRegister = 0;
		}else{
			usernamelabel.addClass("hidden");
			isRegister = 1;
		}
		
	}
	
	//用户注册
	function register(event){
		
		var username = $("#userNamereg").val();  //用户名
		var password = $("#passwordreg").val();  //密码
		var phoneNumber = $("#phoneNumberreg").val();  //电话号码
		var sex = $("#man").attr("checked") == "checked" ? "男" : "女";

		
		registerCheckAll();

		if(isRegister == 0){
			event.preventDefault();
			return false;
		}else{
			var newpassword = md5(password);
			$("#passwordreg").val(newpassword);
			$("#repasswordreg").val(newpassword);
			
			if($("#passwordreg").val().length != 32){
				event.preventDefault();
				return false;
			}
			
			$.ajax({
				url:"<%=response.encodeURL(request.getContextPath() + "/userRegister") %>",
				method:"post",
				contentType:"application/json;charset=utf-8",
				data:JSON.stringify({
					userName:username,
					password:newpassword,
					phoneNumber:phoneNumber,
					sex:sex
				}),
				success:function(data){ //"ok","error"
					if(data == "ok"){
						var url = "<%=response.encodeURL(request.getContextPath() + "/registerSuccess") %>"; 
						window.location.href = url;
					}else{
						$("#registerinfo").text("注册失败！");
						$("#registerinfo").removeClass("hidden");
						$("#registerinfo").addClass("show");
					}
				}
			});
		}
	}
	
	
	function loginCheckAll(){
		
		$("#userName").val($("#userName").val().trim());
		var userName = $("#userName").val();
		var userloglabe = $("#userloglabe");
		
		if(userName == "" || userName == null){
			userloglabe.text("用户名不能为空！");
			userloglabe.removeClass("hidden");
			userloglabe.addClass("show");
			isSubmit = 0;
		}else{
			userloglabe.addClass("hidden");
			isSubmit = 1;
		}
		
		
		$("#password").val($("#password").val().trim());
		var password = $("#password").val();
		var passloglabe = $("#passloglabe");
		if(password == "" || password == null){
			passloglabe.text("密码不能为空！");
			passloglabe.removeClass("hidden");
			passloglabe.addClass("show");
			isSubmit = 0;
		}else{
			passloglabe.addClass("hidden");
			isSubmit = 1;
		}
		
		$("#phone").val($("#phone").val().trim());
		var phone = $("#phone").val();
		var phoneloglabe = $("#phoneloglabe");
		if(phone == "" || phone == null){
			phoneloglabe.text("手机号码不能为空！");
			phoneloglabe.removeClass("hidden");
			phoneloglabe.addClass("show");
			isSubmit = 0;
		}else{
			if(!(/^1[34578]\d{9}$/.test(phone))){
				phoneloglabe.text("请输入正确的手机号码！");
				phoneloglabe.removeClass("hidden");
				phoneloglabe.addClass("show");
				isSubmit = 0;
			}else{
				phoneloglabe.addClass("hidden");
				isSubmit = 1;
			}
		}
		
		$("#code").val($("#code").val().trim());
		var code = $("#code").val();
		var codeloglabe = $("#codeloglabe");
		
		if(code == "" || code == null){
			codeloglabe.text("验证码不能为空！");
			codeloglabe.removeClass("hidden");
			codeloglabe.addClass("show");
			isSubmit = 0;
		}else{
			codeloglabe.addClass("hidden");
			isSubmit = 1;
		}
	}
	//登录用户名检测
	function userNamecheck(){
		$("#userName").bind("blur",function(){
			$("#userName").val($("#userName").val().trim());
			var userName = $("#userName").val();
			var userloglabe = $("#userloglabe");
			
			if(userName == "" || userName == null){
				userloglabe.text("用户名不能为空！");
				userloglabe.removeClass("hidden");
				userloglabe.addClass("show");
				isSubmit = 0;
			}else{
				userloglabe.addClass("hidden");
				isSubmit = 1;
			}
		});
	}
	
	//登录密码检测
	function passwordcheck(){
		$("#password").bind("blur",function(){
			$("#password").val($("#password").val().trim());
			var password = $("#password").val();
			var passloglabe = $("#passloglabe");
			if(password == "" || password == null){
				passloglabe.text("密码不能为空！");
				passloglabe.removeClass("hidden");
				passloglabe.addClass("show");
				isSubmit = 0;
			}else{
				passloglabe.addClass("hidden");
				isSubmit = 1;
			}
		});
		
	}
	
	//登录电话号码验证
	function phonecheck(){
		$("#phone").bind("blur",function(){
			$("#phone").val($("#phone").val().trim());
			var phone = $("#phone").val();
			var phoneloglabe = $("#phoneloglabe");
			if(phone == "" || phone == null){
				phoneloglabe.text("手机号码不能为空！");
				phoneloglabe.removeClass("hidden");
				phoneloglabe.addClass("show");
				isSubmit = 0;
			}else{
				if(!(/^1[34578]\d{9}$/.test(phone))){
					phoneloglabe.text("请输入正确的手机号码！");
					phoneloglabe.removeClass("hidden");
					phoneloglabe.addClass("show");
					isSubmit = 0;
				}else{
					phoneloglabe.addClass("hidden");
					isSubmit = 1;
				}
			}
		});
	}
	
	//登录验证码验证
	function codecheck(){
		$("#code").bind("blur",function(){
			$("#code").val($("#code").val().trim());
			var code = $("#code").val();
			var codeloglabe = $("#codeloglabe");
			
			if(code == "" || code == null){
				codeloglabe.text("验证码不能为空！");
				codeloglabe.removeClass("hidden");
				codeloglabe.addClass("show");
				isSubmit = 0;
			}else{
				codeloglabe.addClass("hidden");
				isSubmit = 1;
			}
		});
	}
	
	//获取验证码
	function getcode(event){
		var phone = $("#phone").val();
		var phoneloglabe = $("#phoneloglabe");
		if(phone == "" || phone == null){
			phoneloglabe.text("手机号码不能为空！");
			phoneloglabe.removeClass("hidden");
			phoneloglabe.addClass("show");
			event.preventDefault();
			return false;
		}else if(!(/^1[34578]\d{9}$/.test(phone))){
			phoneNumberlabel.text("请输入正确的手机号码！");
			phoneNumberlabel.removeClass("hidden");
			phoneNumberlabel.addClass("show");
		}else{
			$.ajax({
				url:"/OcarinaClub/getCode",
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
	
	//用户登录
	function login(event){
		var userName = $("#userName").val();
		var password = $("#password").val();
		var phone = $("#phone").val();
		var code = $("#code").val();
		
		loginCheckAll();
		
		if(isSubmit == 0){
			event.preventDefault();
			return false;
		}else{
			var newpassword = $("#password").val().trim();
			var newpassword = md5(password);
			$("#password").val(newpassword);
			if($("#password").val().length != 32){
				return false;
			}
			$.ajax({
				url:"<%=response.encodeURL(request.getContextPath() + "/userlogin") %>",
				method:"post",
				contentType:"application/json;charset=utf-8", 
				data:JSON.stringify({
					userName:userName,
					password:newpassword,
					phoneNumber:phone,
					code:code	
				}),
				success:function(data){ //"ok","error"
					if(data == "ok"){
						var url = "<%=response.encodeURL(request.getContextPath() + "/") %>";
						window.location.href = url;
					}else{
						$("#logininfo").text("用户名或密码错误！");
						$("#logininfo").removeClass("hidden");
						$("#logininfo").addClass("show");
					}
				}
			});
		}
	}
	
	
	</script>
</body>
</html>