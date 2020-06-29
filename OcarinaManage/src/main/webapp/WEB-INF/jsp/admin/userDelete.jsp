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
	            <a href="#" class="easyui-linkbutton" iconCls="icon-remove" onclick="user_remove()" plain="true">删除</a>
	            <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="user_cancel()" plain="true">取消</a>
	            <a href="#" class="easyui-linkbutton" iconCls="icon-reload" onclick="user_reload()" plain="true">刷新</a>
			</div>
			<div style="height: 40px;">
				<label>用户名：</label><input class="easyui-textbox" id="user_searchbox" style="width:150px,height:24px;">
            	<a href="#" class="easyui-linkbutton" iconCls="icon-search" id="user_searchbtn">开始检索</a>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		
		$(function(){
			$("#user_searchbtn").bind("click",function(){
				var queryParams = $("#usersDatagrid").datagrid("options").queryParams;
				queryParams.userName = $("#user_searchbox").textbox("getValue");
				$("#usersDatagrid").datagrid("load");
			});
			
			$("#usersDatagrid").datagrid({
				url:"/OcarinaManage/getAllPagerUsers",
				pagination:true,
				pageSize:10,
				toolbar:"#usersToolbar",
				columns:[[
					{field:"ck",checkbox:true},
					{field:"id",title:"用户编码",width:200},
					{field:"userName",title:"用户名",width:200},
					{field:"sex",title:"用户性别",width:200},
					{field:"state",title:"用户状态",width:200,formatter:function(value,row,index){
						if(value == 1){
							return "正常状态";
						}else{
							return "禁用状态";
						}
					}},
					{field:"personalsign",title:"个性签名"},
					{field:"phoneNumber",title:"电话号码",width:200},
					{field:"regeDate",title:"注册日期",width:200},
					{field:"roles",title:"用户角色",formatter:function(value,row,index){
						var rolesStr = "";
						if(value!=null && value.length>0){
							for(var i=0;i<value.length;i++){
								rolesStr += "【"+ value[i].rname +"】"
							}
						}
						return rolesStr;
					}},
				]],
			});
		});
		
		function user_reload(){
			$("#usersDatagrid").datagrid("reload");
		}
		
		function user_cancel() {
			$("#usersDatagrid").datagrid("rejectChanges");
		}
		
		

		
		function user_remove(){
			var rows = $("#usersDatagrid").datagrid("getSelections");
			if(rows.length < 1){
				$.messager.alert("信息提示","请选择您要删除的数据！","info");
			}else{
				var ids = new Array();
				for(var i=0; i < rows.length; i++){
					ids.push(rows[i].id);
				}	
				$.ajax({
					url:"/OcarinaManage/userDelete",
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
	</script>
</body>
</html>