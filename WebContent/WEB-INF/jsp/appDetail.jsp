<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language="java" import="java.util.*,com.vehicle.message.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:directive.page import="com.vehicle.message.MessageBean;" />
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<html>
	<head>
		<base href="<%=basePath%>">
		<!-- 表达式 -->

		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>${app.name}</title>
		<link rel="stylesheet" href="/public/css/jquery.mobile-1.3.2.css"
			type="text/css">
		<link rel="stylesheet" href="/public/css/menu.css" type="text/css">
		<link rel="stylesheet"
			href="<c:url value="/public/css/flexslider.css" />" type="text/css">
		<script src="/public/js/jquery.js" type="text/javascript"></script>
		<script src="/public/js/menu.js" type="text/javascript"></script>
		<script src="/public/js/jquery.mobile-1.3.2.js" type="text/javascript"></script>
		<script src="<c:url value="/public/js/jquery.flexslider.js"/>"></script>
		<script src="/public/js/jquery.json-2.4.js" type="text/javascript"></script>
	</head>
	
	<body>
		<div data-role="page" data-theme="a" id="demo-page">
			<div id="header" data-role="header" data-position="fixed"
				data-tap-toggle="false">
				<h1>
					应用详情
				</h1>
				<a href="/vehicle/index.html" data-icon="home" rel="external"
					data-role="button" class="ui-btn-left">首页</a>
			</div>


			<div data-role="content" data-theme="a">
				<div>
					<ul data-role="listview" style="margin-bottom: 5px">
						<li data-icon="false">
							<img src="/data/app/${app.type}/${app.name}/icon.png"
								style="margin-left: 14px;" />
							<h2 style="margin-top: 4px; margin-left: 8px;">
								${app.name}
							</h2>
							<p class="ui-li-aside">
								${app.size}MB
							</p>
							<div
								style="background-color: darkorange; width: 80px; height: 22px; float: right;">
								<p style="margin-left: 27px; margin-top: 2px;">
									<a
										href=FileDownServlet?appname=${app.name}&&apptype=${app.type}&&filename=${app.name}.apk
										rel="external" style="color: white; text-decoration: none"><strong>下载</strong>
									</a>
								</p>
							</div>
						</li>
					</ul>
				</div>
				<div
					style="height: 259px; overflow: auto; -webkit-overflow-scrolling: touch">
					<table>
						<tr>
						  <c:forEach var="poster" items="${posters}">
							<td>
								<a href="#expand_${poster}" data-rel="popup" data-position-to="window"
									data-transition="fade"><img class="popphoto"
										src="/data/app/${app.type}/${app.name}/${poster}.png" alt="App image"
										height="250" style="margin-right:8px;">
								</a>
							</td>
							<div data-role="popup" id="expand_${poster}" data-overlay-theme="a"
						         data-theme="d" data-corners="false">						
						       <a href="#" data-rel="back" >
						       <img class="popphoto" src="/data/app/${app.type}/${app.name}/${poster}.png"
							   style="max-height: 512px;" alt="App image"></a>
					        </div>
						  </c:forEach>						  
						</tr>
					</table>					
				</div>
				<!--  
				<div
					style="width: 98%; margin: auto; border-style: solid; border-width: 4px; border-radius: 6px; border-color: #B6B7B9;">
					<div class="flexslider">
						<ul class="slides">
							<c:forEach var="i" begin="1" end="${app.poster_num}" step="1">
								<li>
									<img src="/public/app/${app.type}/${app.name}/poster_" ${i}".jpg" />
								</li>
							</c:forEach>
							<li>
								<img src="/public/images/app/poster_1.png" />
							</li>
							<li>
								<img src="/public/images/app/poster_2.png" />
							</li>
							<li>
								<img src="/public/images/app/poster_3.png" />
							</li>
							<li>
								<img src="/public/images/app/poster_4.png" />
							</li>
						</ul>
					</div>
				</div>-->
 			    <div>
 			    <div data-role="header" data-theme="a" style="margin-top: 10;  height: 40;">
 			      <h4 style="text-align:left; margin-left:7px;">描述</h4>
 			    </div> 
 			    <div style="margin-top:10;margin-left:7px;">${app.long_des}</div>
　                                     </div>
         		
         		<!-- 	    
				<div data-role="collapsible"   data-collapsed="false"
					data-collapsed-icon="arrow-d" data-expanded-icon="arrow-u"
					data-theme="a" data-content-theme="a">					
					<h4>
						描述
					</h4>
					<p>${app.long_des}</p>
				</div>
				 -->
			</div>
		</div>
	</body>
</html>
