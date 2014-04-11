<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<title>连接互联网</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/public/css/jquery.mobile-1.3.2.css" type="text/css">
<link rel="stylesheet" href="/public/css/grid-listview.css" type="text/css">
<link rel="stylesheet" href="/public/css/menu.css" type="text/css">
<script src="/public/js/jquery.js" type="text/javascript"></script>
<script src="/public/js/menu.js" type="text/javascript"></script>
<script src="/public/js/jquery.mobile-1.3.2.js" type="text/javascript"></script>
</head>
<body>
	<div data-role="page" data-theme="a" id="demo-page">
		<div id="header" data-role="header" data-position="fixed"
			data-tap-toggle="false">
			<%@ include file="menu.jsp"%>
			<h1 style="margin-top: 10px; margin-bottom: -5px">连接互联网</h1>
			<a href="/index.html" data-icon="home" rel="external"
				data-role="button" class="ui-btn-right">首页</a>
		</div>
		<div data-role="content" style="padding: 0px">
			<iframe src="http://www.baidu.com" id="iframe"
				style="width: 100%; visibility: hidden;"></iframe>
		</div>
	</div>

	<script>
      (function() {
        var fixgeometry = function() {
            
          /* Some orientation changes leave the scroll position at something
           * that isn't 0,0. This is annoying for user experience. */
          scroll(0, 0);

          var screen = $.mobile.getScreenHeight();

          var header = $(".ui-header").hasClass("ui-header-fixed") ? $(".ui-header").outerHeight()  - 1 : $(".ui-header").outerHeight();

          var footer = $(".ui-footer").hasClass("ui-footer-fixed") ? $(".ui-footer").outerHeight() - 1 : $(".ui-footer").outerHeight();

            /* content div has padding of 1em = 16px (32px top+bottom). This step
            can be skipped by subtracting 32px from content var directly. */
            var contentCurrent = $(".ui-content").outerHeight() - $(".ui-content").height();

            var content = screen - header - footer - contentCurrent;
            $(".ui-content").height(content-5);
            $("#iframe").height(content-5);
            $("#iframe").css("visibility","visible");
            alert("showed"+content);
        }; /* fixgeometry */

        $(document).ready(function() {
          
          $(window).bind("orientationchange resize pageshow", fixgeometry);
        });
      })();
    </script> 

</body>
</html>