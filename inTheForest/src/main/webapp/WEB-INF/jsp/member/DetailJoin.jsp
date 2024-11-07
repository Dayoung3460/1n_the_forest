<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<title>Insert title here</title>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
</head>

<c:if test="${modifysuccess != null }">
	<script>
	alert("회원정보가 수정 되었습니다.")
	</script>
</c:if>


<body>
	<div
		class="container  d-flex justify-content-center align-items-center mt-5" style="width:960px">
		<div class="card border-success mb-3" style="width: 100%">
			<div class="card-header text-white text-center" style="background-color: #4c9176 !important;">회원정보</div>
			<div class="card-body">
				<form action="modifyJoin.do" method="GET">
					<div class="board-write">
						<div class="mb-3">
						  <label for="exampleFormControlInput1" class="form-label" style="display:block" >아이디</label>
						  <input class="form-control  w-50" type="text" id="memberId"
									name="memberId" value="${MemberVO.memberId}" readonly disabled>
						</div>
						
						<div class="mb-3">
						  <label for="exampleFormControlInput1" class="form-label" style="display:block" >비밀번호</label>
						  <input class="form-control  w-50" type="text" id="password"
									name="password" value="${MemberVO.password}" readonly disabled>
						</div>
						
						<div class="mb-3">
						  <label for="exampleFormControlInput1" class="form-label" style="display:block" >성명</label>
						  <input class="form-control w-50" type="text" id="memberName"
									name="memberName" value="${MemberVO.memberName}" readonly disabled>
						</div>
						
						<div class="mb-3">
						  <label for="exampleFormControlInput1" class="form-label" style="display:block" >휴대폰번호</label>
						  <input class="form-control w-50" type="text" name="tel" id="tel"
									value="${MemberVO.tel}" readonly disabled>
						</div>
						
						<div class="mb-3">
						  <label for="exampleFormControlInput1" class="form-label" style="display:block" >이메일</label>
						  <input class="form-control w-50" type="text" name="email"
									id="email" value="${MemberVO.email}" readonly disabled>
						</div>
						
						<div class="mb-3">
						  <label for="exampleFormControlInput1" class="form-label" style="display:block" >주소</label>
						  <input type="text" id="postcodeDisplay" class="form-control w-25" style="display:inline" value="${postcode}" maxlength="6" readonly disabled>
						  <input type="hidden" name="postcode" id="postcode">
						  
						  <input class="form-control" type="text" id="address1"
									name="address1" value="${address1}" readonly style="margin-top: 5px;" disabled>
						  <input class="form-control" type="text" id="address2"
									name="address2" value="${address2}" readonly style="margin-top: 5px;" disabled>
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
</body>

<script>
document.querySelector('input[value="수정"]').addEventListener('click', function(e) {
	location.href = 'modifyJoin.do?memberId=${MemberVO.memberId}';
	/* (3) 수정버튼이 작동 시 페이지 번호와 게시판 번호를 modifyBoard.do 로 넘겨 줍니다. */
});

//돌아가기 버튼 클릭 시 
document.getElementById('returnButton').addEventListener('click', function(e) {
	//location.href = 'myPageBookList.do?memberId=${memberVO.memberId}';
	history.back();
});
</script>

