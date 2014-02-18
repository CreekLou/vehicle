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
	$(function(){
		$.fn.serializeObject = function(){
		    var o = {};
		    var a = this.serializeArray();
		    $.each(a, function(){
		        if (o[this.name]) {
		            if (!o[this.name].push) {
		                o[this.name] = [o[this.name]];
		            }
		            o[this.name].push(this.value || '');
		        }
		        else {
		            o[this.name] = this.value || '';
		        }
		    });
		    return o;
		};
		var j =1;//初始页号
		var city ="all";//初始选择所有城市
		//var city = $("#select-choice-1").find("option:selected").val();
		console.log("城市="+city);
		console.log("---- "+$("#select-choice-1").find("option:selected").val());
		//$("#select-choice-1").find("option:selected").val("all");
		//console.log("---- "+$("#select-choice-1").find("option:selected").val());
		//var totalCount=0;//topic的记录总数
		console.log("text = "+$("#select-choice-1-button").text());
		//console.log($("#select-choice-1").prev().text());
		$("#select-choice-1").change(function(){
	        //var jsonuserinfo = $.toJSON($('#form').serializeObject());
	       // var info1= $("#select-choice-1").find("option:selected").text();
	        var info2= $("#select-choice-1").find("option:selected").val();
	        console.log("info2= "+info2);
	        var id =${board.boardId};
	        $("#more").val("查看更多");
        	$("#more").prev().text("查看更多");
        	$("#more").prev().show();
	       var pageNo =1;
	        jQuery.ajax({
	        	type: 'POST',
	            contentType: 'application/json',
	            url: '/board/listBoardCityTopics-'+info2+'-'+id+'-'+pageNo+'.do',
	           // data: infor,
	            dataType: 'json',           
	            success: function(data){
	            	if(data.pagedTopic.currentPageNo>=data.pagedTopic.totalPageCount){
	                	//$("#more").val("没有更多了");
	                	//$("#more").prev().text("没有更多了");
	                	$("#more").prev().hide();
	                }
	            	//totalCount=data.totalCount;
	            	city =data.city;
	            	console.log("第一次ajax时j的大小 = "+j);
	            	j=1;
	        		var mode = data.pagedTopic.result;
	        		
	        		console.log("总记录数："+data.pagedTopic.totalCount);
	            	$("#ul_info").empty();
	            	$.each(mode,function(i,topic){
	                	//console.log(i+"-->"+JSON.stringify(topic));
	                	console.log(i+"title-->"+topic.topicTitle);
	                	console.log("summary的大小 = "+topic.summary.length);
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

		$("#more").click(function(){
	        var id =${board.boardId};
	        var info2= $("#select-choice-1").find("option:selected").val();
	        var info3=$("#more").val();
	        console.log("more 的值="+info3);
	        var infor=JSON.stringify({boardId:id,city:info2});
	        var pageNo = ${pagedTopic.currentPageNo}+j;
	        console.log("pageNo="+pageNo+infor);
	        if(city==info2){
	        	console.log("city==info2="+info2);
	        }
	        jQuery.ajax({
	        	type: 'POST',
	            contentType: 'application/json',
	            url: '/board/listMoreCityTopics-'+city+'-'+id+'-'+pageNo+'.do',
	            dataType: 'json',           
	            success: function(data){
	            	j=j+1;
	            	console.log("第二次ajax时j的大小 = "+j);
	                var mode = data.pagedTopic.result;
	                console.log("mode的大小="+mode.length);
	                console.log("totalPagedCount的大小="+data.pagedTopic.totalPageCount);
	                console.log("pagedTopic.currentPageNo的大小="+data.pagedTopic.currentPageNo);
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
#goTopBtn {position: fixed;line-height:36px;width:36px;bottom:60px;height:36px;cursor:pointer;display:none;
background:url(/public/css/images/back_to_top_white.gif);}
</style>
</head>
<body>
	<div data-role="page" data-theme="a" id="demo-page" >
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
	              </ul>
	         </li>
		</ul>    
			<h1 style="margin-top: 10px;margin-bottom:-5px">${board.boardName}</h1>
			<a href="/vehicle/index.html" data-icon="home" rel="external" data-role="button" class="ui-btn-right">首页</a>
		</div>
		<div data-role="content" class="my-page">
		 <!--  <div data-role="fieldcontain">
			<label for="select-choice-1" class="select">选择城市:</label>
			<select name="select-choice-1" id="select-choice-1" data-native-menu="false">
				<option value="all">全部</option>
				<option value="beijing">北京</option>
				<option value="tianjin">天津</option>
			</select>
		 </div> -->
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
		<%--<a href="#cityMenu" data-rel="popup" data-role="button" data-inline="true" data-transition="slideup" data-icon="gear" data-theme="e">城市</a>
			<div data-role="popup" id="cityMenu" data-theme="d">
	        <ul data-role="listview" data-inset="true"  data-theme="d">
	            <li data-role="divider" data-theme="e">选择城市</li>
	            <li><a href="#">全部</a></li>
	            <li><a href="#">北京</a></li>
	            <li><a href="#">天津</a></li>
	        </ul>
		</div>--%>
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
		 $('body,html').animate({scrollTop:0},500);
		  });
			
</script>
</body>
</html>
