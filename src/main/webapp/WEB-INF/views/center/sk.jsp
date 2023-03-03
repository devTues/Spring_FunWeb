<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>productPage.jsp</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/harVest_js/jquery-3.6.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/harVest_js/projectPage.js"></script>
<link href="${pageContext.request.contextPath}/resources/harVest_css/app.d69b58d686469c0a1bc8.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/harVest_css/projectPage.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/harVest_css/productUpdate.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script type="text/javascript">
$(document).ready(function(){
//    $(".comm").on("click", commSubmit()); // class="comm"이 적힌 버튼을 클릭하면 commSubmit이 작동됨
$(".comm").click(function(){
   commSubmit(this.id);
});
});

function commSubmit(id){
	var content = $('#title').val();
   // ${pageContext.request.contextPath }/project/CommunityWrite
   $.ajax ({
        // URL은 필수 요소이므로 반드시 구현해야 하는 Property입니다.
        url   : "${pageContext.request.contextPath }/project/CommunityWriteAjax", // 요청이 전송될 URL 주소
        type   : "POST", // http 요청 방식 (default: ‘GET’)
        data  : { 'contentLabel': id,
        		  'ID' : '${sessionScope.id}',
        		  'PJ_IDX' : 
        	      'CONTENT': content},  // 요청 시 포함될 데이터. contentLabel이라는 키(변수명같은거)에 id 값을 넣기 
//        contentType : "application/json", // 요청 컨텐트 타입 
//        dataType    : "json", // 응답 데이터 형식 (명시하지 않을 경우 자동으로 추측)
        success : function(data) { // function(data)가 성공하면 콘솔에 data찍어줘 
           console.log(data)     //  콘솔에 data찍어줘. 컨트롤러에서 return값 돌려 받음
        }
      });
}

// 업데이트탭 글쓰기
$(function(){
   $('#onDisplay').click(function(){
         if($("#U_write").css("display") == "none"){
            $('#U_write').show();
            $('#U_list').hide();
         }
   });
});

$(function(){
   $('#profile-tab').click(function(){
            $('#U_list').show();
            $('#U_write').hide();
            $('#updateForm')[0].reset();
   });
});

// 커뮤니티탭 글쓰기

</script>

 <form action="${pageContext.request.contextPath}/project/CommunityWritePro" id="communityForm_1" method="post">
  <div class="style__CommentForm-sc-1w2k1pt-0 jmfZuM">
     <div class="InputWithGuideAndLengthCheck__Wrapper-sc-9nmfrw-0 eCSxwJ style__StyledInputWithGuideAndLengthCheck-sc-1w2k1pt-1 kMOyow">
        <div class="InputWithGuideAndLengthCheck__InputWrapper-sc-9nmfrw-3 bBnjVq">
           <div class="Textarea__Wrapper-sc-1mj6ym2-0 vnOMO InputWithGuideAndLengthCheck__StyledTextarea-sc-9nmfrw-2 gswCBK">
              <input type="hidden" id="id" name="id" value="${sessionScope.id}">
              <input type="hidden" name="idx" value="${communityDTO.idx}">
              <textarea name = "content" placeholder="창작자에게 응원의 한마디~!" class="Textarea__StyledTextArea-sc-1mj6ym2-1 cjoUaQ" style="height: 50px;"></textarea>
           </div>
        </div>
        <div class="InputWithGuideAndLengthCheck__NoticeArea-sc-9nmfrw-4 ciHGYP">
           <p class="InputWithGuideAndLengthCheck__GuideMessage-sc-9nmfrw-5 fduvas"></p>
           <span class="InputWithGuideAndLengthCheck__CountLength-sc-9nmfrw-6 kEJJPl">0/1000</span>
        </div>
     </div>
     <div class="style__ButtonContainer-sc-1w2k1pt-2 bpssQi">
           <button type="button" id="COM1" class="comm">작성하기</button><br>
      </div>
   </div>
</form>   






