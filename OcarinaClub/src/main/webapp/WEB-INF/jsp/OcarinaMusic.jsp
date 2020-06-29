<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>陶笛乐曲</title>

<style type="text/css">
.music:hover{
	transform: scale(1,1);
	box-shadow: 0 0 10px #0000ff;
	cursor: pointer;
}

.music{
	height:30px;
	line-height: 30px;
}
</style>
</head>
<body>
	<jsp:include page="./header.jsp"></jsp:include>
	<div class="container">
		<div class="row">
			<ul class="nav nav-tabs" style="margin-top: 20px;">
				<li><a href="<%=response.encodeURL(request.getContextPath() + "/OcarinaMusicView") %>">全部</a></li>
				<li><a href="<%=response.encodeURL(request.getContextPath() + "/zclmusic") %>">宗次郎</a></li>
				<li><a href="<%=response.encodeURL(request.getContextPath() + "/yxzmusic") %>">游学志</a></li>
				<li><a href="<%=response.encodeURL(request.getContextPath() + "/zzlmusic") %>">周子雷</a></li>
			</ul>
		</div>
		
		<c:forEach items="${music}" var="m">
			<div class="row music" style="margin-bottom: 10px;">
				<div class="col-md-4">
					<span class="glyphicon glyphicon-play" ></span>
					<span class="hidden">${m.musicPath}</span>
					${m.musicName}
				</div>
				<div class="col-md-4 ">${m.musicianName}</div>
			</div>
		</c:forEach>
		
	</div>
	
	<script type="text/javascript">
		var isPlay = false;
		var audio = new Audio();
		
		$(".music div span.glyphicon").click(function(){
			console.log(this);
			var src = $(this).next().text();
			audio.src = src;
			console.log(src);
			if(isPlay == false){
				$(this).removeClass("glyphicon-play");
				$(this).addClass("glyphicon-pause");
				audio.play();
				isPlay = true;
			}else{
				$(this).removeClass("glyphicon-pause");
				$(this).addClass("glyphicon-play");
				audio.pause();
				isPlay = false;
			}
		});
	</script>
</body>
</html>