<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<title>Insert title here</title>
<!-- <link rel="stylesheet" href="css/login.css"> -->

<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- 데이터 포맷에 사용 -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- c태그 -->

<div
	class="container min-vh-100 d-flex justify-content-center align-items-center">
	<div class="card" style="width: 50rem;">
		<div class="card-header">비밀번호 찾기 결과</div>
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
			<button type="button" class="btn btn-outline-success btn-lg" onclick="location.href='login.do'" >로그인</button>
			<button type="button" class="btn btn-outline-success btn-lg" onclick="location.href='findPw.do'">비밀번호찾기</button>
		</div>
	</div>
</div>