</head>
<body>
   <!-- 상품 이미지 및 간략 정보 -->
   <input type="checkbox" id="fundingBtn" style="display:none;">
   <div id="productContent">
      <div class="prod_title">
         <button>${projectDTO.category}</button>
         <h1>${projectDTO.title}</h1>
      </div>
      <div class="prod_cont">
         <div> <!-- 이미지 캐러셀 -->
            <div id="carouselExampleIndicators" class="carousel slide">
              <div class="carousel-indicators">
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
              </div>
              <div class="carousel-inner">
                <div class="carousel-item active">
                  <img src="https://tumblbug-pci.imgix.net/326f0b30dedd61b1b4ab402a546ed23ff763b676/a942a2f8dc6f8cb765a188a7817e4d132d87ed86/b5f809fa459add77e412896fb41972bf73dbb890/2f162593-feb4-4450-bafa-d11bbcf334f5.jpeg?ixlib=rb-1.1.0&w=1240&h=930&auto=format%2Ccompress&lossless=true&fit=crop&s=e761a6cc2af8edba46fefb72a395250b" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item">
                  <img src="https://tumblbug-pci.imgix.net/326f0b30dedd61b1b4ab402a546ed23ff763b676/a942a2f8dc6f8cb765a188a7817e4d132d87ed86/b5f809fa459add77e412896fb41972bf73dbb890/2f162593-feb4-4450-bafa-d11bbcf334f5.jpeg?ixlib=rb-1.1.0&w=1240&h=930&auto=format%2Ccompress&lossless=true&fit=crop&s=e761a6cc2af8edba46fefb72a395250b" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item">
                  <img src="https://tumblbug-pci.imgix.net/326f0b30dedd61b1b4ab402a546ed23ff763b676/a942a2f8dc6f8cb765a188a7817e4d132d87ed86/b5f809fa459add77e412896fb41972bf73dbb890/2f162593-feb4-4450-bafa-d11bbcf334f5.jpeg?ixlib=rb-1.1.0&w=1240&h=930&auto=format%2Ccompress&lossless=true&fit=crop&s=e761a6cc2af8edba46fefb72a395250b" class="d-block w-100" alt="...">
                </div>
              </div>
              <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
              </button>
              <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
              </button>
            </div>
         </div>
         <div> <!-- 상품 정보 -->
            <div class="project_info">
               <div class="info_price">
                  <span>모인 금액</span>
                  <h2>22,003,000원</h2>
               </div>
               <div class="info_time">
                  <span>남은 시간</span>
                  <h2>29일</h2>
               </div>
               <div class="info_support">
                  <span>후원자</span>
                  <h2>292명</h2>
               </div>
            </div>
            <div class="project_summary">
               <div>
                  <div>목표 금액</div>
                  <div>${projectDTO.targetAmt}원</div>
                  <div>78%</div>
               </div>
               <div>
                  <div>펀딩 기간</div>
                  <div>${projectDTO.start}~${projectDTO.end}</div>
                  <div>29일 남음</div>
               </div>
               <div>
                  <div>결제 일시</div>
                  <div>목표금액 달성시 2023.03.06에 결제 진행</div>
                  <div>목표 달성</div>
               </div>
            </div>
            <div class="project_btn">
               <label><input type="checkbox" id="likeBtn"> 좋아요</label><!-- input checkbox로 바꾸기!!! -->
               <button>공유</button>
               <label for="fundingBtn" class="funding_btn">후원하기</label>
            </div>
         </div>
      </div>
   </div>
   <!-- 탭 메뉴 -->
   <div id="productInfoMore">
      <ul class="nav nav-tabs" id="myTab" role="tablist">
         <li class="nav-item" role="presentation">
            <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home-tab-pane" type="button" role="tab" aria-controls="home-tab-pane" aria-selected="true">프로젝트 계획</button>
         </li>
         <li class="nav-item" role="presentation">
            <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile-tab-pane" type="button" role="tab" aria-controls="profile-tab-pane" aria-selected="false">진행사항</button>
           </li>
         <li class="nav-item" role="presentation">
            <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact-tab-pane" type="button" role="tab" aria-controls="contact-tab-pane" aria-selected="false">커뮤니티</button>
         </li>
      </ul>
      <div class="fundingInfo">
         <div class="tab-content" id="myTabContent">
            <div class="tab-pane fade show active" id="home-tab-pane" role="tabpanel" aria-labelledby="home-tab" tabindex="0">
                  여기는 연서😘
            </div>
            
            
            
            <div class="tab-pane fade" id="profile-tab-pane" role="tabpanel" aria-labelledby="profile-tab" tabindex="0">
                  <div class="updateList" id="U_list">
                  
                  <!-- 로그인 되어있고 창작자 아이디와 같아야 작성하기 창 보임 -->
                  <c:if test="${!empty sessionScope.id }">
