<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>center/updateForm.jsp</title>
<link href="./css/default.css" rel="stylesheet" type="text/css">
<link href="./css/subpage.css" rel="stylesheet" type="text/css">
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
<h1>Notice Update</h1>
<form action="${pageContext.request.contextPath }/board/updatePro" method="post">
<input type="hidden" name="num" value="${boardDTO.num}">
<table id="notice">
<tr><td>글쓴이</td>
    <td><input type="text" name="name" value="${sessionScope.id}" readonly></td></tr>
<tr><td>글제목</td>
    <td><input type="text" name="subject" value="${boardDTO.subject}"></td></tr>
<tr><td>글내용</td>
    <td><textarea name="content" rows="10" cols="20">${boardDTO.content}</textarea></td></tr>
</table>
<div id="table_search">
<input type="submit" value="글수정" class="btn">
</div>	
</form>
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