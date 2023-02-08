<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<header>
<%-- <% --%>
<!-- // 세션값 가져오기 -->
<!-- String id=(String)session.getAttribute("id"); -->
<!-- if(id==null){ -->
<!-- 	// 로그인 안 한 경우=> 세션값 없음  => 세션값이 null 같음 -->
<!-- 	%> -->
<!-- <div id="login"><a href="./MemberLoginForm.me">login</a> |  -->
<!--                 <a href="./MemberInsertForm.me">join</a></div>			 -->
<%-- 	<% --%>
<!-- }else{ -->
<!-- 	// 로그인 한 경우 => 세션값 있음 => 세션값이 null 아님 -->
<!-- 	%> -->
<%-- <div id="login">${sessionScope.id} 님 |  --%>
<!--                 <a href="./MemberLogout.me">logout</a> |  -->
<!--                 <a href="./MemberUpdateForm.me">update</a></div>			 -->
<%-- 	<% --%>
<!-- } -->
<!-- %> -->

<c:if test="${empty sessionScope.id}">
<div id="login"><a href="${pageContext.request.contextPath }/member/login">login</a> | 
                <a href="${pageContext.request.contextPath }/member/join">join</a></div>		
</c:if>
               
<c:if test="${! empty sessionScope.id}">
<div id="login">${sessionScope.id} 님 |
 				<a href="${pageContext.request.contextPath }/main/logout">logout</a> | 
                <a href="${pageContext.request.contextPath }/member/update">update</a></div>	
</c:if>

<div class="clear"></div>
<!-- 로고들어가는 곳 -->
<div id="logo"><img src="${pageContext.request.contextPath }/resources/images/logo.gif" width="265" height="62" alt="Fun Web"></div>
<!-- 로고들어가는 곳 -->
<nav id="top_menu">
<ul>
	<li><a href="${pageContext.request.contextPath }/main/main">HOME</a></li>
	<li><a href="${pageContext.request.contextPath }/company/welcome">COMPANY</a></li>
	<li><a href="#">SOLUTIONS</a></li>
	<li><a href="${pageContext.request.contextPath }/board/list">CUSTOMER CENTER</a></li>
	<li><a href="#">CONTACT US</a></li>
</ul>
</nav>
</header>
