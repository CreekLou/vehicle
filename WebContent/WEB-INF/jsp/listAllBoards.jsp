<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>乐途网</title>
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
			<h1 style="margin-top: 1px;margin-bottom:11px">
			<img src="/public/images/title.png"/>
			</h1>
			<a href="/vehicle/index.html" data-icon="home" rel="external" data-role="button" class="ui-btn-left">首页</a>
			<a href="/leto_portal.html" data-icon="internet-icon" class="ui-btn-right" rel="external">上网</a> 
		</div>
		<div data-role="content" class="my-page">
		<div class="flexslider">
				<ul class="slides">
					<li><img src="/data/images/post/1_1.jpg" /></li>
					<li><img src="/data/images/post/1_2.jpg" /></li>
					<li><img src="/data/images/post/1_3.jpg" /></li>
				</ul>
		</div>
		
			<div id="city" class="ui-grid-solo" style="position: relative;">
					<ul data-role="listview" data-inset="true">
						<li><a id="company" href="/bussearch.html" rel="external"> <img
							src="<c:url value="/public/images/icon/company.png"/>">
							<h1>公司介绍</h1>
						</a></li>
						<li><a href="/listCitys.html" rel="external"> <img
								src="<c:url value="/public/images/icon/mobilemall.png"/>">
								<h1>途经城市</h1>
						</a></li>		
						<li id="li"><a href="/video-movie.html" rel="external"> <img
								src="<c:url value="/public/images/icon/video.png"/>">
								<h1>视频</h1>
						</a></li>
						<li><a href="/voice-comic.html" rel="external"> <img
								src="<c:url value="/public/images/icon/voice.png"/>">
								<h1>音频</h1>
						</a></li>
						<li><a href="http://www.letu.com:3001" rel="external"> <img
								src="<c:url value="/public/images/icon/games.png"/>">
								<h1>游戏</h1>
						</a></li>
						<li><a href="/app-热门推荐.html" rel="external"> <img
								src="<c:url value="/public/images/icon/app.png"/>">
								<h1>应用</h1>
						</a></li>
					</ul>
			</div>
		</div>
	</div>
</body>
</html>
