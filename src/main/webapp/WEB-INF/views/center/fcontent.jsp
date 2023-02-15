<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>center/fcontent.jsp</title>
<link href="${pageContext.request.contextPath }/resources/css/default.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/subpage.css" rel="stylesheet" type="text/css">
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
<li><a href="${pageContext.request.contextPath }/board/list">Notice</a></li>
<li><a href="${pageContext.request.contextPath }/board/relist">1:1 문의</a></li>
<li><a href="${pageContext.request.contextPath }/board/flist">Driver Download</a></li>
<li><a href="#">Service Policy</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->
<!-- 게시판 -->
<article>
<h1>File Notice Content</h1>
<table id="notice">
<tr><td>글번호</td><td>${boardDTO.num}</td></tr>
<tr><td>글쓴이</td><td>${boardDTO.name}</td></tr>   
<tr><td>등록일</td><td>${boardDTO.date}</td></tr>   
<tr><td>조회수</td><td>${boardDTO.readcount}</td></tr> 
<tr><td>글제목</td><td>${boardDTO.subject}</td></tr>
<tr><td>첨부파일</td>
<td><a href="./upload/${boardDTO.file}" download>${boardDTO.file}</a>
<img src="${pageContext.request.contextPath }/resources/upload/${boardDTO.file}" width="50" height="50">
</td></tr>
<tr><td>글내용</td><td>${boardDTO.content}</td></tr>
</table>
<div id="table_search">
<c:if test="${boardDTO.name eq sessionScope.id }">
	<input type="button" value="글수정" class="btn"
	onclick="location.href='${pageContext.request.contextPath }/board/update?num=${boardDTO.num }'">
	<input type="button" value="글삭제" class="btn"
	onclick="location.href='${pageContext.request.contextPath }/board/delete?num=${boardDTO.num }'">
</c:if>
<input type="button" value="글목록" class="btn"
	onclick="location.href='${pageContext.request.contextPath }/board/flist'">
 
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