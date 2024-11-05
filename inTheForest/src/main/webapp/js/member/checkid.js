/**
 * checkid.js
 */

function checkId(id){
	console.log(id);
	if (id != 'null') {
		location.replace('myPageBookList.do');
		
	} else {
		alert("로그인이 필요한 항목입니다. 회원 가입 또는 로그인을 해주세요");
		location.replace('login.do');
	}
}

