let inputs = document.querySelectorAll('td input');

//변동된 input 값을 모아놓을 배열
let values = [];

document.addEventListener('DOMContentLoaded', (e) => {
	for(let i = 0 ; i < inputs.length; i++){
    //보여줄 때 천단위 입력값 , 표시
    inputs[i].value = `${numberFormating(inputs[i].value)}`;
    
    //조작할 때는 숫자로 변환
    inputs[i].addEventListener('keydown', (e) => {
        e.target.value = removeComma(e.target.value);

        if(e.key == 'Enter') { //엔터 눌렀을 시 다음 칸으로 이동
            console.log(e.target.parentElement.parentElement.nextSibling.nextSibling.querySelector('input[type="text"]'));
            if(i != inputs.length - 1){
                e.target.parentElement.parentElement.nextSibling.nextSibling.querySelector('input[type="text"]').focus();
            }
        }
    });
    
    //값이 변동되고 나면 , 표시하며 배열에 모음
    inputs[i].addEventListener('change', (e) => {
				let optNo = inputs[i].parentElement.parentElement.firstElementChild.innerText;
				let price = e.target.value;
				
				//있는지 없는지 확인하여 배열에 추가 혹은 변경
				let idx = values.findIndex(obj => obj.optionNo == optNo);
				if(idx == -1){
					values.push({optionNo: optNo, price: price});					
				} else {
					values[idx].optionNo = optNo;
					values[idx].price = price;
				}
				
				//보여주는 값에 다시 , 표시
        e.target.value = numberFormating(price);
    });
    
    //변동되지 않고 focus out 시 , 표시
    inputs[i].addEventListener('focusout', (e) => {
        e.target.value = numberFormating(removeComma(e.target.value));
    });
  }
});

// , 제거 기능
function removeComma(str){
    str = str.replaceAll(',', '');
    return str;
}

// , 추가 기능
function numberFormating(str){
    str = Number(str);
    str = str.toLocaleString('ko-KR');
    return str;  
}

//적용 버튼 클릭 이벤트
let msgBox = document.querySelector('#msgBox');
document.querySelector('#submitBtn').onclick = function() {
		
		//변동된 값이 있을 때만 수정 실행
		if(inputs.length != 0){
				let str = '';
				for(let i = 0; i < values.length; i++){
					str += 'optionNo=' + values[i].optionNo + '&price=' + values[i].price;
					if(i != values.length - 1){
						str += '?';
					}
				}
			
				fetch('optionModify.do?' + str)
				.then((resolve) => resolve.json())
				.then((result) => {
					if(result.retCode != 'OK'){
						msgBox.style.color = 'red';
						msgBox.innerText = '오류가 발생했습니다.'
					} else {
						msgBox.style.color = 'green';
						msgBox.innerText = '수정에 성공했습니다.'
					}
				})
				.catch((err) => console.log(err));
		}
}