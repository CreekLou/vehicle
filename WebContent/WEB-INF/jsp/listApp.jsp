<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language="java" import="java.util.*,com.message.*" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:directive.page import="com.message.MessageBean;"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
	<head>
		<base href="<%=basePath%>">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>应用下载</title>
		<link rel="stylesheet" href="public/css/jquery.mobile-1.3.2.css"
			type="text/css">
		<link rel="stylesheet" href="public/css/menu.css" type="text/css">
		<script src="public/js/jquery.js" type="text/javascript"></script>
		<script src="public/js/menu.js" type="text/javascript"></script>
		<script src="public/js/jquery.mobile-1.3.2.js" type="text/javascript"></script>
		<script src="public/js/jquery.json-2.4.js" type="text/javascript"></script>
		<script type="text/javascript">
		$(document).ready(
				function() {
					$('#${type}').attr("class","ui-btn-active ui-btn ui-btn-up-a ui-btn-inline");
				})
		</script>
	</head>
	<body>
		<div data-role="page" data-theme="a" id="demo-page">
			<div id="header" data-role="header" data-position="fixed" data-tap-toggle="false">
					<h1>
					应用下载
				  </h1>
				<a href="/vehicle/index.html" data-icon="home" rel="external"
					data-role="button" class="ui-btn-left">首页</a>
				<a href="/leto_portal.html" data-icon="internet-icon" class="ui-btn-right" rel="external">上网</a> 
				<div data-role="navbar">
					<ul>
						<li>
						<a href="/app-热门推荐.html" id="热门推荐" rel="external">热门推荐</a>
						</li>						
						<li>
							<a href="/app-便捷生活.html" id="便捷生活" rel="external">便捷生活</a>
						</li>
						<li>
							<a href="/app-休闲娱乐.html" id="休闲娱乐" rel="external">休闲娱乐</a>
						</li>
						<li>
							<a href="/app-出行必用.html" id="出行必用" rel="external">出行必用</a>
						</li>						
					</ul>
				</div>
				<!-- /navbar -->
			</div>
			<div data-role="content" class="my-page">
				<ul data-role="listview" id="ul_info" data-inset="true">
					<c:forEach var="app" items="${apps}">
						<li>
							<a data-ajax="false" 
						      	href=FileDownServlet?appname=${app.name}&&apptype=${app.type}&&filename=${app.name}.apk						     
								rel="external"> <img
									src="<c:url value="/data/app/${app.type}/${app.name}/icon.jpg"/>">
								<h1>
									${app.name}  
									<span style="font-size:13px;">&nbsp;&nbsp;&nbsp;&nbsp;
									${app.size}MB</span>   
								</h1>																
								<p>
									<c:out value="${app.short_des}" escapeXml="false" />
								</p> </a>
						</li>
					</c:forEach>
				</ul>
				
				<!--  
				<ul data-role="listview" id="ul_info" data-inset="true">
					<c:forEach var="app" items="${apps}">
						<li>
							<a data-ajax="false" href="/appDetail-${app.id}.html"
								rel="external"> <img
									src="<c:url value="/public/images/app/${app.name}.jpg"/>">
								<h1>
									${app.name}
								</h1>
								<p>
									<c:out value="${app.short_des}" escapeXml="false" />
								</p> </a>
						</li>
					</c:forEach>
				</ul>
				-->
			</div>
		</div>
		<div id="goTopBtn"></div>
		<script type="text/javascript">
	$(window).scroll(function() {
		var sc = $(window).scrollTop();
		var rwidth = $(window).width();
		if (sc > 0) {
			$("#goTopBtn").css("display", "block");
			$("#goTopBtn").css("left", (rwidth - 36) + "px");
		} else {
			$("#goTopBtn").css("display", "none");
		}
		;
	})

	$("#goTopBtn").click(function() {
		var sc = $(window).scrollTop();
		$('body,html').animate( {
			scrollTop : 0
		}, "fast");
	});
</script>
	</body>
</html>
