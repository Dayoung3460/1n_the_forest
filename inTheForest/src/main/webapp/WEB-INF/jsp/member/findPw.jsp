<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<title>Insert title here</title>


<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
</head>
<body>
	<div
		class="container min-vh-100 d-flex justify-content-center align-items-center" style="width:450px">
		<div class="card" style="width: 100%">
			<div class="card-header text-white text-center" style="background-color: #347C2C !important;">비밀번호 찾기 결과</div>
			<div class="card-body result-box">
				<c:choose>
					<c:when test="${not empty tempPw}">
						<p>임시 비밀번호가 발급되었습니다: <strong>${tempPw}</strong></p>
	                    <p class="text-danger">※로그인 후 반드시 비밀번호를 변경해주세요.※</p>
					</c:when>
					<c:otherwise>
						<p class="inquiry">${resultMsg}</p>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="text-center" style="margin-bottom: 20px;">
				<!-- Submit 로그인버튼 비밀번호 찾기 -->
				<button type="button" class="btn btn-outline-success" onclick="location.href='login.do'" >로그인</button>
				<button type="button" class="btn btn-outline-success" onclick="location.href='findPw.do'">비밀번호찾기</button>
			</div>
		</div>
	</div>
</body>
