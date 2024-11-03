/**
 * login.js
 */
$(document).ready(function(){
    // 쿠키에 저장된 memberId 값을 가져와 ID 칸에 넣기 
    var memberId = getCookie("memberId");
    $("#memberId").val(memberId);
    
    
    // memberId가 쿠키에 있으면 체크박스 체크 상태로 설정
    if ($("#memberId").val() !== "") {
        $("#checkId").prop("checked", true);
    }
    
    // 체크박스 상태 변경 시 쿠키 설정 또는 삭제
    $("#checkId").change(function(){
		console.log("Checkbox changed. Checked:", $("#checkId").is(":checked"));
        if($("#checkId").is(":checked")) {
            setCookie("memberId", $("#memberId").val(), 7); // 7일 동안 쿠키 저장
        } else {
            deleteCookie("memberId"); // 체크 해제 시 쿠키 삭제
        }
    });
    
    // ID 저장하기를 체크한 상태에서 ID 입력 시 ID 쿠키에 저장
    $("#memberId").keyup(function(){
        if($("#checkId").is(":checked")) { // ID 저장 체크박스에 체크되어 있으면
            setCookie("memberId", $("#memberId").val(), 7); // 7일 동안 쿠키 저장
        }
    });
    
    // 쿠키 저장하기
    function setCookie(cookieName, value, exdays) {
		 console.log("Setting cookie:", cookieName, value);
        var exdate = new Date();
        exdate.setDate(exdate.getDate() + exdays);
        var cookieValue = escape(value)
                          + "; expires=" + exdate.toGMTString()
                          + "; path=/; SameSite=Lax";
        document.cookie = cookieName + "=" + cookieValue;
        console.log("current cookies:", document.cookie);
        
       
    }
    
    // 쿠키 삭제
    function deleteCookie(cookieName) {
		console.log("deleting cookies:",cookieName);
        var expireDate = new Date();
        expireDate.setDate(expireDate.getDate() - 1);
        document.cookie = cookieName + "=; expires=" + expireDate.toGMTString();
        console.log("Current cookies after delete:", document.cookie); // 쿠키 삭제 후 확인
    }
    
    // 쿠키 가져오기
    function getCookie(cookieName) {
		
        cookieName = cookieName + '=';
        var cookieData = document.cookie;
        var start = cookieData.indexOf(cookieName);
        var cookieValue = '';
        
        if (start != -1) {
            start += cookieName.length;
            var end = cookieData.indexOf(';', start);
            if (end == -1) {
                end = cookieData.length;
            }
            cookieValue = cookieData.substring(start, end);
            
            console.log("Getting cookie:", cookieName, "Value:", cookieValue);
        }
        return unescape(cookieValue);
    }
});


