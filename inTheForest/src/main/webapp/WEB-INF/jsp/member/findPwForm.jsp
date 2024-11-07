<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<title>Insert title here</title>


<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

</head>
<c:if test="${msg != null }">
	<script>
	alert("아이디,이름,이메일을 입력하세요.")
	</script>
</c:if>


<c:if test="${quitmsg != null }">
<script>
	alert("탈퇴한 회원입니다.")
</script>
</c:if>
<body>
	<div
		class="container min-vh-100 d-flex justify-content-center align-items-center"  style="width:450px">
		<div class="card border-success mb-3" style="width: 100%">
			<div class="card-header text-white text-center" style="background-color: #4c9176 !important;">비밀번호 찾기</div>
			<div class="card-body">
				<form action="findPw.do" method="POST">
					<!--<input type="hidden" name="id_go_flag" id="id_go_flag" value="no">-->
					<div class="board-write">
						<div class="mb-3">
						  <label for="exampleFormControlInput1" class="form-label" style="display:block" >아이디</label>
						  <input class="form-control w-50" type="text" id="memberId"
									name="memberId">
						</div>
						<div class="mb-3">
						  <label for="exampleFormControlInput1" class="form-label" style="display:block" >성명</label>
						  <input class="form-control w-50" type="text" id="memberName"
									name="memberName">
						</div>
						<div class="mb-3">
						  <label for="exampleFormControlInput1" class="form-label" style="display:block" >이메일</label>
						  <input class="form-control" type="text" name="email" id="email">
						</div>
					</div>
					<pre></pre>
					<div class="text-center" style="margin-bottom: 20px;">
						<button type="submit" class="btn btn-success">비밀번호찾기</button>
					</div>
					<div class="text-center">
						<!-- Register 회원가입 링크 -->
						<a href="joinForm.do">회원가입</a> <a href="login.do">| 로그인</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>