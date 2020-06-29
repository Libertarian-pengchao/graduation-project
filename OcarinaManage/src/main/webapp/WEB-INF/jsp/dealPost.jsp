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
				<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="user_postdetails()" plain="true">详情</a>
				<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="user_deletepost()" plain="true">删除</a>
	            <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="user_cancel()" plain="true">取消</a>
	            <a href="#" class="easyui-linkbutton" iconCls="icon-reload" onclick="user_reload()" plain="true">刷新</a>
			</div>
			<div style="height: 40px;">
				<label>帖子名：</label><input class="easyui-textbox" id="user_searchbox" style="width:150px,height:24px;">
            	<a href="#" class="easyui-linkbutton" iconCls="icon-search" id="user_searchbtn">开始检索</a>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		
		$(function(){
			
			$("#user_searchbtn").bind("click",function(){
				var queryParams = $("#usersDatagrid").datagrid("options").queryParams;
				queryParams.postName = $("#user_searchbox").textbox("getValue");
				$("#usersDatagrid").datagrid("load");
			});
			
			$("#usersDatagrid").datagrid({
				url:"/OcarinaManage/getAllPagerPost",
				pagination:true,
				pageSize:10,
				toolbar:"#usersToolbar",
				columns:[[
					{field:"ck",checkbox:true},
					{field:"id",title:"帖子编码",width:200},
					{field:"type",title:"帖子类型",width:200,formatter:function(value,row,index){
						if(value == 1){
							return "技术帖";
						}else if(value == 2){
							return "提问帖";
						}else{
							return "主题帖";
						}
					}},
					{field:"postName",title:"帖子名",width:200},
					{field:"postContent",title:"帖子内容"},
					{field:"publishUserName",title:"发帖人用户名",width:200}
				]],
			});
		});
		
		function user_reload(){
			$("#usersDatagrid").datagrid("reload");
		}
		
		function user_cancel() {
			$("#usersDatagrid").datagrid("rejectChanges");
		}
		
		function user_deletepost(){
			var rows = $("#usersDatagrid").datagrid("getSelections");
			if(rows.length <= 0){
				$.messager.alert("信息提示","请选择要删除的帖子！","info");
			}else{
				var ids = new Array();
				for(var i=0; i < rows.length; i++){
					ids.push(rows[i].id);
				}
				$.ajax({
					url:"/OcarinaManage/postDelete",
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
		
		function user_postdetails(){
			var rows = $("#usersDatagrid").datagrid("getSelections");
			if(rows.length <= 0){
				$.messager.alert("信息提示","请选择要查看的帖子！","info");
			}else if(rows.length > 1){
				$.messager.alert("信息提示","不能查看多个帖子！","info");
			}else{
				console.log(rows[0].id);
			}
		}

	</script>
</body>
</html>