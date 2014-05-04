<%-- 
    Document   : 视频列表
    Created on : 2014-3-10
    Author     : Louxuezheng
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>途经城市</title>
<link rel="stylesheet"
	href="<c:url value="/public/css/jquery.mobile-1.3.2.css"/>"
	type="text/css">
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
	$(document).ready(function(){
		
		  $("#company").click(function(){
			  console.log("我勒个去");
			//  alert(" dddxx");
			 // $.ajax({url:"/company.html",async:true});
			  console.log("我勒个去 quququququ");
		  });
		
		}); 
</script>
</head>

<body>
	<div data-role="page" data-theme="a" id="demo-page">
		<div id="header" data-role="header" data-position="fixed" data-tap-toggle="false">
			<h1 style="margin-top: 2px"><img src="/public/images/title.png"/></h1>
			<a href="/vehicle/index.html" data-icon="home" rel="external" data-role="button" class="ui-btn-left">首页</a>
		</div>
		<div data-role="content" class="my-page">
		<div class="flexslider">
				<ul class="slides">
					<li><img src="/data/images/ad/home_ad_1.jpg" /></li>
					<li><img src="/data/images/ad/home_ad_2.jpg" /></li>
					<li><img src="/data/images/ad/home_ad_3.jpg" /></li>
				</ul>
		</div>
		
			<div class="ui-grid-solo" style="position: relative;">
				<ul data-role="listview" id="ul_info" data-inset="true">
					<c:forEach var="city" items="${citys}">
						<li><a data-ajax="false"
							href="/showCity-${city.nickName}-1-1.html" rel="external"> <img
								src="<c:url value="/public/images/icon/${city.nickName}.png"/>">
								<h1>${city.cityName}</h1>
								<p>
									<c:out value="${city.intro}" escapeXml="false" />
								</p>
						</a></li>
					</c:forEach>
				</ul>
				<!--  <ulk data-role="listview" data-inset="true">
						<li><a href="/showCity-beijing-1-1.html" rel="external"> <img
								src="<c:url value="/public/images/icon/beijing.png"/>">
								<h1>北京</h1>
						</a></li>
						<li><a href="/showCity-tianjin-1-1.html" rel="external"> <img
								src="<c:url value="/public/images/icon/tianjin.png"/>">
								<h1>天津</h1>
						</a></li>	
						<li><a href="/showCity-tianjin-1-1.html" rel="external"> <img
								src="<c:url value="/public/images/icon/tianjin.png"/>">
								<h1>海口</h1>
						</a></li>	
						<li><a href="/showCity-tianjin-1-1.html" rel="external"> <img
								src="<c:url value="/public/images/icon/tianjin.png"/>">
								<h1>三亚</h1>
						</a></li>	
					</ul>-->
			</div>
		</div>
	</div>
</body>
</html>
