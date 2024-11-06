/**
 * login.js
 */
	$(function() {
		//페이지 시작할때 실행하도록 기본실행함수인 $(function(){} 에  fnInit(); 함수를 넣어 실행하도록 합니다.
	
		fnInit();
	
	});
	//로그인 submit시 실행 
	function frm_check(){
		saveid();
	}
	
	
	/**만약 만약에 getCookie(name) 함수에 'saveid' 를 넣어 
	getCookie(name) 값이 비어있지 않다면 
	아이디 값의 이름이 saveid 체크박스에 체크를하고, 
	logId의 아이디 값에 getCookie(name) 값을 넣어줍니다.**/
	
	function fnInit(){
		var cookieid = getCookie("saveid");
		//console.log("현재저장된 id=" + cookieid);
		if(cookieid != ""){
			$("input:checkbox[id='saveId']").prop("checked",true);
			$("#memberId").val(cookieid);
		}
	}
	
	function setCookie(name, value, expiredays){
		var todayDate= new Date(); // 오늘날짜 객체
		todayDate.setTime(todayDate.getTime() + 0);
		
		if(todayDate > expiredays){
			// saveid함수가 넘겨준 시간이 현재시간 보다 작으면 => 마이너스 값 넣어 쿠키 지우기
			document.cookie = name + "=" + decodeURIComponent(value) + "; path=/; expires=" + expiredays + ";";
		}else if (todayDate < expiredays){
			// saveid함수가 넘겨준 시간이 현재시간 보다 크다면 => 한달치 시간 넣어 쿠키 생성 
			todayDate.setDate(todayDate.getDate()+expiredays);// 30일 넣기 
			document.cookie = name + "=" + decodeURIComponent(value) + "; path=/; expires=" + todayDate.toGMTString() + ";";
		}
		
		//console.log(document.cookie);
	}
	
	function getCookie(Name){
		var search = Name + "=";
		//console.log("search:" + search);
		
		if(document.cookie.length > 0){ //쿠키 설정 이 되어 있다면 
			offset = document.cookie.indexOf(search);
			//console.log("offset : " + offset);
			
			if(offset != -1){ // 쿠키가 존재한다면
				offset += search.length;
				//set index of beginning of value
				end = document.cookie.indexOf(";",offset);
				//console.log("end : " + end);
				
				//쿠키 값의 마지막 위치 인덱스 번호 설정 
				if (end == -1) 
					end = document.cookie.length;
				//console.log("end위치 : "+ end);
				
				return encodeURIComponent(document.cookie.substring(offset,end));
				
			}
		} return "";
	}
	
	function saveid(){
		var expdate = new Date();
		if ($("#saveId").is(":checked")){
			//체크박스 체크 시 현재시간 + 한달 => setCookie함수에 넣기 
			expdate.setTime(expdate.getTime() + 1000 * 3600 * 24 * 30);
			setCookie("saveid", $("#memberId").val(), expdate);
		}else{
			//체크박스 해제 시 마이너스 값 => setCookie함수에 넣기
			expdate.setTime(expdate.getTime() - 1000 * 3600 * 24 * 30);
			setCookie("saveid", $("#memberId").val(), expdate);
		}
		
	}