<%--                      <c:if test="${productUpdateDTO.id eq sessionScope.id }">  --%>
                        <div class="WritePostArea__CommunityNewPostWidget-sc-1bsvwui-0 fLctJN">
                              <div class="WritePostArea__LeftColumn-sc-1bsvwui-1 iaUdeD"  id = "onDisplay">창작자 공지 작성하기</div>
                                 <div name="pen" class="Icon__SVGICON-sc-1xkf9cp-0 ccxeYs WritePostArea__PenIcon-sc-1bsvwui-2 hjWJxN">
                                    <svg viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M19.9871 8.01414C20.0048 7.99644 20.0042 7.96716 19.9858 7.94875L16.0513 4.0142C16.0328 3.99578 16.0036 3.99521 15.9859 4.01291L14.1269 5.87191C14.1092 5.88961 14.1097 5.91889 14.1281 5.93731L18.0627 9.87185C18.0811 9.89027 18.1104 9.89085 18.1281 9.87314L19.9871 8.01414Z" fill="#9E9E9E"></path>
                                 <path d="M17.1653 10.836C17.183 10.8183 17.1824 10.789 17.164 10.7706C17.1455 10.7522 13.2294 6.83604 13.2294 6.83604C13.211 6.81762 13.1817 6.81705 13.164 6.83475C13.1463 6.85245 4.6668 15.332 4.6668 15.332C4.66006 15.3387 4.65571 15.3475 4.65435 15.357L4.00047 19.9454C3.99605 19.9765 4.02351 20.004 4.05455 19.9995L8.64298 19.3457C8.65253 19.3443 8.6613 19.3399 8.66803 19.3332C8.66803 19.3332 17.1476 10.8537 17.1653 10.836Z"fill="#9E9E9E"></path></svg>
                              </div>
                        </div>
<%--                      </c:if> --%>
                  </c:if>
                        <c:forEach var="dto" items="${productUpdateList }">
                           <tr>
                              <td>${dto.profile}</td>
                               <td>${dto.name}</td><br>
                               <td>${dto.content}</td><br>
                               <td><img src="${pageContext.request.contextPath }/resources/product_img/${dto.file}"></td><br>
                               <td><fmt:formatDate value="${dto.date}" pattern="yyyy.MM.dd"/></td><br><br>
                           </tr>
                        </c:forEach>
                  </div>
                  <div class="updateWrite" id="U_write"  style="display: none;">
                     <article>
                           <h1>창작자 공지사항</h1>
   
                        <form action="${pageContext.request.contextPath}/project/productUpdateWritePro" id="updateForm" method="post" enctype="multipart/form-data">
                              <table id="notice">
         <!--                         <td>글쓴이</td> -->
                                    <td><input type="hidden" name="id" value="${sessionScope.id }" readonly></td>
                                 <tr>
                                    <td>글내용</td>
                                     <td><textarea name="content" rows="10" cols="20"></textarea></td>
                                 </tr>
                                 <tr>
                                    <td>첨부파일</td>
                                     <td><input type="file" name="file" multiple="multiple"></td>
                                 </tr>   
                                 </table>
                                    <div id="table_search">
                                       <input type="submit" class="btn" value="글쓰기">
                                       <input type="hidden" name="idx" value="${productUpdateDTO.idx}">
                                       <input type="hidden" name="pjIdx" value="${productUpdateDTO.idx}">
                                    </div>   
                        </form>
                        <div class="clear"></div>
                        <div id="page_control"></div>
                     </article>
                  </div>
            </div>
            <div class="tab-pane fade" id="contact-tab-pane" role="tabpanel" aria-labelledby="contact-tab" tabindex="0">
               <!-- 커뮤니티 탭/탭 내용 -->
               <div class="container mt-5">
                  <ul class="list">
                    <li class="tab_button tab_active">응원</li>
                    <li class="tab_button">문의</li>
                    <li class="tab_button">후기</li>
                  </ul>
                  <div class="tab_content">
                  
                  <form action="${pageContext.request.contextPath}/project/CommunityWritePro" id="communityForm_1" method="post"">
                     <div class="style__CommentForm-sc-1w2k1pt-0 jmfZuM">
                        <div class="InputWithGuideAndLengthCheck__Wrapper-sc-9nmfrw-0 eCSxwJ style__StyledInputWithGuideAndLengthCheck-sc-1w2k1pt-1 kMOyow">
                           <div class="InputWithGuideAndLengthCheck__InputWrapper-sc-9nmfrw-3 bBnjVq">
                              <div class="Textarea__Wrapper-sc-1mj6ym2-0 vnOMO InputWithGuideAndLengthCheck__StyledTextarea-sc-9nmfrw-2 gswCBK">
                                 <input type="hidden" name="id" value="${sessionScope.id}">
                                 <input type="hidden" name="idx" value="${communityDTO.idx}">
                                 <textarea name = "content" placeholder="창작자에게 응원의 한마디~!" class="Textarea__StyledTextArea-sc-1mj6ym2-1 cjoUaQ" style="height: 50px;"></textarea>
                              </div>
                           </div>
                           <div class="InputWithGuideAndLengthCheck__NoticeArea-sc-9nmfrw-4 ciHGYP">
                              <p class="InputWithGuideAndLengthCheck__GuideMessage-sc-9nmfrw-5 fduvas"></p>
                              <span class="InputWithGuideAndLengthCheck__CountLength-sc-9nmfrw-6 kEJJPl">0/1000</span>
                           </div>
                        </div>
                        <div class="style__ButtonContainer-sc-1w2k1pt-2 bpssQi">
                              <button type="button" id="COM1" class="comm">작성하기</button><br>
