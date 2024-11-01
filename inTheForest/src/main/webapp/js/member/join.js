/**
 * join.js
 */
function sample6_execDaumPostcode(){
	new daum.Postcode({
		oncomplete: function(data){
			//팝업에서 검색 결과 항목을 클릭 했을때 실행 할 코드 부분
			
			//각 주소의 노출 규칙에 따라 주소 조합
			var addr = ''; // 주소 변수 
			
			//사용자가 선택한 주소 타입에 따라 해당 주소의 값을 가져온다.
			if(data.userSeleectedType === 'R'){
				//도로명 주소 경우
				addr = data.roadAddress;
			}else{ // 사용자가 지번 주소 선택 (J)
				addr = data.jibunAddress;
				
			}
			
			// 우편번호와 주소 정보를 해당 필드에 넣기 
			document.getElementById('postcode').value = data.zonecode;
			document.getElementById('address1').value = addr;
			
			//커서를 상세 주소 필드로 이동 
			document.getElementById('address2').focus();
			
		}
	}).open()
}