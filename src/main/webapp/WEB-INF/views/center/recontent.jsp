<%@page import="com.itwillbs.board.db.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
%>
<!-- 게시판 -->
<article>
<h1>Notice Content</h1>
<table id="notice">
<tr><td>글번호</td><td><%=dto.getNum() %></td></tr>
<tr><td>글쓴이</td><td><%=dto.getName() %></td></tr>   
<tr><td>등록일</td><td><%=dto.getDate() %></td></tr>   
<tr><td>조회수</td><td><%=dto.getReadcount() %></td></tr> 
<tr><td>글제목</td><td><%=dto.getSubject() %></td></tr>
<tr><td>글내용</td><td><%=dto.getContent() %></td></tr>
</table>
<div id="table_search">
<%
//글쓴이dto.getName()   로그인(세션 id)  일치하면 => 글수정, 글삭제 보이기
if(id!=null){
	if(dto.getName().equals(id)){
	%>
<input type="button" value="글수정" class="btn"
 onclick="location.href='./ReBoardUpdateForm.bo?num=<%=dto.getNum()%>'">
 <input type="button" value="글삭제" class="btn"
 onclick="location.href='./ReBoardDelete.bo?num=<%=dto.getNum()%>'">	
	<%
	}
%>
<input type="button" value="답글쓰기" class="btn"
 onclick="location.href='./ReReBoardWriteForm.bo?num=<%=dto.getNum()%>&re_ref=<%=dto.getRe_ref()%>&re_lev=<%=dto.getRe_lev()%>&re_seq=<%=dto.getRe_seq()%>'">
<%	
}
%>
<input type="button" value="글목록" class="btn"
 onclick="location.href='./BoardList.bo'">
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