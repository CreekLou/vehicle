<%-- 
    Document   : 视频列表
    Created on : 2014-1-10
    Author     : Louxuezheng
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<title>车载系统</title>
<link rel="stylesheet" href="<c:url value="/public/css/jquery.mobile-1.3.2.css"/>" type="text/css">
<link rel="stylesheet" href="<c:url value="/public/css/menu.css" />" type="text/css">
<link rel="stylesheet" href="<c:url value="/public/css/media_menu.css" />" type="text/css">
<link rel="stylesheet" href="<c:url value="/public/css/jplayer_voice_skin.css" />" type="text/css">
<link rel="stylesheet" href="<c:url value="/public/css/flexslider.css" />" type="text/css">
<script src="<c:url value="/public/js/jquery.js"/>" type="text/javascript"> </script>
<script src="<c:url value="/public/js/jquery.jplayer.min.js"/>" type="text/javascript"> </script>
<script src="<c:url value="/public/js/jplayer.playlist.min.js"/>" type="text/javascript"> </script>
<script src="<c:url value="/public/js/voicePlayer_UIControler.js"/>" type="text/javascript"> </script>
<script src="<c:url value="/public/js/updateClicksAjax.js"/>" type="text/javascript"> </script>
<script src="<c:url value="/public/js/menu.js"/>" type="text/javascript"> </script>
<script src="<c:url value="/public/js/jquery.mobile-1.3.2.js"/>" type="text/javascript"> </script>
<script src="<c:url value="/public/js/jquery.flexslider.js"/>"></script>
<script>
$(document).ready(function(){
	$('#${type}').attr("class","ui-btn-active ui-btn ui-btn-up-a ui-btn-inline");
})
</script>
</head>
<body>
  <div data-role="page" data-theme="a" id="demo-page" class="my-page" >
  <div id="header" data-role="header" data-position="fixed" data-tap-toggle="false">
		<ul id="menu-left" data-role="menu" style="margin-top: 5px;padding: 0;">
		     <li>
	            <span data-role="button" data-icon="gear" class="ui-btn-left" data-iconpos="left">导航</span>
	              <ul data-role="listview" data-inset="true" data-theme="c" style="left: 10px; top: 30px;">
	               <li><a data-ajax="false" href="<c:url value="/board/listBoardTopics-1.html"/>" rel="external">风景</a></li>
					<li><a href="<c:url value="/board/listBoardTopics-2.html"/>" rel="external">特产 </a></li>
					<li><a href="<c:url value="/board/listBoardTopics-3.html"/>" rel="external">酒店</a></li>
					<li><a href="<c:url value="/board/listBoardTopics-4.html"/>" rel="external">美食</a></li>
					<li><a href="<c:url value="/video-funny.html"/>" rel="external">视频</a></li>
					<li><a href="<c:url value="/voice-comic.html"/>" rel="external">音频</a></li>
					<li><a href="<c:url value="http://www.letu.com:3002"/>" rel="external">游戏</a></li>
					<li><a href="<c:url value="http://www.letu.com:3300"/>" rel="external">聊天</a></li>
	              </ul>
	         </li>
		</ul>    
			<h1 style="margin-top: 10px;margin-bottom:-5px">音频</h1>
			<a href="/vehicle/index.html" data-icon="home" rel="external" data-role="button" class="ui-btn-right">首页</a>
		<div data-role="navbar" data-id="foo1">
			<ul>
				<li><a href="/voice-comic.html" rel="external" id="comic">相声小品</a></li>
		        <li><a href="/voice-talkShow.html" rel="external" id="talkShow">脱口秀</a></li>
		        <li><a href="/voice-story.html" rel="external" id="story">故事会</a></li>
		        <li><a href="/voice-opera.html" rel="external"id="opera">戏曲</a></li>
			</ul>
      	</div>
	</div>
 <!--container for everything-->
	<div id="jp_container_1" class="jp-audio" data-role="footer" data-position="fixed" data-tap-toggle="false">
            <div id="jquery_jplayer_1" class="jp-jplayer"></div>
            <div class="jp-type-single">
            <div class="jp-title">  <!--修改界面，是title靠上显示 modified by khzliu 2014年2月17日10:44:56-->
                    <ul>
			<li>该栏目无内容...</li>
                    </ul>
			</div>
		<div class="jp-gui jp-interface">
            <ul class="jp-controls">
				<li><a href="javascript:;" class="jp-play" tabindex="1">play</a></li>
				<li><a href="javascript:;" class="jp-pause" tabindex="1">pause</a></li>
            </ul>
            <div class="jp-progress">
				<div class="jp-seek-bar">
                     <div class="jp-play-bar"></div>
				</div>
            </div>
            <div class="jp-time-holder">
				<div class="jp-current-time"></div>
				<div class="jp-duration"></div>
            </div>
		</div>
		
                <div class="jp-playlist" style="display: none">
                    <ul>
                    <!-- The method Playlist.displayPlaylist() uses this unordered list -->
                        <li></li>
                    </ul>
                </div>

		<div class="jp-no-solution">
                    <span>Update Required</span>
			To play the media you will need to either update your browser to a recent version or update your <a href="http://get.adobe.com/flashplayer/" target="_blank">Flash plugin</a>.
		</div>
            </div>
        
        </div><!--end jp_container_1-->
        <script>
            var myVoicelist = [];
            var playingId = ${voices[0].id}; 
            var voiceType = ${voices[0].type};
        </script>
	<div data-role="content">
            <ul data-role="listview" id="headline" data-inset="true" data-theme="a" data-dividertheme="a" data-icon="">

	<c:forEach var="voice" items="${voices}" varStatus="index">
			<li>
                    <a onclick="setJPlayer(${index.index},'${voice.name}','voice','${voice.id}','${fn:length(voices)}');" rel="external" data-ajax="false" id="x-${index.index}">
                        <script>
							//设置播放列表
                            myVoicelist.push({
                                mp3:"data/voice/${voice.route}/voice.mp3",
                                title:"${voice.name}"
                            });
                        </script>
                   <img src="data/voice/${voice.route}/icon.jpg">
                    <h1  style="padding-top: 0px;">${voice.name}</h1>				
                    <p class="myParagraph">${voice.des}</p>
                    <p style="margin-left:-15px;">
                        <span id="${voice.id}" style="position: absolute; font-size: 11px; font-weight: bold; margin-top: 1.5em; padding: .2em .5em; top: 15%; right: 10px; -webkit-border-radius: 1em; border-radius: 1em; border: 1px solid #ccc;">${voice.clicks}</span>
                    </p>
                    </a><span style="float:right;font-size:12px;position:absolute;right:50px;top:7px">${voice.duration}</span>
        	</li>
     </c:forEach>   	
            </ul>
        </div>
   </div>
</body>
