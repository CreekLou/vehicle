<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib prefix="vehicle" tagdir="/WEB-INF/tags" %>
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
<script type="text/javascript">
$(document).ready(function(){
	console.log("类型"+"${board.boardId}");
	if('${board.boardId}'<5){
		$('#${board.boardId}').attr("class","ui-btn-active ui-btn ui-btn-up-a ui-btn-inline");
	}else{
		$('#5').attr("class","ui-btn-active ui-btn ui-btn-up-a ui-btn-inline");
	}
	$(function(){
		var j =1;//初始页号
		console.log("城市："+'${city}');
		$("#more").click(function(){
	        var id =${board.boardId};
	        var info3=$("#more").val();
	        console.log("more 的值="+info3);
	        var pageNo = ${pagedTopic.currentPageNo}+j;
	        jQuery.ajax({
	        	type: 'POST',
	            contentType: 'application/json',
	            url: '/board/listMoreCityTopics-'+'${city}'+'-'+id+'-'+pageNo+'.do',
	            dataType: 'json',           
	            success: function(data){
	            	j=j+1;
	            	console.log("第二次ajax时j的大小 ="+j);
	                var mode = data.pagedTopic.result;
	                console.log("mode的大小="+mode.length);
	                console.log("totalPagedCount="+data.pagedTopic.totalPageCount);
	                console.log("pagedTopic.currentPageNo="+data.pagedTopic.currentPageNo);
	                if(data.pagedTopic.currentPageNo>=data.pagedTopic.totalPageCount){
	                	//$("#more").val("没有更多了");
	                	//$("#more").prev().text("没有更多了");
	                	//$("#more").attr("type","hidden");
	                	$("#more").prev().hide();
						$("#more").empty();
	                }else{
	                	$("#more").prev().show();

	                }
	                $.each(mode,function(i,topic){
	                	var tempsummary = topic.summary;
	                	if(topic.summary.length>30){
	                		 tempsummary = topic.summary.substring(0,30)+"...";
	                	}
	                	$("#ul_info").append(
	                	'<li><a data-ajax="false" href="/board/listTopic-'+topic.topicId+'.html" rel="external"> <img src="/public/images/topic/topic-'+topic.topicId+'/'+topic.topicId+'.jpg"><h1>'+topic.topicTitle+'</h1><p>'+tempsummary+'</p></a></li>'
	    	            );
	                });
	                $("#ul_info").listview("refresh");
	            },
	            error: function(){
	                alert("error");
	            }
	        });
	    });
	});
});
</script>
<style>
#goTopBtn {position: fixed;line-height:36px;width:36px;right:10px;bottom:60px;height:36px;cursor:pointer;display:none;z-index:1;
background:url(/public/css/images/back_to_top_white.gif);}
</style>
</head>
<body>
	<div data-role="page" data-theme="a" id="demo-page" >
		<div id="header" data-role="header" data-position="fixed" data-tap-toggle="false">
			<c:if test="${city=='beijing'}">
			<h1 style="margin-top: 10px;margin-bottom:-5px">北京</h1>
			 </c:if>
			 <c:if test="${city=='tianjin'}">
			<h1 style="margin-top: 10px;margin-bottom:-5px">天津</h1>
			 </c:if>
			 <c:if test="${city=='haikou'}">
			<h1 style="margin-top: 10px;margin-bottom:-5px">海口</h1>
			 </c:if>
			 <c:if test="${city=='sanya'}">
			<h1 style="margin-top: 10px;margin-bottom:-5px">三亚</h1>
			 </c:if>
			<a href="/vehicle/index.html" data-icon="home" rel="external" data-role="button" class="ui-btn-left">首页</a>
			 <div data-role="navbar">
		        <ul>
		            <li><a href="/showCity-${city}-1-1.html" id="1" rel="external">风景</a></li>
		            <li><a href="/showCity-${city}-2-1.html" id="2" rel="external">特产</a></li>
		            <li><a href="/showCity-${city}-3-1.html" id="3" rel="external">酒店</a></li>
		          <!-- <li><a href="/showCity-${city}-4-1.html" id="4" rel="external">美食</a></li>-->
		          <c:if test="${city=='beijing'}">
		           <li><a href="/routetopicbj.html" id="5" rel="external">旅游线路</a></li>
				  </c:if>
				  <c:if test="${city=='tianjin'}">
				  <li><a href="/routetopictj.html" id="5" rel="external">旅游线路</a></li>
				  </c:if>
				  <c:if test="${city=='haikou'}">
				  <li><a href="/routetopic_haikou.html" id="5" rel="external">旅游线路</a></li>
				  </c:if>
				  <c:if test="${city=='sanya'}">
				  <li><a href="/routetopic_sanya.html" id="5" rel="external">旅游线路</a></li>
				  </c:if>
		        </ul>
    		</div><!-- /navbar -->
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
