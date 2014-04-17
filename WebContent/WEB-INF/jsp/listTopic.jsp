<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib prefix="vehicle" tagdir="/WEB-INF/tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>车载系统</title>
<link rel="stylesheet" href="<c:url value="/public/css/jquery.mobile-1.3.2.css"/>" type="text/css">
<link rel="stylesheet" href="<c:url value="/public/css/menu.css" />" type="text/css">
<link rel="stylesheet" href="<c:url value="/public/css/flexslider.css" />" type="text/css">
<script src="<c:url value="/public/js/jquery.js"/>" type="text/javascript"> </script>
<script src="<c:url value="/public/js/menu.js"/>" type="text/javascript"> </script>
<script src="<c:url value="/public/js/jquery.mobile-1.3.2.js"/>" type="text/javascript"> </script>
<script src="<c:url value="/public/js/jquery.flexslider.js"/>"></script>
<script src="<c:url value="/public/js/jquery.dotdotdot.js"/>"></script>
<style type="text/css">
    div.dotDes {
        display:none;
        width:95%;
        padding:10px;
        margin:auto;
        margin-top: -0.6em;
        height:40px;
    }
     p{
         text-indent: 2em; /*em是相对单位，2em即现在一个字大小的两倍*/
      }
.custom-li {
    padding: 0 !important;
    border-width:0 !important;
}

.custom-bottom-li {
    border-top-width: 0 !important;  
}

.custom-collapsible {
    margin: 0 !important;   
    border-bottom-right-radius: 0 !important;
    border-bottom-left-radius: 0 !important;
    border-top-right-radius: 0 !important;
    border-top-left-radius: 0 !important;
    border-width:0 !important;
}
</style>
<!-- Load the flexslider -->
<script type="text/javascript" charset="utf-8">
//根据选择的数量计算总价，并显示出来
function setTotal(){
		var t = $("#num");
		var tmp = document.getElementById("totalPrice");//需要修改的总价位置1
		var tmp1 = document.getElementById("totalPrice1");//需要修改的总价位置2
		if(/\D/.test(t.val())){//检查用户输入的值是否是数字
		alert("请您输入正确的数量！");
		t.val(1);
		tmp.innerHTML = "2488元";
		tmp1.innerHTML = "2488元";
		}
		else{//如果输入合法			
	           if(t.val() > 10){
			     confirm("您真的准备一次购买这么多？");
			     tmp.innerHTML = t.val()*2488 +"元";
			     tmp1.innerHTML = t.val()*2488 +"元";
	            }
		}
}
 
$(function(){ //这里是加减按钮都启用的情况
	var t = $("#num"); 
	$("#add").click(function(){		
		t.val(parseInt(t.val())+1)
		setTotal();
	})
	$("#min").click(function(){
		if(t.val()>1){
		t.val(parseInt(t.val())-1);
		}
		else{
		alert("至少购买一件哦！");
		}
		setTotal();
	})
});
$('#add').attr('disabled',"true");  
            function listview_onclick(index){
                //alert(index);
                $('#field_'+index).toggle();
                if($('#field_'+index).is(':hidden')){
                    $('#li_'+index).buttonMarkup({ icon: "arrow-d" });
                }else{
                    $('#li_'+index).buttonMarkup({ icon: "arrow-u" });
                }
            }
        </script>
