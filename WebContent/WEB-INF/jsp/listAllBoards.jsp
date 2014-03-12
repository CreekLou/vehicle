<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>车载系统</title>
<link rel="stylesheet"
	href="<c:url value="/public/css/jquery.mobile-1.3.2.css"/>"
	type="text/css">
<link rel="stylesheet"
	href="<c:url value="/public/css/grid-listview.css"/>" type="text/css">
<link rel="stylesheet" href="<c:url value="/public/css/menu.css" />"
	type="text/css">
<link rel="stylesheet"
	href="<c:url value="/public/css/flexslider.css" />" type="text/css">
<script src="<c:url value="/public/js/jquery.js"/>"
	type="text/javascript">
	
</script>
<script src="<c:url value="/public/js/menu.js"/>" type="text/javascript">
	
</script>
<script src="<c:url value="/public/js/jquery.mobile-1.3.2.js"/>"
	type="text/javascript">
	
</script>
<script src="<c:url value="/public/js/jquery.flexslider.js"/>"></script>
<script type="text/javascript" charset="utf-8">
	$(window).load(function() {
		$('.flexslider').flexslider();
	});
</script>
<script type="text/javascript" charset="utf-8">
$(document).ready(function(){
	//$('#li').attr("class","ui-btn-active ui-btn ui-btn-up-a ui-btn-inline");
	var high = 2*document.getElementById("li").offsetHeight+70;
	//$('#li').attr("class","");
	console.log(high);
	$('#xman').attr("style",'height:'+high+'px');
	console.log($('#xman').attr("style"));
});
</script>
</head>
<body>
	<div data-role="page" data-theme="a" id="demo-page">
		<div id="header" data-role="header" data-position="fixed" data-tap-toggle="false">
			<%@ include file="menu.jsp" %> 
			<h1 style="margin-top: 10px; margin-bottom: -5px">乐途网</h1>
			<!-- <a href="/vehicle/index.html" data-icon="home" rel="external"
				data-role="button" class="ui-btn-right">首页</a> -->
		</div>
		<div data-role="content" class="my-page">
		<div class="flexslider">
				<ul class="slides">
					<li><img src="/data/images/post/1_1.jpg" /></li>
					<li><img src="/data/images/post/1_2.jpg" /></li>
					<li><img src="/data/images/post/1_3.jpg" /></li>
				</ul>
			</div>
				<div id ="xman" class="ui-grid-solo">
				<h3 style="margin-top: 10px; margin-bottom: 10px;">旅游出行信息</h3>
						<ul data-role="listview" data-inset="true" >
							<c:forEach var="board" items="${boards}">
								<li><a
									href="<c:url value="/board/listBoardTopics-${board.boardId}.html"/>"
									rel="external"> <img
										src="<c:url value="/public/images/icon/${board.boardId}.png"/>">
										<h1>${board.boardName}</h1>
								</a></li>
							</c:forEach>
							<li><a href="/routetopic.html" rel="external"> <img
									src="<c:url value="/public/images/icon/route.png"/>">
									<h1>线路推荐</h1>
							</a></li>
							<li><a href="/company.html" rel="external"> <img
									src="<c:url value="/public/images/icon/company.png"/>">
									<h1>公司简介</h1>
							</a></li>
							
						</ul>
			</div>
				<div class="ui-grid-solo" style="position: relative;">
				<h3 style="margin-top: 10px; margin-bottom: 10px;">多媒体娱乐</h3>
					<ul data-role="listview" data-inset="true">
						<li id="li"><a href="/video-funny.html" rel="external"> <img
								src="<c:url value="/public/images/icon/video.png"/>">
								<h1>视频</h1>
						</a></li>
						<li><a href="/voice-comic.html" rel="external"> <img
								src="<c:url value="/public/images/icon/voice.png"/>">
								<h1>音频</h1>
						</a></li>
						<li><a href="http://www.letu.com:3001" rel="external"> <img
								src="<c:url value="/public/images/icon/games.png"/>">
								<h1>游戏室</h1>
						</a></li>
						<li><a href="http://www.letu.com:3300" rel="external" target="_blank"> <img
								src="<c:url value="/public/images/icon/iconating.jpg"/>">
								<h1>聊天室</h1>
						</a></li>
					</ul>
				</div>
			</div>
		</div>
</body>
</html>
