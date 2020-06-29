<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/icon.css"></link>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/easyui/locale/easyui-lang-zh_CN.js"></script>
</head>
<body>
	<div class="easyui-layout" data-options="fit:true">
		<table id="usersDatagrid" style="text-align:center;"></table>
		<div id="usersToolbar">
			<div class="usersToolbar_button" style="height: 40px;">
				<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="all_report()" plain="true">全部</a>
				<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="done_report()" plain="true">已处理</a>
				<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="nodo_report()" plain="true">未处理</a>
				<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="chandone_report()" plain="true">标记已处理</a>
				<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="user_deletereport()" plain="true">删除</a>
	            <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="user_cancel()" plain="true">取消</a>
	            <a href="#" class="easyui-linkbutton" iconCls="icon-reload" onclick="user_reload()" plain="true">刷新</a>
			</div>
			<div style="height: 40px;">
				<label>举报标题：</label><input class="easyui-textbox" id="user_searchbox" style="width:150px,height:24px;">
            	<a href="#" class="easyui-linkbutton" iconCls="icon-search" id="user_searchbtn">开始检索</a>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		
		$(function(){
			
			$("#user_searchbtn").bind("click",function(){
				var queryParams = $("#usersDatagrid").datagrid("options").queryParams;
				queryParams.title = $("#user_searchbox").textbox("getValue");
				$("#usersDatagrid").datagrid("load");
			});
			
			$("#usersDatagrid").datagrid({
				url:"/OcarinaManage/getAllPagerReportMess",
				pagination:true,
				pageSize:10,
				toolbar:"#usersToolbar",
				columns:[[
					{field:"ck",checkbox:true},
					{field:"id",title:"举报信息编码",width:200},
					{field:"reporterName",title:"举报人用户名",width:200},
					{field:"dealName",title:"处理人用户名",width:200},
					{field:"title",title:"举报信息标题",width:200},
					{field:"content",title:"举报信息内容",width:200},
					{field:"isDeal",title:"是否处理",width:200,formatter:function(value,row,index){
						if(value == 1){
							return "已处理";
						}else{
							return "未处理";
						}
					}},
					{field:"reportPostName",title:"被举报的帖子名",width:200},
				]],
			});
		});
		
		function user_reload(){
			$("#usersDatagrid").datagrid("reload");
		}
		
		function user_cancel() {
			$("#usersDatagrid").datagrid("rejectChanges");
		}
		
		function user_deletereport(){
			var rows = $("#usersDatagrid").datagrid("getSelections");
			if(rows.length <= 0){
				$.messager.alert("信息提示","请选择要删除的举报信息！","info");
			}else{
				var isContainNoDeal = "";
				for(var i=0; i < rows.length; i++){
					if(rows[i].isDeal == 0){
						isContainNoDeal = true;
					}
				}
				if(isContainNoDeal){
					$.messager.alert("信息提示","不能删除未处理信息！","info");
				}else{
					var ids = new Array();
					for(var i=0; i < rows.length; i++){
						ids.push(rows[i].id);
					}
					$.ajax({
						url:"/OcarinaManage/reportMessDelete",
						method:"post",
						data:{
							ids:ids
						},
						success:function(data){ //"ok","error"
							if(data == "ok"){
								$("#usersDatagrid").datagrid("reload");
							}else{
								$.messager.alert("信息提示","删除失败！","info");
							}
						}
					});
				}	
			}
		}
		
		function chandone_report(){
			var rows = $("#usersDatagrid").datagrid("getSelections");
			if(rows.length <= 0){
				$.messager.alert("信息提示","请至少选择一条举报信息！","info");
			}else{
				var isContainNoDeal = "";
				for(var i=0; i < rows.length; i++){
					if(rows[i].isDeal == 1){
						isContainNoDeal = true;
					}
				}
				if(isContainNoDeal){
					$.messager.alert("信息提示","该信息已经处理过！","info");
				}else{
					var ids = new Array();
					for(var i=0; i < rows.length; i++){
						ids.push(rows[i].id);
					}
					$.ajax({
						url:"/OcarinaManage/reportMessChangeDone",
						method:"post",
						data:{
							ids:ids
						},
						success:function(data){ //"ok","error"
							if(data == "ok"){
								$("#usersDatagrid").datagrid("reload");
							}else{
								$.messager.alert("信息提示","标记失败！","info");
							}
						}
					});
				}	
			}
		}
		
		function all_report(){
			var queryParams = $("#usersDatagrid").datagrid("options").queryParams;
			queryParams.isDeal = -1;
			$("#usersDatagrid").datagrid("load");
		}
		
		function done_report(){
			var queryParams = $("#usersDatagrid").datagrid("options").queryParams;
			queryParams.isDeal = 1;
			$("#usersDatagrid").datagrid("load");
		}

		function nodo_report(){
			var queryParams = $("#usersDatagrid").datagrid("options").queryParams;
			queryParams.isDeal = 0;
			$("#usersDatagrid").datagrid("load");
		}
	</script>
</body>
</html>