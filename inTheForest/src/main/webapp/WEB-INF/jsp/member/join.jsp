<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/member/join.css">
<link rel="stylesheet" href="css/site/template.css">
</head>
<body>
<div class="card">
    <div class="card-header">회원가입</div>
        <div class="card-body">
            <form method="post" action="#" >
                <input type="hidden" name="id_go_flag" id="id_go_flag" value="no">
                <input type="hidden" name="pw_go_flag" id="pw_go_flag" value="no">
                <input type="hidden" name="level" id="level" value="a1">
                <input type="hidden" name="mem_level" id="mem_level" value="">
                <input type="hidden" name="dupinfo" id="dupinfo" value="MC0GCCqGSIb3DQIJAyEAJn+LuDDrF7WRGyMI4oiloU0ZL4FjEgh8C77UNRZ70Tg=">
                <div class="board-write">
                    <div class="form-group row">
                        <label class="form-control-label">아이디</label>
                        <div class="form-control-body form-inline">
                            <input class="form-control Script_id_overlap_chk __ck" type="text" id="userid" name="userid" title="아이디를 입력하세요.">
                            <span id="check_id_val" class="input-note text-xs" style="display:none;"></span>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="form-control-label">비밀번호</label>
                        <div class="form-control-body form-inline">
                            <input class="form-control w200 __ck" type="password" id="passwd" name="passwd" value="" title="비밀번호를 입력해 주세요." onkeyup="pwd_check1(this.value)">
                            <span id="passwd_info_text" class="input-note text-xs" style="display:none;"></span>
                            <p style="font-size: 10px;">※해당 특수 문자는 사용할 수 없습니다. !@#$%^*+= 만 사용가능</p>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="form-control-label">비밀번호 확인</label>
                        <div class="form-control-body">
                            <input class="form-control w200 __ck" type="password" id="passwdck" name="passwdck" title="비밀번호를 입력해 주세요.">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="form-control-label">성명<em>*</em></label>
                        <div class="form-control-body form-inline">
                            <input class="form-control Script_id_overlap_chk __ck" type="text" id="name" name="name" title="성명를 입력하세요.">
                            <span id="name" class="input-note text-xs" style="display:none;"></span>
                        </div>
                    <div class="form-group row">
                        <label class="form-control-label">휴대폰번호</label>
                        <div class="form-control-body form-inline">
                            <input class="form-control __ck w60" type="text" name="phone1" id="phone1" title="휴대폰번호를 입력하세요." placeholder=" 010 - 1234 - 5678" >
                        </div>
                    </div>			
                    <div class="form-group row">
                        <label class="form-control-label">이메일</label>
                        <div class="form-control-body form-inline">
                            <input class="form-control w250 __ck" type="text" name="email" id="email" title="이메일을 입력하세요.">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="form-control-label">주소</label>
                        <div class="form-control-body">
                            <div class="col-xs-2">
                                <input class="form-control w-2" type="text" id="zip" name="zip">
                                <a href="javascript:void(0);" onclick="sample3_execDaumPostcode('zip','add1');" class="btn-d">우편번호 찾기</a>
                            </div>
                            <input class="form-control __ck" type="text" id="add1" name="add1" title="주소를 입력하세요.">
                            <pre></pre>
                            <input class="form-control mtp5" type="text" id="add2" name="add2" title="주소를 입력하세요." placeholder="상세주소">
                        </div>
                    </div>
                </div>
            </form>
        </div>
</div>

    <div class="text-center" style="margin-bottom: 20px;">
        <!-- Submit 로그인버튼-->
			<button  type="button" data-mdb-button-init data-mdb-ripple-init class="btn btn-outline-success btn-lg" >취소</button>
			<button  type="button" data-mdb-button-init data-mdb-ripple-init class="btn btn-outline-success btn-lg" >저장</button>
	</div>
</body>
</html>