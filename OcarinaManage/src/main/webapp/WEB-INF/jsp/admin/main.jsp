<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/icon.css"></link>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css"></link>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/main.js"></script>
<title>管理页面</title>
</head>
<body class="easyui-layout">
<div class="sshweb_header" data-options="region:'north',border:false,split:true,maxHeight:80,minHeight:80">
		<div class="sshweb_header_left">
			<h1>陶笛社区后台管理系统</h1>
		</div>
		<div class="sshweb_header_right">
			<p style="position:relative;top:-5px;"><img class="userimg" src="${pageContext.request.contextPath}/resources/img/avtar.png"><strong style="position:relative;top:-8px;margin-left:20px;">${username },欢迎您！</strong></p>
			<p><a href="#">网站首页</a>|<a href="#">帮助中心</a>|<a href="${pageContext.request.contextPath }/logout">安全退出</a></p>
		</div>
	</div>
	
	<div class="sshweb_sidebar" data-options="region:'west',border:true,split:true,title:'导航菜单' ,maxWidth:160,minWidth:160">
		<!--折叠Panel和tree -->
		<div class="easyui-accordion" data-options="border:false,fit:true">
			<div title="用户管理" data-options="iconCls:'icon-wrench'" style="padding:5px;">
				<ul class="easyui-tree sshweb_side_tree">
					<li iconCls="icon-users"><a href="#" data-icon="icon-users" data-link="${pageContext.request.contextPath }/userGive">用户授权</a></li>
					<li iconCls="icon-users"><a href="#" data-icon="icon-users" data-link="${pageContext.request.contextPath }/userDelete">用户删除</a></li>
					<li iconCls="icon-users"><a href="#" data-icon="icon-users" data-link="${pageContext.request.contextPath }/userStartFor">用户禁用、启用</a></li>
				</ul>
			</div>
			
			<div title="业务办理" data-options="iconCls:'icon-wrench'" style="padding:5px;">
				<ul class="easyui-tree sshweb_side_tree">
					<li iconCls="icon-advancedsettings2"><a href="#" data-icon="icon-users" data-link="${pageContext.request.contextPath }/doReportMess">举报信息处理</a></li>
					<li iconCls="icon-advancedsettings"><a href="#" data-icon="icon-users" data-link="${pageContext.request.contextPath }/dealPost">帖子信息处理</a></li>
				</ul>
			</div>
		</div>
	</div>
	
	<div class="sshweb_footer" data-options="region:'south',border:true,split:true,maxHeight:30,minHeight:30">
		&copy;2019 OcarinaManage All Rights Reserved 彭超
	</div>
	
	<div class="sshweb_main" data-options="region:'center'">
		<div id="sshweb_tabs" class="easyui-tabs" data-options="border:false,fit:true">
			<div title="首页" data-options="href:'${pageContext.request.contextPath }/main/index', closable:false,iconCls:'icon-tip',cls:'pd3'"></div>
		</div>
	</div>
</body>
</html>