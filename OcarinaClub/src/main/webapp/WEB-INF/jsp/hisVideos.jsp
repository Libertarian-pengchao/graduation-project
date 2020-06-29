<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
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
	body {
	background: linear-gradient(135deg, #3023AE, #C86DD7);
	background-attachment: fixed;
	font-size: 15px;
	font-family: "Helvetica Neue", Helvetica, Microsoft Yahei;
}

* {
	margin: 0;
}

.page-header {
	padding: 20px 30px;
	overflow: hidden;
	border-bottom: 1px solid white;
}

.page-header .brand {
	color: white;
	text-decoration: none;
	float: left;
}

.page-header .brand1{
	color: white;
	text-decoration: none;
	float: right;
	cursor: pointer;
}

.vidcontainer:hover{
	transform: scale(1.2,1.2);
	box-shadow: 0 0 10px #0000ff;
}

.delete{
	color:white;
	position:absolute;
	right:5px;
	top:5px;
	z-index:999;
}
</style>
</head>
<body>
<div class="container-fluid">
	<div class="page-header">
		<span class="brand">他的视频</span>
	</div>
	<div class="container">
		<div class="row">
		<c:forEach items="${videos}" var="m">
			<div class="col-md-3 vidcontainer" style="margin-right: 40px;margin-top: 20px;cursor: pointer;">
				<div class="row">
					<img alt="" src="${m.img}" style="width:100%;height:100%;" class="video img-responsive">
				</div>
				<div class="row">
					<span style="color:white;">${m.vidieoName}</span>
				</div>
				<div class="id hidden" >${m.id}</div>
			</div>
		</c:forEach>
	</div>
</div>
	<!--  -->
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/static/lib/jquery/jquery.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/static/lib/bootstrap/js/bootstrap.min.js"></script>
		
	<script type="text/javascript">	
		$(".video").click(function(){
			var id = $(this).parent().next().next().text();
			$.ajax({
				url:"<%=response.encodeURL(request.getContextPath() + "/playMyVideo") %>",
				method:"post",
				contentType:"application/json;charset=utf-8",
				data:JSON.stringify({
					id:id
				}),
				success:function(data){ //"ok","error"
					if(data == "ok"){
						window.location.href = "/OcarinaClub/videoPlay";
					}
				}
			});
		});
	</script>
</body>
</html>