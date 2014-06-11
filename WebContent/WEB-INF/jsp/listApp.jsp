<%-- 
    Document   : App Page
    Created on : 2014-4-10
    Author     : KingWang
--%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language="java" import="java.util.*,com.vehicle.message.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:directive.page import="com.vehicle.message.MessageBean;" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<html>
	<head>
		<base href="<%=basePath%>">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>应用下载</title>
		<link rel="stylesheet" href="/public/css/jquery.mobile-1.3.2.css"
			type="text/css">
		<link rel="stylesheet" href="/public/css/menu.css" type="text/css">
		<link rel="stylesheet"
			href="<c:url value="/public/css/flexslider.css" />" type="text/css">
		<script src="/public/js/jquery.js" type="text/javascript"></script>
		<script src="/public/js/menu.js" type="text/javascript"></script>
		<script src="/public/js/jquery.mobile-1.3.2.js" type="text/javascript"></script>
		<script src="/public/js/jquery.json-2.4.js" type="text/javascript"></script>
		<script src="<c:url value="/public/js/jquery.flexslider.js"/>"></script>
		<script type="text/javascript">
	       $(document).ready(
			 function() {
				$('#${type}').attr("class",
						"ui-btn-active ui-btn ui-btn-up-a ui-btn-inline");
			 })
        </script>
		<script type="text/javascript" charset="utf-8">
	         $(window).load(function() {
		     $('.flexslider').flexslider();
	         });
        </script>
       <style type="text/css">
       .ui-icon-download-icon{
    		 background-image:url(/public/css/images/download.png);
   			 -moz-background-size:18px 18px;-o-background-size:18px 18px;
   			 -webkit-background-size:18px 18px;
    		 background-size:18px 18px
		}
       </style>
        
       

	</head>
	<body>
		<div data-role="page" data-theme="a" id="demo-page">
			<div id="header" data-role="header" data-position="fixed"
				data-tap-toggle="false">
				<%@ include file="menu.jsp"%>
				<h1 style="margin-top: 10px; margin-bottom: -5px">
					应用下载
				</h1>
				<a href="/vehicle/index.html" data-icon="home" data-ajax="false"
					rel="external" data-role="button" class="ui-btn-right">首页</a>
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
				<div class="flexslider">
					<ul class="slides">
						<li>
							<img src="/data/images/post/home_ad_1.jpg" />
						</li>
						<li>
							<img src="/data/images/post/home_ad_2.jpg" />
						</li>
						<li>
							<img src="/data/images/post/home_ad_3.jpg" />
						</li>
					</ul>
				</div>

				<ul data-role="listview" id="ul_info" data-inset="true"   data-split-theme="a" data-split-icon="download-icon">
					<c:forEach var="app" items="${apps}">
						<li data-icon="false">
							<a data-ajax="false" href="/appDetail-${app.id}.html"
								rel="external"> <img
									src="<c:url value="/data/app/${app.type}/${app.name}/icon.png"/>">
								<h2 style="margin-top:5px">
									${app.name}
								</h2>
								<p style="margin-bottom:10px">
									${app.short_des}
								</p>
								<p class="ui-li-aside">
									${app.size}MB
								</p>
								<p style="float: right; margin-bottom:-20px">
								 	已有 ${app.download_num} 人安装
							    </p>								
							</a>
							  
							<a href=FileDownServlet?appname=${app.name}&&apptype=${app.type}
								    rel="external">下载</a>
							<!-- 	
							<div data-role="popup" id="download_${app.id}" data-theme="d"
								data-overlay-theme="b" class="ui-content"
								style="width: 280px; padding-bottom: 2em;">
								
								<h3>
									确定下载吗 ?
								</h3>
								
								<p>
									点击 "确认" 按钮开始下载。
								</p>
								 
								<a	href=FileDownServlet?appname=${app.name}&&apptype=${app.type}&&filename=${app.name}.apk
									rel="external"
								    data-role="button" data-theme="b" 
									data-icon="check" data-inline="true" data-mini="true"
									id="confirm" >确认</a>
									
								<a href="#" data-role="button" data-rel="back"
									data-inline="true" data-mini="true">取消</a>
								</div>--> 
								<!-- 
								<script type="text/javascript">	
									$(document).on('pagebeforeshow', '#index', function(){ 
            						 $(document).on('click', '#confirm', function(){ 
       								 setTimeout(function(){
        		    				$( "#download_${app.id}" ).popup( "close" );
    	  								  },1);
    									})    
									});
								</script> -->	
							<!--  
							<script type="text/javascript" charset="utf-8" language="JavaScript">
                               function func(){
                                   opener.location.reload(true);
                                   self.close();         
                                }
                            </script>-->														
						</li>
					</c:forEach>
				</ul>      
			</div>
		</div>
	</body>
</html>
