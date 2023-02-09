<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>center/notice.jsp</title>
<link href="${pageContext.request.contextPath }/resources/css/default.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/subpage.css" rel="stylesheet" type="text/css">
<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->
<!--[if IE 6]>
 <script src="../script/DD_belatedPNG_0.0.8a.js"></script>
 <script>
   /* EXAMPLE */
   DD_belatedPNG.fix('#wrap');
   DD_belatedPNG.fix('#main_img');   

 </script>
 <![endif]-->
</head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 메인이미지 -->
<div id="sub_img_center"></div>
<!-- 메인이미지 -->

<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="${pageContext.request.contextPath }/board/list">Notice</a></li>
<li><a href="${pageContext.request.contextPath }/board/relist">1:1 문의</a></li>
<li><a href="${pageContext.request.contextPath }/board/flist">Driver Download</a></li>
<li><a href="#">Service Policy</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->

<!-- 게시판 -->
<article>
<h1>Notice</h1>
<table id="notice">
<tr><th class="tno">No.</th>
    <th class="ttitle">Title</th>
    <th class="twrite">Writer</th>
    <th class="tdate">Date</th>
    <th class="tread">Read</th></tr>
<%-- <% --%>
<!-- // 날짜 => 모양 문자열 변경 -->
<!-- SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy.MM.dd"); -->

<!-- for(int i=0;i<boardList.size();i++){ -->
<!-- 	BoardDTO dto=boardList.get(i); -->
<!-- 	%> -->
<%-- <tr onclick="location.href='./BoardContent.bo?num=<%=dto.getNum()%>'"> --%>
<%--     <td><%=dto.getNum() %></td> --%>
<%--     <td class="left"><%=dto.getSubject() %></td> --%>
<%--     <td><%=dto.getName() %></td> --%>
<%--     <td><%=dateFormat.format(dto.getDate()) %></td> --%>
<%--     <td><%=dto.getReadcount() %></td></tr> 	 --%>
<%-- 	<% --%>
<!-- } -->
<!-- %> -->
<c:forEach var="dto" items="${boardList }">
<tr onclick="location.href='${pageContext.request.contextPath }/board/content?num=${dto.num}'">
    <td>${dto.num}</td>
    <td class="left">${dto.subject}</td>
    <td>${dto.name}</td>
    <td><fmt:formatDate value="${dto.date}" pattern="yyy.MM.dd"/></td>
    <td>${dto.readcount}</td></tr> 
</c:forEach>

</table>
<%
//세션값 가져오기
String id=(String)session.getAttribute("id");
//세션값이 있으면 (로그인 함) => 글쓰기 버튼 보이기
if(id!=null){
	%>
<div id="table_search">
<input type="button" value="글쓰기" class="btn" 
onclick="location.href='./BoardWriteForm.bo'">
</div>	
	<%
}
%>

<div id="table_search">
<input type="text" name="search" class="input_box">
<input type="button" value="search" class="btn">
</div>
<div class="clear"></div>
<div id="page_control">

<c:if test="${pageDto.startPage > pageDto.pageBlock}">
	<a href="${pageContext.request.contextPath }/board/list?pageNum=${pageDto.startPage - pageDto.pageBlock }">[10페이지이전]</a>
</c:if>	

	<a href="${pageContext.request.contextPath }/board/list?pageNum=${pageDto.currentPage - 1 }">[이전]</a>
	
<c:forEach var="i" begin="${pageDto.startPage }" end="${pageDto.endPage }" step="1">
	<a href="${pageContext.request.contextPath }/board/list?pageNum=${i}">${i }</a>
</c:forEach>

	<a href="${pageContext.request.contextPath }/board/list?pageNum=${pageDto.currentPage + 1 }">[다음]</a>
	
<c:if test="${pageDto.endPage < pageDto.pageCount}">
	<a href="${pageContext.request.contextPath }/board/list?pageNum=${pageDto.startPage + pageDto.pageBlock }">[10페이지다음]</a>
</c:if>	


</div>
</article>
<!-- 게시판 -->
<!-- 본문들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>