<script type="text/javascript" charset="utf-8">
    $(window).load(function() {
    	var init0=5;
    	console.log("init0 = "+init0);
        var customSlider = new useCurSlideHere();
        $('.flexslider').flexslider({
            animation: "fade",  // slide or fade
            slideshow: false,
            controlsContainer: ".flex-container", // the container that holds the flexslider
            before: function(slider) {
                customSlider.setCurSlide(slider.getTarget("next"));
            }
        });
        customSlider.setCurSlide(0);
    });
    
    
    function useCurSlideHere() {
        this.curSlide = -1;
        this.setCurSlide = function(curSlide) { //初始化description
            $('#dot'+this.curSlide).toggle();
            $('#dot'+curSlide).toggle();
            this.curSlide = curSlide;
            
            $('#dot'+curSlide).css("height","40px");
            $('#dot'+curSlide).dotdotdot({
                after: 'a.more'
            });
            var isTruncated = $("#dot"+curSlide).triggerHandler("isTruncated");
            //alert(isTruncated);
            if ( isTruncated ) {
                $('#dot'+curSlide).trigger("destroy.dot");
                $('#moreless'+curSlide).text(" 更多 »");
                $('#dot'+curSlide).dotdotdot({
                    after: 'a.more'
                });
                $('#moreless'+curSlide).unbind('click');
                $('#moreless'+curSlide).click(function(){toggleDot(curSlide);});
            }
        }
        
        this.getCurSlide= function() {
            alert(this.curSlide);
        }
    }