<!--                               <button type=submit class="style__ReviewCommentRegister-sc-1w2k1pt-3 deyeeq" >등록</button> -->
                        </div>
                     </div>
                  </form>   
                  <br><br>               
                  
                            <c:forEach var="dto" items="${communityList1 }">
                              <tr>
                                 <td>${dto.commIdx}</td>
                                  <td>${dto.name}</td><br>
                                  <td>${dto.profile}</td><br>
                                     <td>${dto.contentLabel}</td>
                                     <td>${dto.content}</td><br>
                                    <td><fmt:formatDate value="${dto.date}" pattern="yyyy.MM.dd"/><br><br>
                              </tr>
                           </c:forEach>
                           
                           <!-- 댓글 시작 -->
                           <ul>
                           <li>
                              <div>
                                 <p>첫번째 댓글 작성자</p>
                                 <p>첫번째 댓글</p>
                              </div>
                           </li>
                           <li>
                              <div>
                                 <p>두번째 댓글 작성자</p>
                                 <p>두번째 댓글</p>
                              </div>
                           </li>
                           <li>
                              <div>
                                 <p>세번째 댓글 작성자</p>
                                 <p>세번째 댓글</p>
                              </div>
                           </li>
                        </ul>
                           <div>
                              <p>
                                 <label>댓글 작성자</label> <input type="text">
                              </p>
                              <p>
                                 <textarea rows="5" cols="50"></textarea>
                              </p>
                              <p>
                                 <button type="button">댓글 작성</button>
                              </p>
                           </div>
                           <!-- 댓글 끝 -->                     
                        </div>
                  <div class="tab_content">
                  
               <form action="${pageContext.request.contextPath}/project/CommunityWritePro" id="communityForm_2" method="post"">
                     <div class="style__CommentForm-sc-1w2k1pt-0 jmfZuM">
                        <div class="InputWithGuideAndLengthCheck__Wrapper-sc-9nmfrw-0 eCSxwJ style__StyledInputWithGuideAndLengthCheck-sc-1w2k1pt-1 kMOyow">
                           <div class="InputWithGuideAndLengthCheck__InputWrapper-sc-9nmfrw-3 bBnjVq">
                              <div class="Textarea__Wrapper-sc-1mj6ym2-0 vnOMO InputWithGuideAndLengthCheck__StyledTextarea-sc-9nmfrw-2 gswCBK">
                                 <input type="hidden" name="idx" value="${communityDTO.idx}">
                                 <input type="hidden" name="id" value="${sessionScope.id }">
                                 <textarea name = "content" placeholder="창작자에게 응원의 한마디~!" class="Textarea__StyledTextArea-sc-1mj6ym2-1 cjoUaQ" style="height: 50px;"></textarea>
                              </div>
                           </div>
                           <div class="InputWithGuideAndLengthCheck__NoticeArea-sc-9nmfrw-4 ciHGYP">
                              <p class="InputWithGuideAndLengthCheck__GuideMessage-sc-9nmfrw-5 fduvas"></p>
                              <span class="InputWithGuideAndLengthCheck__CountLength-sc-9nmfrw-6 kEJJPl">0/1000</span>
                           </div>
                        </div>
                        <div class="style__ButtonContainer-sc-1w2k1pt-2 bpssQi">
                              <button type="button" id="COM2" class="comm"  >작성하기</button><br>
