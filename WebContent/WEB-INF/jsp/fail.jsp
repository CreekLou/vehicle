<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>车载系统</title>
<link rel="stylesheet" href="public/css/jquery.mobile-1.3.2.css">
<link rel="stylesheet" href="public/css/grid-listview.css">
<link rel="stylesheet" href="public/css/menu.css" />
<script src="public/js/jquery.js"></script>
<script src="public/js/menu.js"></script>
<script src="public/js/jquery.mobile-1.3.2.js"></script>
</head>
<% 
    String url = (String)request.getAttribute("javax.servlet.forward.request_uri"); 
	if(url.indexOf("list.html")>0){
		response.setStatus(200);
	}

 %>
<script>
window.location.href="http://www.letu.com";
</script>

