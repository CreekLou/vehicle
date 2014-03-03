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
</head>
<body>
	<div data-role="page" data-theme="a" id="demo-page">
		<div id="header" data-role="header" data-position="fixed" data-tap-toggle="false">
			<ul id="menu-left" data-role="menu"
				style="margin-top: 5px; padding: 0;">
				<li><span data-role="button" data-icon="gear"
					class="ui-btn-left" data-iconpos="left">导航</span>
					<ul data-role="listview" data-inset="true" data-theme="c"
						style="left: 10px; top: 30px;">
						<li><a data-ajax="false"
							href="<c:url value="/board/listBoardTopics-1.html"/>"
							rel="external">风景</a></li>
						<li><a href="<c:url value="/board/listBoardTopics-2.html"/>"
							rel="external">特产 </a></li>
						<li><a href="<c:url value="/board/listBoardTopics-3.html"/>"
							rel="external">酒店</a></li>
						<li><a href="<c:url value="/board/listBoardTopics-4.html"/>"
							rel="external">美食</a></li>
						<li><a href="<c:url value="/video-funny.html"/>"
							rel="external">视频</a></li>
						<li><a href="<c:url value="/voice-comic.html"/>"
							rel="external">音频</a></li>
						<li><a href="<c:url value="http://www.letu.com:3002"/>"
							rel="external">游戏</a></li>
						<li><a href="<c:url value="http://www.letu.com:3300"/>"
							rel="external">聊天</a></li>
					</ul></li>
			</ul>
			<h1 style="margin-top: 10px; margin-bottom: -5px">首页</h1>
			<a href="/vehicle/index.html" data-icon="home" rel="external"
				data-role="button" class="ui-btn-right">首页</a>
		</div>
		<div data-role="content" class="my-page">
		<div class="flexslider">
				<ul class="slides">
					<li><img src="/data/images/post/1_1.jpg" /></li>
					<li><img src="/data/images/post/1_2.jpg" /></li>
					<li><img src="/data/images/post/1_3.jpg" /></li>
				</ul>
			</div>
			<h3 style="margin-top: 10px; margin-bottom: 10px;">旅游出行信息</h3>
				<div class="ui-grid-solo">
						<ul data-role="listview" data-inset="true">
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
			<h3 style="margin-top: 260px; margin-bottom: 10px;">多媒体娱乐</h3>
				<div class="ui-grid-solo">
					<ul data-role="listview" data-inset="true">
						<li><a href="/video-funny.html" rel="external"> <img
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
						<li><a href="http://www.letu.com:3300" rel="external"> <img
								src="<c:url value="/public/images/icon/chating.jpg"/>">
								<h1>聊天室</h1>
						</a></li>
					</ul>
				</div>
			</div>
		</div>
</body>
</html>