function toggleDot(curSlide){
    if( $('#moreless'+curSlide).text()==" 更多 »"){
        //alert(1);
        $('#dot'+curSlide).trigger("destroy.dot")
        $('#moreless'+curSlide).html("<p style='text-align:right; margin:0px;color:#01ffff'>收起 » </p>");
        $('#dot'+curSlide).css("height","auto");
        $('#moreless'+curSlide).unbind('click');
        $('#moreless'+curSlide).click(function(){toggleDot(curSlide);});
    }else{
        //alert(2);
        $('#moreless'+curSlide).text(" 更多 »");
        $('#dot'+curSlide).css("height","40px");
        $('#dot'+curSlide).dotdotdot({
            after: 'a.more'
        });
    }
}
</script>
</head>
<body>
	<div data-role="page" data-theme="a" id="demo-page">
		<div id="header" data-role="header" data-position="fixed" data-tap-toggle="false"> 
			<h1>${topic.topicTitle}</h1>
			<a href="/vehicle/index.html" data-icon="home" rel="external" data-role="button" class="ui-btn-left">首页</a>
		</div>
		<div data-role="content" >
		 <!-- Slider Container and Images -->
		<div style="width:98%; margin:auto; border-style:solid; border-width:4px; border-radius:6px; border-color:#B6B7B9;">
			<div class="flexslider">
		 		<ul class="slides">
		 			<c:forEach var="descr" items="${allDescr}">
			 		<li><img src="<c:url value="/public/images/topic/topic-${topic.topicId}/${descr.descrPinyin}.jpg"/>">
		                <div class="flex-caption">${descr.descrName}</div>
		            </li> 
			 		</c:forEach>
			 	</ul>
			 </div>
			 <c:forEach var="descr" items="${allDescr}" varStatus="index">
			  	
			  	<div id="dot${index.index}" class="dotDes">${descr.descrText}
		        <a style="white-space:nowrap; text-decoration: underline;color:#01ffff" class="more" id="moreless${index.index}" ></a>
		    	</div>
			 </c:forEach>
		</div>
		
		 <ul data-role="listview" data-inset="true">
			    <c:if test="${topic.boardId==3}">
			    	<li data-icon="false"><a><img src="<c:url value="/public/images/icon/title/rank.png"/>" class="ui-li-icon">${topic.rank}</a></li>
			    </c:if>
                	<li><a href="#my_summary" data-transition="slide"><img src="<c:url value="/public/images/icon/title/summary.png"/>" class="ui-li-icon ui-corner-none">简介</a></li>
               <c:if test="${topic.boardId==3}">
                <li data-icon="arrow-d" id="li_1" onclick="listview_onclick(1)"><a href="#"><img src="<c:url value="/public/images/icon/title/ticket.png"/>" class="ui-li-icon">在线订购</a></li>
    			</c:if>
                <c:if test="${topic.boardId==1}">
                	<li data-icon="arrow-d" id="li_1" onclick="listview_onclick(1)"><a href="#"><img src="<c:url value="/public/images/icon/title/ticket.png"/>" class="ui-li-icon">门票</a></li>
                 <li id="field_1" style="display:none; font-weight:normal"> <c:out value="${topic.ticket}" escapeXml="false"/></li>
    			</c:if>
    			<c:if test="${topic.boardId==4}">
    				<li data-icon="false"><a><img src="<c:url value="/public/images/icon/title/recommend.png"/>" class="ui-li-icon">推荐菜:${topic.recommend}</a></li>
    				<li data-icon="false"><a href="#"><img src="<c:url value="/public/images/icon/title/consume.png"/>" class="ui-li-icon">人均消费：${topic.consume}</a></li>
    			</c:if>
    			<c:if test="${topic.boardId==2}">
    				<li data-icon="false"><a><img src="<c:url value="/public/images/icon/title/recommend.png"/>" class="ui-li-icon">推荐店:${topic.recommend}</a></li>
    				<li data-icon="false"><a href="#"><img src="<c:url value="/public/images/icon/title/consume.png"/>" class="ui-li-icon">价格：${topic.consume}</a></li>
    			</c:if>
    			<c:if test="${topic.boardId==4}">
    				<li data-icon="false"><a><img src="<c:url value="/public/images/icon/title/rank.png"/>" class="ui-li-icon">营业时间：${topic.rank}</a></li>
    			</c:if>
    			<c:if test="${topic.boardId!=2}">
                <li data-icon="false"><a href="#"><img src="<c:url value="/public/images/icon/title/tel.png"/>" class="ui-li-icon"><c:out value="${topic.tel}"/></a></li>
                <li data-icon="arrow-d" id="li_3" onclick="listview_onclick(3)"><a href="#"><img src="<c:url value="/public/images/icon/title/address.png"/>" class="ui-li-icon">地址信息</a></li>
                <li id="field_3" style="display:none; font-weight:normal"> <c:out value="${topic.address}" escapeXml="false"/></li>
                <c:if test="${topic.boardId!=3&&topic.boardId!=4}">
                <li data-icon="arrow-d" id="li_2" onclick="listview_onclick(2)"><a href="#"><img src="<c:url value="/public/images/icon/title/traffic.png"/>" class="ui-li-icon">交通信息</a></li>
                <li id="field_2" style="display:none; font-weight:normal"> <c:out value="${topic.route}" escapeXml="false"/></li>
        		</c:if>
        		</c:if>
         </ul>
         <!-- 评论部分的注销 -->
         <!--  
         <p style="border-top: solid 1px #8F8D8D; padding:5px; margin:auto"></p>
            <div data-role="fieldcontain" style="border: none; width:100%; padding:0px">
                <textarea name="textarea" id="textarea"  style="width:100%;height: 50px; resize: none;max-height: 50px;"></textarea>
            </div>
         <p> <a href="#" data-role="button" data-theme="b" data-inline="true" style="margin-bottom:0.6em; margin-top:-0.8em; float:right">点评</a> </p>
         
         <div class="ui-corner-all custom-corners">
         	<c:forEach var="comment" items="${pagedComment.result}">
         		<div class="ui-bar ui-bar-a" style="border-top-left-radius: 6px; border-top-right-radius: 6px;">
             	   游客<span style="float:right; font-size: 12px; color:#8F8D8D">${comment.createTime}</span>
                </div>
                <div class="ui-body ui-body-a" style="margin-bottom:5px">
                    <p style="margin: 5px">${comment.commentText}</p>
                </div>
         	</c:forEach>
         </div> 
		-->
		</div>
		<div data-role="footer" class="ui-bar" data-position="fixed" data-id="footernav" data-position="fixed" data-tap-toggle="false">
		</div>
	</div>
	<!-- a new page -->
	<div data-role="page" id="my_summary" data-theme="a">
		<div data-role="header" data-add-back-btn="true">
			<a href="#demo-page" id="backhome" data-transition="slide" data-direction="reverse" data-icon="arrow-l">返回</a>
	     	<h1>简介</h1>
    	</div>
		<div data-role="content">
			<c:out value="${topic.summary}"  escapeXml="false"/>			 
	    </div>
	</div>		
</body>
</html>
