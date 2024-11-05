<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<title>Insert title here</title>
<!-- <link rel="stylesheet" href="css/login.css"> -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>



<div
	class="container min-vh-100 d-flex justify-content-center align-items-center">
	<div class="card">
		<div class="card-header" style="width: 70rem">회원정보</div>
		<div class="card-body">
			<form action="modifyJoin.do" method="GET">
				<div class="board-write">
					<div class="form-group row">
						<label>아이디</label>
						<div class="form-control-body form-inline">
							<input class="form-control  w-50" type="text" id="memberId"
								name="memberId" value="${MemberVO.memberId}" readonly>
						</div>
					</div>
					<div class="form-group row">
						<label>비밀번호</label>
						<div class="form-control-body">
							<input class="form-control  w-50" type="text" id="password"
								name="password" value="${MemberVO.password}" readonly>
						</div>
					</div>
					<div class="form-group row">
						<label class="form-control-label">성명</label>
						<div class="form-control-body form-inline">
							<input class="form-control w-50" type="text" id="memberName"
								name="memberName" value="${MemberVO.memberName}" readonly>
						</div>
					</div>
					<div class="form-group row">
						<label class="form-control-label">휴대폰번호</label>
						<div class="form-control-body">
							<input class="form-control w-50" type="text" name="tel" id="tel"
								value="${MemberVO.tel}" readonly>
						</div>
					</div>
					<div class="form-group row">
						<label class="form-control-label">이메일</label>
						<div class="form-control-body form-inline">
							<input class="form-control w-50" type="text" name="email"
								id="email" value="${MemberVO.email}" readonly>
						</div>
					</div>
					<div class="form-group row">
						<label class="form-control-label">주소</label>
						<div class="form-control-body">
							<div class="col-xs-2">
								<input type="text" id="postcodeDisplay" value="${postcode}" maxlength="6" readonly>
								<input type="hidden" name="postcode" id="postcode">
								<button type="button" class="btn btn-outline-success"
									onclick="sample6_execDaumPostcode()">검색</button>
							</div>
							<pre></pre>
							<input class="form-control" type="text" id="address1"
								name="address1" value="${address1}" readonly>
							<pre></pre>
							<input class="form-control" type="text" id="address2"
								name="address2" value="${address2}" readonly>
						</div>
					</div>
				</div>
				<pre></pre>
				<div class="text-center" style="margin-bottom: 20px;">
					<!-- 수정 삭제 -->
					<input type="button" value = "수정" class="btn btn-outline-success btn-lg">
					<input type="button" value ="돌아가기" class="btn btn-outline-success btn-lg" id="returnButton">
				</div>
			</form>
		</div>
	</div>
</div>


<script>
document.querySelector('input[value="수정"]').addEventListener('click', function(e) {
	location.href = 'modifyJoin.do?memberId=${MemberVO.memberId}&postcode=${postcode}&address1=${address1}&address2=${address2}';
	/* (3) 수정버튼이 작동 시 페이지 번호와 게시판 번호를 modifyBoard.do 로 넘겨 줍니다. */
});

//돌아가기 버튼 클릭 시 
document.getElementById('returnButton').addEventListener('click', function(e) {
	//location.href = 'myPageBookList.do?memberId=${memberVO.memberId}';
	history.back();
});
</script>

