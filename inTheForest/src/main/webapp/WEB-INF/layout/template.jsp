<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="1n the 숲" />
        <meta name="author" content="1n the 숲" />
        <title>1n the 숲 캠핑장</title>
        <!-- Favicon.io 사이트에서 생성한 favicon.ico -->
        <link rel="icon" type="image/x-icon" href="assets/site/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/site/template.css" rel="stylesheet" />
        <link href="css/site/template_custom.css" rel="stylesheet" /> <!-- Bootstrap 외 직접 추가한 css -->

        <link href="css/board/boardList.css" rel="stylesheet" />
        <link href="css/board/board.css" rel="stylesheet" />
        <link href="css/board/boardAddForm.css" rel="stylesheet" />
        <link href="css/board/boardModifyForm.css" rel="stylesheet" />
    </head>
    <body>
    <%
    	String memberId = (String)session.getAttribute("memberId");
    %>
        <header>
            <div class="loginTop container">
            		<c:if test="${permission != 'admin' && memberId != null}">
                		<a href="#" onclick="checkId('<%=memberId%>')" id= "checkId" >마이페이지</a>
            		</c:if>
                <%if (memberId == null) {%>
               		<a href="login.do">로그인</a>
                <%} else{ %>
                	<a href="logOut.do">로그아웃[<%=memberId%>]</a>
                <%} %>
            </div>
            <!-- Responsive navbar-->
            <nav class="navbar navbar-expand-lg navbar-dark bg-custom">
                <div class="container">
                    <a class="navbar-brand" href="main.do">
                        <img src="assets/site/logo_white_long.png" alt="logo">
                    </a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                            <li class="nav-item"><a class="nav-link" href="main.do">홈</a></li>
                            <li class="nav-item"><a class="nav-link" href="intro.do">시설안내</a></li>
                            <c:if test="${permission != 'admin'}">
	                            <li class="nav-item"><a class="nav-link" href="bookCalendar.do">실시간예약</a></li>
                            </c:if>
                            <li class="nav-item"><a class="nav-link" href="boardList.do?category=notice">공지사항</a></li>
                            <li class="nav-item"><a class="nav-link" href="boardList.do?category=review">이용후기</a></li>
                            <li class="nav-item"><a class="nav-link" href="boardList.do?category=qna">문의하기</a></li>
                        </ul>
                    </div>
                </div>
            </nav>

            <!-- 관리자 로그인 시, 관리자 메뉴 추가로 표시 -->
            <c:if test="${permission == 'admin'}">
            	  <!-- Responsive navbar-->
		            <nav class="navbar navbar-expand-lg navbar-dark bg-deepMint">
		                <div class="container">
		                		<h3 class="navbar-brand fw-bolder">관리자메뉴</h3>
		                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
		                        <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
		                            <li class="nav-item"><a class="nav-link" href="memberList.do">회원관리</a></li>
		                            <li class="nav-item"><a class="nav-link" href="myPageBookList.do">예약관리</a></li>
                                    <li class="nav-item"><a class="nav-link" href="siteList.do">숙소관리</a></li>
                                    <li class="nav-item"><a class="nav-link" href="optionManagement.do">예약옵션</a></li>
                                </ul>
		                    </div>
		                </div>
		            </nav>
            </c:if>
        </header>

        <!-- Page content-->
        <div id="pageContent">
			<tiles:insertAttribute name="body" />
        </div>
        
        <!-- Footer-->
        <footer>
            <div class="py-4">
	            <img src="assets/site/logo_white_vertical.png" alt="logo">
	            <span class="text-left text-white">
	                TEL : 053-133-1333<br>주소 : 대구광역시 달서구 앞산순환로 248, 1n the 숲 캠핑장<br>
	                <span class="text-muted">
	                    Copyright &copy; 1n the 숲 2024
	                </span>
	            </span>
            </div>
        </footer>
        <script src="js/site/template.js"></script>
        <script src="js/member/checkid.js"></script>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
