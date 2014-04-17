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
<link rel="stylesheet" href="<c:url value="/public/css/jplayer_video_skin.css" />" type="text/css">
<link rel="stylesheet" href="<c:url value="/public/css/flexslider.css" />" type="text/css">
<script src="<c:url value="/public/js/jquery.js"/>" type="text/javascript"> </script>
<script src="<c:url value="/public/js/jquery.jplayer.min.js"/>" type="text/javascript"> </script>
<script src="<c:url value="/public/js/jplayer.playlist.min.js"/>" type="text/javascript"> </script>
<script src="<c:url value="/public/js/videoPlayer_UIControler.js"/>" type="text/javascript"> </script>
<script src="<c:url value="/public/js/updateClicksAjax.js"/>" type="text/javascript"> </script>
<script src="<c:url value="/public/js/menu.js"/>" type="text/javascript"> </script>
<script src="<c:url value="/public/js/jquery.mobile-1.3.2.js"/>" type="text/javascript"> </script>
<script src="<c:url value="/public/js/jquery.flexslider.js"/>"></script>
<!-- start -->
<script>
$(document).ready(function(){
	$('#${type}').attr("class","ui-btn-active ui-btn ui-btn-up-a ui-btn-inline");
	console.log("jplayer = "+document.getElementById("jquery_jplayer_1").offsetHeight+"px");
	 $("#jp_container_1").hide(); 
	 //$('#ad').attr("class","jp-jplayer");
})
</script>
<!-- end -->
</head>
<body>
  <div data-role="page" data-theme="a" id="demo-page" class="my-page" >
   <div id="header" data-role="header" data-position="fixed" data-tap-toggle="false">
			<h1>视频</h1>
			<a href="/vehicle/index.html" data-icon="home" rel="external" data-role="button" class="ui-btn-left">首页</a>
		<div data-role="navbar" data-id="foo1">
			<ul id="nav_id">
				<li><a href="/video-movie.html" rel="external" id="movie">电影</a></li>
		         <li><a href="/video-funny.html" rel="external" id="funny">搞笑</a></li>
		         <li><a href="/video-mv.html" rel="external" id="mv">MV</a></li>
			</ul>
      	</div>
	</div>
      <!--container for everything-->
      <!-- start -->
		<div id="ad" class="jp-video jp-video-360p">
			<span id="timer"
				style="position: absolute; font-size: 11px; font-weight: bold; margin-top: -.95em; padding: .2em .5em; top: 5%; right: 10px; -webkit-border-radius: 0em; border-radius: 0em; border: 0px solid #ccc; color: red; font-size: 14px; font-family: Arial;">广告剩余
				9 秒</span> <img id="adimg" class="jp-jplayer" style="width: 100%;"
				src="data/videoad/video_ad.png">
		</div>
		<!-- end -->
        <div id="jp_container_1" class="jp-video jp-video-360p">

            <!--container in which our video will be played-->
            <div id="jquery_jplayer_1" class="jp-jplayer"></div>

            <!--main containers for our controls-->
            <div class="jp-gui">
                <canvas id="canvas"></canvas>
                <div class="jp-video-play">
                    <a href="javascript:;" class="jp-video-play-icon" tabindex="1">play</a>
		</div>
                
                <div class="jp-interface">
                    <div class="jp-controls-holder">

                        <!--play and pause buttons-->
                        <a href="javascript:;" class="jp-play" tabindex="1">play</a>
                        <a href="javascript:;" class="jp-pause" tabindex="1">pause</a>
                        <span class="separator sep-1"></span>

                        <!--progress bar-->
                        <div class="jp-progress">
                            <div class="jp-seek-bar">
                                <div class="jp-play-bar"><span></span></div>
                            </div>
                        </div>

                        <!--time notifications-->
                        <div class="jp-current-time"></div>
                        <span class="time-sep">/</span>
                        <div class="jp-duration"></div>
                        <span class="separator sep-2"></span>

                        <!--full screen toggle-->
                        <a href="javascript:;"  class="jp-fullScreen" tabindex="1" title="full screen"></a>
                        
                        

                    </div><!--end jp-controls-holder-->
                </div><!--end jp-interface-->
            </div><!--end jp-gui-->
            <div class="jp-playlist" style="display: none">
		<ul>
		<!-- The method Playlist.displayPlaylist() uses this unordered list -->
		<li></li>
		</ul>
            </div>
            <!--unsupported message-->
            <div class="jp-no-solution">
                <span>Update Required</span>
                Here's a message which will appear if the video isn't supported. A Flash alternative can be used here if you fancy it.
            </div>

        </div><!--end jp_container_1-->
        <script>
            var myVideolist = [];
            var playingId = ${videos[0].id}; 
            var videoType = "videos";
            var videoSize = ${fn:length(videos)};
        </script>
	<div data-role="content">
            <ul data-role="listview" id="headline" data-inset="true" data-theme="a" data-dividertheme="a" data-icon="">

	<c:forEach var="video" items="${videos}" varStatus="index">
			<li>
                    <a onclick="setJPlayer(${index.index},'videos','${video.id}','${fn:length(videos)}');" rel="external" data-ajax="false" id="x-${index.index}">
                        <script>
                            //设置播放列表
                            myVideolist.push({
                                m4v:"data/videos/${video.route}/video.mp4",
                               poster:'data/videos/${video.route}/poster.jpg'
                            });
                        </script>
                    <img src="data/videos/${video.route}/icon.jpg">
                    <h1  style="padding-top: 0px;">${video.name}</h1>				
                    <p>${video.des}</p>
                    <p style="margin-left:-15px;">
                        <span id="${video.id}" style="position: absolute; font-size: 11px; font-weight: bold; margin-top: 1.5em; padding: .2em .5em; top: 15%; right: 10px; -webkit-border-radius: 1em; border-radius: 1em; border: 1px solid #ccc;">${video.clicks}</span>
                    </p>
                    </a><span style="float:right;font-size:12px;position:absolute;right:50px;top:7px">${video.duration}</span>
        	</li>
     </c:forEach>   	
            </ul>
        </div>
        <div data-role="footer" data-theme="none" data-tap-toggle="false"></div>
   </div>
</body>
