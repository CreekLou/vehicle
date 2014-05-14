<%-- 
    Document   : 视频列表
    Created on : 2014-2-10
    Author     : Louxuezheng
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="vehicle" tagdir="/WEB-INF/tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>车载系统</title>
<link rel="stylesheet" href="<c:url value="/public/css/jquery.mobile-1.3.2.css"/>" type="text/css">
<link rel="stylesheet" href="<c:url value="/public/css/menu.css" />" type="text/css">
<script src="<c:url value="/public/js/jquery.js"/>" type="text/javascript"> </script>
<script src="<c:url value="/public/js/menu.js"/>" type="text/javascript"> </script>
<script src="<c:url value="/public/js/jquery.mobile-1.3.2.js"/>" type="text/javascript"> </script>
<script src="<c:url value="/public/js/jquery.json-2.4.js"/>" type="text/javascript"> </script>
<style>
#goTopBtn {position: fixed;line-height:36px;width:36px;right:10px;bottom:60px;height:36px;cursor:pointer;display:none;z-index:1;
background:url(/public/css/images/back_to_top_white.gif);}
</style>
</head>
<body>
	<div data-role="page" data-theme="a" id="demo-page" >
		<div id="header" data-role="header" data-position="fixed" data-tap-toggle="false">
			<h1><img src="/public/images/title.png"/></h1>
			<a href="/vehicle/index.html" data-icon="home" rel="external" data-role="button" class="ui-btn-left">首页</a>
		</div>
		<div data-role="content" class="my-page">
			<ul data-role="listview" id="ul_info" data-inset="true">
				<c:forEach var="topic" items="${pagedTopic.result}">
					<li><a data-ajax="false" href="<c:url value="/board/listTopic-${topic.topicId}.html"/>" > 
			     		<img src="<c:url value="/public/images/topic/topic-${topic.topicId}/${topic.topicId}.jpg"/>">
						<h1>${topic.topicTitle}</h1>
						<p>
						<c:choose>   
                           <c:when test="${fn:length(topic.summary) > 30}">   
                                <c:out value="${fn:substring(topic.summary, 0, 30)}..." escapeXml="false"/>   
                           </c:when>   
                           <c:otherwise>   
                                <c:out value="${topic.summary}" escapeXml="false"/>   
                           </c:otherwise>   
                        </c:choose></p>
					</a></li>
				</c:forEach>
			</ul>
			<input type="button" id="more" value="查看更多" />
		</div>
			<!--④ 分页显示导航栏-->
		<div data-role="footer" class="ui-bar" data-position="fixed">
		<div data-role="fieldcontain" style="margin-top: 2px;padding: 0;width:150px">
			<select name="select-choice-1" attr="1" id="select-choice-1" data-native-menu="false">
			<option>选择城市</option>
			<option value="all">全部</option>
			<option value="beijing">北京</option>
			<option value="tianjin">天津</option>
			</select>
		</div>
		 <%--<vehicle:PageBar
			   pageUrl="/board/listBoardTopics-${board.boardId}.html"
			   pageAttrKey="pagedTopic"/>	
		</div>--%>
	</div>
	</div>
	<div id="goTopBtn"></div>
	<script type="text/javascript">
  $(window).scroll(function(){
		   var sc=$(window).scrollTop();
		   var rwidth=$(window).width();
      	  if(sc>0){
				$("#goTopBtn").css("display","block");
				$("#goTopBtn").css("left",(rwidth-36)+"px");
				}else{
			$("#goTopBtn").css("display","none");
				};
		  })
		  	
	  $("#goTopBtn").click(function(){
		  var sc=$(window).scrollTop();
		 $('body,html').animate({scrollTop:0},"fast");
		  });
			
</script>
</body>
</html>
