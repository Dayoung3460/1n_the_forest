<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<title>Insert title here</title>
 

<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
</head>

<c:if test="${joinError != null }">
	<script>
	alert("회원가입에 실패하였습니다. 다시 시도해 주세요.")
	</script>
</c:if>
<body>
	<div class="container d-flex justify-content-center align-items-center mt-5" style="width:960px;">
		<div class="card border-success mb-3" style="width: 100%">
			<div class="card-header text-white text-center" style="background-color: #4c9176 !important;">회원가입</div>
			<div class="card-body">
				<form action="joinForm.do" method="POST">
					<input type="hidden" name="idChecked" id="idChecked" value="no">
					<div class="board-write">
						<div class="form-group row">
							<label>아이디<em>*</em></label>
							<div class="form-control-body form-inline">
								<input class="form-control  w-50" style="display:inline" type="text" id="memberId" name="memberId">
								<button type="button" id="checkIdBtn" class="btn btn-success" >중복 검사</button>
	        					<p style="font-size: 10px;">※한글,특수문자 사용 할 수 없습니다.</p>
							</div>
						</div>
						<div class="form-group row">
							<label>비밀번호<em>*</em></label>
							<div class="form-control-body">
								<input class="form-control  w-50" type="password" id="password"
									name="password">
								<p style="font-size: 10px;">※해당 특수 문자는 사용할 수 없습니다. !@#$%^*+=
									만 사용가능</p>
							</div>
						</div>
						<div class="form-group row">
							<label>비밀번호 확인</label>
							<div class="form-control-body">
								<input class="form-control  w-50" type="password" id="ckPasswd"
									name="ckPasswd">
							</div>
						</div>
						<div class="form-group row">
							<label class="form-control-label">성명<em>*</em></label>
							<div class="form-control-body form-inline">
								<input class="form-control w-50" type="text" id="memberName"
									name="memberName">
							</div>
						</div>
						<div class="form-group row">
							<label class="form-control-label">휴대폰번호<em>*</em></label>
							<div class="form-control-body">
								<input class="form-control w-50" type="text" name="tel" id="tel"
									oninput="autoHyphen(this)">
							</div>
						</div>
						<div class="form-group row">
							<label class="form-control-label">이메일<em>*</em></label>
							<div class="form-control-body form-inline">
								<input class="form-control w-50" type="text" name="email"
									id="email">
							</div>
						</div>
						<pre></pre>
						<div class="form-group row">
							<label class="form-control-label">주소</label>
							<div class="form-control-body">
								<div class="col-xs-2">
									<input type="text" id="postcodeDisplay" class="form-control w-25" style="display:inline" placeholder="우편번호" maxlength="6" readonly>
									<input type="hidden" name="postcode" id="postcode">
									<button type="button" class="btn btn-success"
										onclick="sample6_execDaumPostcode()">검색</button>
								</div>
								<pre></pre>
								<input class="form-control" type="text" id="address1"
									name="address1">
								<pre></pre>
								<input class="form-control" type="text" id="address2"
									name="address2" placeholder="상세주소">
							</div>
						</div>
					</div>
					<pre></pre>
					<div class="text-center" style="margin-bottom: 20px;">
						<!-- Submit 로그인버튼-->
						<button type="reset" class="btn btn-outline-success btn-lg" id="resetBtn">취소</button>
						<button type="submit" class="btn btn-outline-success btn-lg" id="joinBtn">저장</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>

<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> 
<script src="js/member/join.js"></script>
<script>
const autoHyphen = (target) => {
    target.value = target.value
       .replace(/[^0-9]/g, '')
       .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/g, "$1-$2-$3")
       .replace(/(\-{1,2})$/g, "");
 }
</script>

