<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<title>Insert title here</title>
<!-- <link rel="stylesheet" href="css/login.css"> -->

<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- 데이터 포맷에 사용 -->

<div class="container min-vh-100 d-flex justify-content-center align-items-center">
	<div class="card">
		<div class="card-header">회원가입</div>
		<div class="card-body">
			<form  action="joinForm.do" method="POST">
				<!--<input type="hidden" name="id_go_flag" id="id_go_flag" value="no">-->
				<div class="board-write">
					<div class="form-group row">
						<label>아이디<em>*</em></label>
						<div class="form-control-body form-inline">
							<input class="form-control  w-50" type="text" id="memberId" name="memberId">
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
							<input class="form-control w-50" type="text" id="memberName" name="memberName">
						</div>
						<div class="form-group row">
							<label class="form-control-label">휴대폰번호<em>*</em></label>
							<div class="form-control-body form-inline">
								<input class="form-control w-50" type="text" name="tel" id="tel" placeholder=" 010 - 1234 - 5678">
							</div>
						</div>
						<div class="form-group row">
							<label class="form-control-label">이메일</label>
							<div class="form-control-body form-inline">
								<input class="form-control w-50" type="text" name="email" id="email">
							</div>
						</div>
						<div class="form-group row">
							<label class="form-control-label">주소</label>
							<div class="form-control-body">
								<div class="col-xs-2">
									<input type="text" name="address" placeholder="우편번호" maxlength="6" id="postcode" disabled>
										 <button type="button" class="btn btn-outline-success" onclick="sample6_execDaumPostcode()">검색</button>
								</div>
								<pre></pre>
								<input class="form-control" type="text"  id="address1" name="address">
								<pre></pre>
								<input class="form-control" type="text" id="address2" name="address" placeholder="상세주소">
							</div>
						</div>
					</div>
				</div>
				<pre></pre>
				<div class="text-center" style="margin-bottom: 20px;">
					<!-- Submit 로그인버튼-->
					<button type="reset" class="btn btn-outline-success btn-lg">취소</button>
					<button type="submit" class="btn btn-outline-success btn-lg">저장</button>
				</div>
			</form>
		</div>
	</div>
</div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src ="js/member/join.js"></script>

