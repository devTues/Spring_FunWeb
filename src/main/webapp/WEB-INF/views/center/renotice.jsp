<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.itwillbs.board.db.BoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>center/renotice.jsp</title>
<link href="./css/default.css" rel="stylesheet" type="text/css">
<link href="./css/subpage.css" rel="stylesheet" type="text/css">
</head>
<%
List<BoardDTO> boardList =(List<BoardDTO>)request.getAttribute("boardList");
int startPage=(Integer)request.getAttribute("startPage");
int pageBlock=(Integer)request.getAttribute("pageBlock");
int currentPage=(Integer)request.getAttribute("currentPage");
int endPage=(Integer)request.getAttribute("endPage");
int pageCount=(Integer)request.getAttribute("pageCount");
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

<!-- 게시판 -->
<article>
<h1>ReNotice</h1>
<table id="notice">
<tr><th class="tno">No.</th>
    <th class="ttitle">Title</th>
    <th class="twrite">Writer</th>
    <th class="tdate">Date</th>
    <th class="tread">Read</th></tr>
<%
// 날짜 => 모양 문자열 변경
SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy.MM.dd");

for(int i=0;i<boardList.size();i++){
	BoardDTO dto=boardList.get(i);
	%>
<tr onclick="location.href='./ReBoardContent.bo?num=<%=dto.getNum()%>'">
    <td><%=dto.getNum() %></td>
    <td class="left">
    <%
    //답글
    if(dto.getRe_lev() > 0){
    	int w=dto.getRe_lev()*10;
    %>
    <img src="images/center/level.gif" width=<%=w %>>	
    <img src="images/center/re.gif">
    <%	
    }
    %>
    <%=dto.getSubject() %></td>
    <td><%=dto.getName() %></td>
    <td><%=dateFormat.format(dto.getDate()) %></td>
    <td><%=dto.getReadcount() %></td></tr> 	
	<%
}
%>
</table>
<%
//세션값 가져오기
String id=(String)session.getAttribute("id");
//세션값이 있으면 (로그인 함) => 글쓰기 버튼 보이기
if(id!=null){
	%>
<div id="table_search">
<input type="button" value="글쓰기" class="btn" 
onclick="location.href='./ReBoardWriteForm.bo'">
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
<%
if(startPage > pageBlock){
	%>
	<a href="./ReBoardList.bo?pageNum=<%=startPage-pageBlock%>">Prev</a>
	<%
}
for(int i=startPage;i<=endPage;i++){
	%>
	<a href="./ReBoardList.bo?pageNum=<%=i%>"><%=i %></a>
	<%
}
if(endPage < pageCount){
	%>
	<a href="./ReBoardList.bo?pageNum=<%=startPage+pageBlock%>">Next</a>
	<%
}
%>


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