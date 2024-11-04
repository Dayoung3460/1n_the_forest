/**
 * modify.js
 */
function sample6_execDaumPostcode() {
	new daum.Postcode({
		oncomplete:function(data){
			 document.getElementById('address').value = data.roadAddress; // 도로명 주소를 입력 필드에 설정
            document.getElementById('address').disabled = false; // 주소 입력 필드 활성화
		}
	}).open();
}

function ModifyAddress(){
	document.getElementById('address').disabled = false;
}