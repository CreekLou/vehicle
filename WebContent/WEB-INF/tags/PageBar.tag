<%@ tag pageEncoding="UTF-8" %>
<!--① 声明JSTL标签，以便在本标签中使用之-->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!--② 定义了两个标签属性-->
<%@ attribute name="pageUrl" required="true" rtexprvalue="true" description="分页页面对应的URl" %>
<%@ attribute name="pageAttrKey" required="true" rtexprvalue="true" description="Page对象在Request域中的键名称" %>
<c:set var="pageUrl" value="${pageUrl}" />
<!--③ 将一些标签中需要引用的对象放置到PageContext属性列表中，
以便后面可以直接通过EL表达式引用之-->
<!-- 
pageUrl="/board/listBoardTopics-${board.boardId}.html"
pageAttrKey="pagedTopic"
 -->
<%
   String separator = pageUrl.indexOf("?") > -1?"&":"?";
   %>
    <c:out value="1------"/>
   <c:out value="${separator}"/>
   <c:out value="2------"/>
   <c:out value="${pageAttrKey}"/>
   <c:out value="3------"/>
   <%
   jspContext.setAttribute("pageResult", request.getAttribute(pageAttrKey));
   jspContext.setAttribute("pageUrl", pageUrl);
   jspContext.setAttribute("separator", separator);
   %>
   <c:out value="4-------"/>
  <c:out value="${pageResult}"/>
   <c:out value="5-------"/>
  <c:out value="${pageUrl}"/>
  <c:out value="6------"/>
  <c:out value="${separator}"/>
  <c:out value="---------"/>
  <%
%>
<!--④ 构造分页导航栏-->
<div data-role="navbar">
<ul>
	<!-- 共${pageResult.totalPageCount}页，第${pageResult.currentPageNo}页 -->
	<li>
	<c:if test="${pageResult.currentPageNo <=1}">
	   <a  data-role="button">首页</a>
	</c:if>
	<c:if test="${pageResult.currentPageNo >1 }">
	   <a href="<c:url value="${pageUrl}"/>${separator}pageNo=1" data-role="button">首页</a>
	</c:if>
	</li>
	<li>
	<c:if test="${pageResult.hasPreviousPage}">
	  <a href="<c:url value="${pageUrl}"/>${separator}pageNo=${pageResult.currentPageNo -1 }" data-role="button">上页</a>
	</c:if>
	<c:if test="${!pageResult.hasPreviousPage}">
	  <a  data-role="button">上页</a>
	</c:if>
	</li>
	<li>
	<c:if test="${pageResult.hasNextPage}">
	  <a href="<c:url value="${pageUrl}"/>${separator}pageNo=${pageResult.currentPageNo +1 }" data-role="button">下页</a>
	</c:if>
	<c:if test="${!pageResult.hasNextPage}">
	   <a  data-role="button">下页</a>
	</c:if>
	</li>
	<li>
	<c:if test="${pageResult.currentPageNo >= pageResult.totalPageCount}">
	   <a  data-role="button">末页</a>
	</c:if>
	<c:if test="${pageResult.currentPageNo < pageResult.totalPageCount}">
	   <a href="<c:url value="${pageUrl}"/>${separator}pageNo=${pageResult.totalPageCount }" data-role="button">末页</a>
	</c:if>
	</li>
	</ul>
</div>