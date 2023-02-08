<%@page import="com.itwillbs.board.db.BoardDAO"%>
<%@page import="com.itwillbs.board.db.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/updatePro.jsp</title>
</head>
<body>
<%
//한글처리
// request.setCharacterEncoding("utf-8");

// //request 정보 가져오기
// //request num, name, subject, content 파라미터 가져와서 변수에 저장
// int num = Integer.parseInt(request.getParameter("num"));
// String name = request.getParameter("name");
// String subject = request.getParameter("subject");
// String content = request.getParameter("content");

// //BoardDTO객체생성(기억장소 할당)
// BoardDTO dto = new BoardDTO();

// //set메서드 호출 파라미터값 저장
// dto.setNum(num);
// dto.setName(name);
// dto.setSubject(subject);
// dto.setContent(content);

// //수정작업
// //BoardDAO 객체생성(기억장소 할당)
// BoardDAO dao = new BoardDAO();

// //리턴할형 없음 updateBoard(BoardDTO변수)메서드 정의

// // 디비작업 주소를 통해서 updateBoard(BoardDTO주소값)호출
// dao.updateBoard(dto);

//글목록
response.sendRedirect("./BoardList.bo");
%>
</body>
</html>

