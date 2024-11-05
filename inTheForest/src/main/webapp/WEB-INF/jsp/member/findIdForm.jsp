<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<title>Insert title here</title>
<!-- <link rel="stylesheet" href="css/login.css"> -->

<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- 데이터 포맷에 사용 -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- c태그 -->
<c:if test="${msg != null }">
	<script>
	alert("이름과 이메일를 입력하세요.")
	</script>
</c:if>


<c:if test="${quitmsg != null }">
<script>
	alert("탈퇴한 회원입니다.")
</script>
</c:if>

<div class="container min-vh-100 d-flex justify-content-center align-items-center">
	<div class="card"  style="width: 70rem">
		<div class="card-header">아이디찾기</div>
		<div class="card-body">
			<form action="findId.do" method="POST">
				<!--<input type="hidden" name="id_go_flag" id="id_go_flag" value="no">-->
				<div class="board-write">
					<div class="form-group row">
						<label class="form-control-label">성명</label>
						<div class="form-control-body form-inline">
							<input class="form-control w-50" type="text" id="memberName"
								name="memberName">
						</div>
					</div>
					<div class="form-group row">
						<label class="form-control-label">이메일</label>
						<div class="form-control-body form-inline">
							<input class="form-control" type="text" name="email" id="email">
						</div>
					</div>
				</div>
				<pre></pre>
				<div class="text-center" style="margin-bottom: 20px;">
					<button type="submit" class="btn btn-outline-success btn-lg">아이디찾기</button>
				</div>
				<div class="text-center">
					<!-- Register 회원가입 링크 -->
					<a href="joinForm.do">| 회원가입</a> <a href="login.do">| 로그인</a>
				</div>
			</form>
		</div>
	</div>
</div>

