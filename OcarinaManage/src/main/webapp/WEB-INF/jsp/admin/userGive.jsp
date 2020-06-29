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
				<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="user_openGive()" plain="true">授权</a>
	            <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="user_cancel()" plain="true">取消</a>
	            <a href="#" class="easyui-linkbutton" iconCls="icon-reload" onclick="user_reload()" plain="true">刷新</a>
			</div>
			<div style="height: 40px;">
				<label>用户名：</label><input class="easyui-textbox" id="user_searchbox" style="width:150px,height:24px;">
            	<a href="#" class="easyui-linkbutton" iconCls="icon-search" id="user_searchbtn">开始检索</a>
			</div>
		</div>
	</div>
	
	<div id="user_dialog" class="easyui-dialog" data-options="closed:true,iconCls:'icon-save'" style="width: 400px; height:300px; padding: 10px;">
		<form id="user_dialog_form" method="post">
			<table>
				<tr>
					<td width="100" align="right">用户名称：<input type="hidden" id="id" name="id" /> </td>
					<td><input type="text" id="userName" name="userName" class="easyui-textbox"/></td>
				</tr>
				
				<tr>
					<td width="100" align="right">用户状态：</td>
					<td><input type="text"  id="state" name="state" class="easyui-textbox"/></td>
				</tr>
				
				<tr>
					<td width="100" align="right">用户性别：</td>
					<td><input type="text"  id="sex" name="sex" class="easyui-textbox"/></td>
				</tr>
				
				<tr>
					<td width="100" align="right">电话号码：</td>
					<td><input type="text"  id="phoneNumber" name="phoneNumber" class="easyui-textbox"/></td>
				</tr>
				<tr>
					<td width="100" align="right">注册日期：</td>
					<td><input type="text"  id="regDate" name="regeDate" class="easyui-datebox"/></td>
				</tr>
				
				<tr>
					<td width="100" align="right">用户角色：</td>
					<td><input type="text"  id="rolesId" name="roles" class="easyui-combotree"
							data-options="url:'/OcarinaManage/getAllRoles',multiple:true,required:true,panelHeight:133"/></td>
				</tr>
			</table>
		</form>
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
		
		
		function user_openGive(){
			$("#user_dialog_form").form("clear");
			var rows = $("#usersDatagrid").datagrid("getSelections");
			if(rows.length > 1){
				$.messager.alert("信息提示","一次只能修改一条数据！","info");
			}else if(rows.length == 0){
				$.messager.alert("信息提示","请勾选您要修改的数据！","info");
			}else{
				var user = rows[0];
				$("#user_dialog_form").form("load",user);
				$("#user_dialog").dialog({
					title:"用户授权",
					closed:false,
					modal:true,
					onOpen:function(){
						$("#userName").textbox({disabled:true});
						$("#state").textbox({disabled:true});
						$("#sex").textbox({disabled:true});
						$("#phoneNumber").textbox({disabled:true});
						$("#regDate").textbox({disabled:true});
					},
					buttons:[
						{
							text:"确定",iconCls:"icon-ok",
							handler:user_give
						},
						{
							text:"取消",iconCls:"icon-cancel",
							handler:function(){
								$("#user_dialog").dialog("close");
							}
						}
					],
				});	
			}
		}
		
		function user_give(){
			var rolesArr = $("#rolesId").val().split(",");
			var roleObjStr = "[";
			for(var i=0;i<rolesArr.length;i++){
				roleObjStr += "{id:"+rolesArr[i]+"},";
			}
			roleObjStr = roleObjStr.substring(0,roleObjStr.length-1) + "]";
			var roleObj = eval("(" + roleObjStr + ")");
			$.ajax({
				url:"/OcarinaManage/updateUserRole",
				method:"post",
				contentType:"application/json;charset=utf-8",
				data:JSON.stringify({
					id:$("#id").val(),
					userName:$("#userName").val(),
					state:$("#state").val(),
					sex:$("#sex").val(),
					phoneNumber:$("#phoneNumber").val(),
					regeDate:$("#regeDate").val(),
					roles: roleObj
				}),
				success:function(data){ //"ok","error"
					if(data == "ok"){
						$("#user_dialog").dialog("close");
						$("#usersDatagrid").datagrid("reload");
					}else{
						$.messager.alert("信息提示","提交失败！","info");
					}
				}
			});
		}
	</script>
</body>
</html>