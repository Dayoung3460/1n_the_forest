/**
 * join.js
 */
//주소 api 
function sample6_execDaumPostcode() {
	console.log("Daum Postcode API 호출됨"); // 함수 호출 여부 확인
	new daum.Postcode({
		oncomplete: function(data) {
			//팝업에서 검색 결과 항목을 클릭 했을때 실행 할 코드 부분

			//각 주소의 노출 규칙에 따라 주소 조합
			var addr = ''; // 주소 변수 

			//사용자가 선택한 주소 타입에 따라 해당 주소의 값을 가져온다.
			if (data.userSelectedType === 'R') {
				//도로명 주소 경우
				addr = data.roadAddress;
			} else { // 사용자가 지번 주소 선택(J)
				addr = data.jibunAddress;

			}

			// 우편번호와 주소 정보를 해당 필드에 넣기 
			document.getElementById('postcode').value = data.zonecode;
            document.getElementById('postcodeDisplay').value = data.zonecode; // 확인용으로 화면에도 표시
			document.getElementById('address1').value = addr;

			//커서를 상세 주소 필드로 이동 
			document.getElementById('address2').focus();

		}
	}).open()
}


document.addEventListener("DOMContentLoaded", function() {
	var password = document.getElementById("password");
	var ckPasswd = document.getElementById("ckPasswd");
	var form = document.querySelector("form");

	//비밀번호 일치 확인 
	function checkPwMatch() {
		if (password.value !== ckPasswd.value) {
			ckPasswd.setCustomValidity("비밀번호가 일치하지 않습니다");
			ckPasswd.reportValidity();
		} else {
			ckPasswd.setCustomValidity("");
		}
	}

	//비밀번호 확인 필드 값 변경 마다 수행 
	ckPasswd.addEventListener("input", checkPwMatch);
	
	

	//아이디 중복 검사 후 + 비밀번호 불일치 체크 후 + 주소 적은지 확인 후 에 회원가입 완료 하게 해주기
	form.addEventListener("submit", function(event) {
		var idChecked = document.getElementById("idChecked").value;
		var email = document.getElementById("email").value;
		var memberName = document.getElementById("memberName").value;
		var tel = document.getElementById("tel").value;
		var passwordPattern = /^[a-zA-Z0-9!@#$%^*+=]+$/;
		
		//비밀번호 유효성 검사
		 if (!passwordPattern.test(password.value)) {
        event.preventDefault();
        alert("비밀번호는 영문, 숫자, 그리고 !@#$%^*+= 특수문자만 사용할 수 있습니다.");
        return;
    	}
		
		if(!memberName){
			event.preventDefault();
			alert("이름을 입력하세요.")
			return;
		}
		if(!tel){
			event.preventDefault();
			alert("휴대폰 번호를 입력하세요.")
			return;
		}

		if (!email) {
			event.preventDefault();
			alert("이메일을 입력 해 주세요.")
			return;
		}
		
		if (idChecked !== "yes") {
			event.preventDefault();
			alert("아이디 중복 검사를 완료 해 주세요.")
			return;
		}

		//비밀번호 불일치 체크 
		checkPwMatch();
		if (password.value !== checkPw.value) {
			event.preventDefault();
			alert("비밀번호가 일치 하지 않습니다. 확인 해 주세요.");
		}
	});

});


//아이디 유효성 검사 
document.getElementById("checkIdBtn").addEventListener("click", function() {
	var memberId = document.getElementById("memberId").value;
	
	// 아이디 유효성 검사: 영문과 숫자만 허용
    if (!/^[a-zA-Z0-9]+$/.test(memberId)) {
        alert("아이디는 영문과 숫자만 사용 가능합니다.");
        return;
    }

	//아이디 없는 경우 
	if (!memberId) {
		alert("아이디 입력 해주세요");
		return;
	}
	
	//아이디 중복 체크 
	$.ajax({
		url: 'checkId.do',
		data: { memberId: memberId },
		method: 'POST',
		dataType: 'json'
	})
		.done(function(result) {
			if (result.exists) {
				alert("이미 사용 중인 아이디입니다.");
				document.getElementById("idChecked").value = "no";
				
			} else {
				alert("사용 가능한 아이디입니다.");
				document.getElementById("idChecked").value = "yes";
			}
		}).fail(function(err) {
			alert("아이디 중복 체크 중 오류가 발생 했습니다.");
		})

});

//저장 버튼 클릭 시 아이디 중복 검사 했는지 체크
document.getElementById("joinBtn").addEventListener("click",function(event){
	var idChecked = document.getElementById("idChecked").value;
	if(idChecked !== "yes"){
		event.preventDefault();
		alert("아이디 중복 검사를 완료 해 주세요.");
	}
})

