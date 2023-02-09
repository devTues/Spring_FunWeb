<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/join.jsp</title>
<link href="${pageContext.request.contextPath }/resources/css/default.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/subpage.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/script/jquery-3.6.3.js"></script>
<script type="text/javascript">
 	$(document).ready(function() {
//  		alert("시작");
		// 대상.함수()  
		// 대상  : * , 태그 , id=이름 => #이름 , class=이름 => .이름
		// 함수 :  css(), attr(), html() , append()
		//     :  click(), submit(), val(), focus()
		//     :  each() , ajax()
		$('.dup').click(function(){
// 			alert("아이디 중복체크");
			//대상 가상주소 => 자바파일에 메서드
			if($('.id').val() == "" ){
				alert("아이디 입력하세요");
				$('.id').focus();
				return false;
			}
			$.ajax({
				url:'${pageContext.request.contextPath }/member/idCheck',
				data:{'id':$('.id').val()},
				success: function(rdata){
					if(rdata=='iddup'){
						rdata="아이디 중복";
					} else {
						rdata="아이디 사용가능";
					}
					$('.dupdiv').html(rdata);
				}
			});
//          class="dupdiv"
// 			$('.dupdiv').html("아이디 중복").css('color','red');
// 			$('.dupdiv').html("아이디 사용가능").css('color','green');
		});	
		
		// id="join"
		$('#join').submit(function(){
// 			alert("회원가입");
			// class="id"
// 			alert($('.id').val());
			
			if($('.id').val() == "" ){
				alert("아이디 입력하세요");
				$('.id').focus();
				return false;
			}
			//pass 제어
			if($('.pass').val()==""){
				alert("비밀번호 입력하세요");
				$('.pass').focus();
				return false;
			}
			//name 제어
			if($('.name').val()==""){
				alert("이름 입력하세요");
				$('.name').focus();
				return false;
			}
			//email 제어
			if($('.email').val()==""){
				alert("이메일 입력하세요");
				$('.email').focus();
				return false;
			}
			
		
		});
		
 	});
 
</script>
 
</head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 본문메인이미지 -->
<div id="sub_img_member"></div>
<!-- 본문메인이미지 -->
<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="#">Join us</a></li>
<li><a href="#">Privacy policy</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->
<!-- 본문내용 -->
<article>
<h1>Join Us</h1>
<form action="${pageContext.request.contextPath }/member/joinPro" method="post" id="join">
<fieldset>
<legend>Basic Info</legend>
<label>User ID</label>
<input type="text" name="id" class="id">
<input type="button" value="dup. check" class="dup"><br>
<label></label>
<div class="dupdiv"></div><br>

<label>Password</label>
<input type="password" name="pass" class="pass"><br>
<label>Retype Password</label>
<input type="password" name="pass2" class="pass2"><br>
<label>Name</label>
<input type="text" name="name" class="name"><br>
<label>E-Mail</label>
<input type="email" name="email" class="email"><br>
<label>Retype E-Mail</label>
<input type="email" name="email2" class="email2"><br>
</fieldset>

<fieldset>
<legend>Optional</legend>
<label>Address</label>
<input type="text" name="address" class="address"><br>
<label>Phone Number</label>
<input type="text" name="phone" class="phone"><br>
<label>Mobile Phone Number</label>
<input type="text" name="mobile" class="mobile"><br>
</fieldset>
<div class="clear"></div>
<div id="buttons">
<input type="submit" value="Submit" class="submit">
<input type="reset" value="Cancel" class="cancel">
</div>
</form>
</article>
<!-- 본문내용 -->
<!-- 본문들어가는 곳 -->

<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>