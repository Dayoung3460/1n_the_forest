<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- c태그 -->
<title>inTheForestLogin</title>
<!-- <link rel="stylesheet" href="css/site/template.css"> -->
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- 데이터 포맷에 사용 -->


<c:if test="${msg != null }">
	<script>
	alert("아이디와 비밀번호를 입력하세요.")
	</script>
</c:if>

<c:if test="${quitmsg != null }">
	<script>
	alert("탈퇴한 회원입니다.")
	</script>
</c:if>


<div
	class="container min-vh-100 d-flex justify-content-center align-items-center">
	<form action="login.do" method="POST" class="text-center" id="loginForm" onsubmit="return frm_check();">
	
		<!-- ID  -->
		<div data-mdb-input-init class="form-outline mb-4">
			<input type="text" name="memberId" id="memberId" class="form-control"
				placeholder="ID" />
		</div>

		<!-- Password -->
		<div data-mdb-input-init class="form-outline mb-4">
			<input type="password" name="password" class="form-control"
				placeholder="password" />
		</div>

		<!-- 아이디기억하기 -->
		<div class="row mb-4">
			<div class="col d-flex justify-content-center">
				<!-- Checkbox -->
				<div class="form-check">
					<input class="save_id" type="checkbox" value="" id="saveId" name="saveId"> 
						<label for="saveId">아이디기억하기</label>
				</div>
			</div>
		</div>


		<!-- Submit 로그인버튼-->
		<button type="submit" class="btn btn-outline-success btn-lg">Sign
			in</button>
		<pre></pre>


		<div class="text-center">
			<!-- Register 회원가입 링크 -->
			<a href="joinForm.do">| 회원가입</a>
			<!-- id.password찾기 링크-->
			<a href="findId.do">| 아이디 찾기</a> 
			<a href="findPw.do">| 비밀번호 찾기</a>
		</div>

	</form>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="js/member/login.js"></script>