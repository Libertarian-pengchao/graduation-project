<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>陶笛社区</title>

<style type="text/css">

a.videoa:hover{
	transform: scale(1,1);
	box-shadow: 0 0 10px #0000ff;
	cursor: pointer;
}

	
</style>
</head>
<body>
	<jsp:include page="./header.jsp"></jsp:include>
	<div class="container">
		<div class="row">
			<ul class="nav nav-tabs" style="margin-top: 20px;margin-bottom: 20px;">
				<li><a href="<%=response.encodeURL(request.getContextPath() + "/")%>" >全部</a></li>
				<li><a href="<%=response.encodeURL(request.getContextPath() + "/zclvideo")%>" >宗次郎</a></li>
				<li><a href="<%=response.encodeURL(request.getContextPath() + "/yxzvideo")%>" >游学志</a></li>
				<li><a href="<%=response.encodeURL(request.getContextPath() + "/zzlvideo")%>" >周子雷</a></li>
			</ul>
		</div>
		
		<c:forEach items="${video}" var="v">
			<a class="videoa" href="<%=request.getContextPath()%>/OcarinaVideoPlay?videoid=${v.id}" style="margin-bottom: 50px;width:260px;height:200px;float: left; margin-right: 20px;text-decoration: none;">
				<img class=".img-responsive" src="${v.videoImg}" style="width:100%;height:100%;">
				<div class="text-center">${v.authorName} ${v.videoName}</div>
				<div class="hidden">${v.videoPath}</div>
			</a>
		</c:forEach>
	</div>
</body>
</html>