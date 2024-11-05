<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<title>Insert title here</title>
<!-- <link rel="stylesheet" href="css/login.css"> -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:if test="${msg != null }">
	<script>
	alert("수정할 회원정보가 없습니다.")
	</script>
</c:if>

<c:if test="${errmsg != null }">
	<script>
	alert("회원 정보 수정 중 오류가 발생했습니다.")
	</script>
</c:if>

<div
	class="container min-vh-100 d-flex justify-content-center align-items-center">
	<div class="card">
		<div class="card-header" style="width: 70rem">회원정보수정</div>
		<div class="card-body">
			<form action="modifyJoin.do" method="POST">
				<!--<input type="hidden" name="id_go_flag" id="id_go_flag" value="no">-->
				<div class="board-write">
					<div class="form-group row">
						<label>아이디</label>
						<div class="form-control-body form-inline">
							<input class="form-control  w-50" type="text" id="memberId"
								name="memberId" value="${MemberVO.memberId}" readonly>
							<input type="hidden" name="memberId" value="${MemberVO.memberId}">
						</div>
					</div>
					<div class="form-group row">
						<label>비밀번호</label>
						<div class="form-control-body">
							<input class="form-control  w-50" type="text" id="password"
								name="password" value="${MemberVO.password}">
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
								value="${MemberVO.tel}">
						</div>
					</div>
					<div class="form-group row">
						<label class="form-control-label">이메일</label>
						<div class="form-control-body form-inline">
							<input class="form-control w-50" type="text" name="email"
								id="email" value="${MemberVO.email}">
						</div>
					</div>
					<div class="form-group row">
						<label class="form-control-label">주소</label>
						<div class="form-control-body">
							<div class="col-xs-2">
								<input type="text" id="postcodeDisplay" value="${postcode}" maxlength="6" readonly>
								<input type="hidden" name="postcode" id="postcode" value="${postcode}">
								<button type="button" class="btn btn-outline-success"
									onclick="sample6_execDaumPostcode()">검색</button>
							</div>
							<pre></pre>
							<input class="form-control" type="text" id="address1"
								name="address1" value="${address1}">
							<pre></pre>
							<input class="form-control" type="text" id="address2"
								name="address2" value="${address2}">
						</div>
					</div>
				</div>
				<pre></pre>
				<div class="text-center" style="margin-bottom: 20px;">
					<!-- 수정 삭제 -->
					<button type="submit" class="btn btn-outline-success btn-lg">저장</button>
					<input type="button" value ="회원탈퇴" class="btn btn-outline-success btn-lg" data-bs-toggle="modal" data-bs-target="#exampleModal">
				</div>
			</form>
				
			<!-- Modal -->
			<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			    
			      <div class="modal-header">
			        <h1 class="modal-title fs-5" id="exampleModalLabel">회원 탈퇴</h1> <!-- 모달창 타이틀 -->
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      
			      <div class="modal-body">
			        <!-- 모달창 내용  (사용자 입력 타이틀, startStr , endStr )-->
			       	<p>정말로 회원 탈퇴를 진행 하시겠습니까?</p>
			      </div>
			      
			      <div class="modal-footer">
			        <button type="button" class="btn btn-outline-dark" data-bs-dismiss="modal" onclick="modalClose()">닫기</button> <!-- 닫는 버튼 -->
			        <button type="button" class="btn btn-outline-success" onclick="modalSave()">회원 탈퇴</button> <!-- 저장버튼 -->
			      </div>
			    </div>
			  </div>
			</div>
		</div>
	</div>
</div>


<script>
//회원탈퇴 버튼 클릭 시
//document.getElementById('removeButton').addEventListener('click', function(e) {
//	if (confirm("정말로 회원 탈퇴를 하시겠습니까?")) {
//		location.href = 'removeJoin.do?memberId=${memberVO.memberId}';
//	}
//});
</script>

<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> 
<script src="js/member/join.js"></script>
<script src="js/member/modify.js"></script>

