$(function(){
	$(".sshweb_sidebar li a").bind("click",function(){
		var title = $(this).text();
		var iconCls = $(this).attr("data-icon");
		var url = $(this).attr("data-link");
		addTab(title,iconCls,url);
	});
});

function addTab(title,iconCls,url){
	var tabPanel = $("#sshweb_tabs");
	if(!tabPanel.tabs("exists",title)){
		var content = "<iframe scrolling='auto' frameborder='0' src='"+url+"' style='width:100%;height:100%;'></iframe>";
		tabPanel.tabs("add",{
			title:title,
			content:content,
			iconCls:iconCls,
			fit:true,
			cls:"pd3",
			closable:true
		})
	}else{
		tabPanel.tabs("select",title);
	}
}