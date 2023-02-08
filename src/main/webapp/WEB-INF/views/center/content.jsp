<%@page import="com.itwillbs.board.db.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>center/content.jsp</title>
<link href="./css/default.css" rel="stylesheet" type="text/css">
<link href="./css/subpage.css" rel="stylesheet" type="text/css">
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
<%
//세션값 가져오기
String id=(String)session.getAttribute("id");

%>
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
<li><a href="./BoardList.bo">Notice</a></li>
<li><a href="./ReBoardList.bo">1:1 문의</a></li>
<li><a href="./FileBoardList.bo">Driver Download</a></li>
<li><a href="#">Service Policy</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->
<%
BoardDTO dto=(BoardDTO)request.getAttribute("dto");

// EL: 표현언어
// 연산자: . , [], () ,조건?참값:거짓값, empty(null인경우
// +, -, *, / div, % mode
// && and, || or, ! not,
// == eq, != ne, < lt, > gt, <= le, >= ge
// 내장객체: sessionScope,
// 출력 %= % 대신 -> ${출력내용}

// JSTL(JSP Standard Tag Library: JSP 표준 태그 함수)
// 프로그램 설치
// <c:if>, <c:choose>, <c:when>, <c:otherwise>
// <c:forEach>, <c:forTokens>
// <c:redirect>, <c:import>, <c:url>
%>
<!-- 게시판 -->
<article>
<h1>Notice Content</h1>
<table id="notice">
<tr><td>글번호</td><td>${dto.num}</td></tr>
<tr><td>글쓴이</td><td>${dto.name}</td></tr>   
<tr><td>등록일</td><td>${dto.date}</td></tr>   
<tr><td>조회수</td><td>${dto.readcount}</td></tr> 
<tr><td>글제목</td><td>${dto.subject}</td></tr>
<tr><td>글내용</td><td>${dto.content}</td></tr>
</table>
<div id="table_search">
<%-- <% --%>
<!-- //글쓴이dto.getName()   로그인(세션 id)  일치하면 => 글수정, 글삭제 보이기 -->
<!-- if(id!=null){ -->
<!-- 	if(dto.getName().equals(id)){ -->
<!-- 	%> -->
<!-- <input type="button" value="글수정" class="btn" -->
<%--  onclick="location.href='./BoardUpdateForm.bo?num=${dto.num}"> --%>
<!--  <input type="button" value="글삭제" class="btn" -->
<%--  onclick="location.href='./BoardDelete.bo?num=${dto.num}'">	 --%>
<%-- 	<% --%>
<!-- 	} -->
<!-- } -->
<!-- %> -->
<input type="button" value="글목록" class="btn"
 onclick="location.href='./BoardList.bo'">
 
 <c:if test="${! empty sessionScope.id }">
 	<c:if test="${dto.name eq sessionScope.id}">
 	<input type="button" value="글수정" class="btn"
	 onclick="location.href='./BoardUpdateForm.bo?num=${dto.num}'">
	 <input type="button" value="글삭제" class="btn"
 	onclick="location.href='./BoardDelete.bo?num=${dto.num}'">	
 	</c:if>
 </c:if>
 
</div>	

<div class="clear"></div>
<div id="page_control">
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