<!--                               <button type=submit class="style__ReviewCommentRegister-sc-1w2k1pt-3 deyeeq" >등록</button> -->
                        </div>
                     </div>
                  </form>      
                     <br><br>                                        
                        <c:forEach var="dto" items="${communityList2 }">
                              <tr>
                                 <td>${dto.commIdx}</td>
                                  <td>${dto.name}</td><br>
                                  <td>${dto.profile}</td><br>
                                     <td>${dto.contentLabel}</td>
                                     <td>${dto.imgA}imgA.jsp</td>
                                     <td>${dto.imgB}imgB.jsp</td>
                                     <td>${dto.imgC}imgC.jsp</td><br>
                                     <td>${dto.content}</td><br>
                                    <td><fmt:formatDate value="${dto.date}" pattern="yyyy.MM.dd"/><br><br>
                              </tr>
                           </c:forEach>
                           
                           <!-- 댓글 시작 -->
                           <ul>
                           <li>
                              <div>
                                 <p>첫번째 댓글 작성자</p>
                                 <p>첫번째 댓글</p>
                              </div>
                           </li>
                           <li>
                              <div>
                                 <p>두번째 댓글 작성자</p>
                                 <p>두번째 댓글</p>
                              </div>
                           </li>
                           <li>
                              <div>
                                 <p>세번째 댓글 작성자</p>
                                 <p>세번째 댓글</p>
                              </div>
                           </li>
                        </ul>
                           <div>
                              <p>
                                 <label>댓글 작성자</label> <input type="text">
                              </p>
                              <p>
                                 <textarea rows="5" cols="50"></textarea>
                              </p>
                              <p>
                                 <button type="button">댓글 작성</button>
                              </p>
                           </div>
                           <!-- 댓글 끝 -->                     
                  </div>
                  <div class="tab_content">
                     <div class=communityList id="C_list">
                     <button id = "onDisplay2" >글쓰기 폼으로 가기버튼2</button><br>
                            <c:forEach var="dto" items="${communityList3 }">
                              <tr>
                                 <td>${dto.commIdx}</td>
                                  <td>${dto.name}</td><br>
                                  <td>${dto.profile}</td><br>
                                     <td>${dto.contentLabel}</td>
                                     <td>${dto.imgA}imgA.jsp</td>
                                     <td>${dto.imgB}imgB.jsp</td>
                                     <td>${dto.imgC}imgC.jsp</td><br>
                                     <td>${dto.content}</td><br>
                                    <td><fmt:formatDate value="${dto.date}" pattern="yyyy.MM.dd"/><br><br>
                              </tr>
                           </c:forEach>
                           
                           <!-- 댓글 시작 -->
                           
                           <ul>
                           <li>
                              <div>
                                 <p>첫번째 댓글 작성자</p>
                                 <p>첫번째 댓글</p>
                              </div>
                           </li>
                           <li>
                              <div>
                                 <p>두번째 댓글 작성자</p>
                                 <p>두번째 댓글</p>
                              </div>
                           </li>
                           <li>
                              <div>
                                 <p>세번째 댓글 작성자</p>
                                 <p>세번째 댓글</p>
                              </div>
                           </li>
                        </ul>
                           
                           <div>
                              <p>
                                 <label>댓글 작성자</label> <input type="text">
                              </p>
                              <p>
                                 <textarea rows="5" cols="50"></textarea>
                              </p>
                              <p>
                                 <button type="button">댓글 작성</button>
                              </p>
                           </div>
                           <!-- 댓글 끝 -->                     
                        </div>
                        <div class = "CommunityWrite"  id="C_write"  style="display: none;">
                           <article>
                                    <h1>커뮤니티 글쓰기</h1>
                                    <form action="${pageContext.request.contextPath}/project/CommunityWritePro" method="post" enctype="multipart/form-data">
                                    <table id="notice">
                                       <tr>
   <!--                                        <td>글쓴이</td> -->
                                           <td><input type="hidden" name="id" value="${sessionScope.id }" readonly></td>
                                       </tr>
                                       <tr>
                                          <td>글내용</td>
                                           <td><textarea name="content" rows="10" cols="20"></textarea></td>
                                       </tr>
                                       <tr>
                                          <td>첨부파일</td>
                                           <td><input type="file" name="file" multiple="multiple"></td>
                                       </tr>   
                                    </table>
                                    <div id="table_search">
                                    <button type="button" id="COM3" class="comm" >작성하기</button><br>
<!--                                     <input type="submit" value="글쓰기" class="btn"> -->
                                    </div>   
                                    </form>
                                    <div class="clear"></div>
                                    <div id="page_control">
                                    </div>
                        </article>
                        </div>
                  </div>
                </div>
            </div>
         </div>
         <div class="project_info_box">
            <label for="fundingBtn" class="info_x">
               <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-x-circle" viewBox="0 0 16 16">
                  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                  <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
               </svg>
            </label>
            <div class="creator_box">크리에이터 박스</div>
            <div class="prod_option">상품 옵션</div>
         </div>
         <label for="fundingBtn" class="info_bg"></label>
      </div>
   </div>
   <!-- 상세 페이지 및 창작자 소개, 금액 -->
   <div class=""></div>
   
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
</body>
</html>