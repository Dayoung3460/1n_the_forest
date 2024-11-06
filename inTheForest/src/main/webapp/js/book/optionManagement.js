let inputs = document.querySelectorAll('td input');

document.addEventListener('DOMContentLoaded', (e) => {
	for(let i = 0 ; i < inputs.length; i++){
    //보여줄 때 천단위 입력값 , 표시
    inputs[i].value = `${numberFormating(inputs[i].value)}`;
    
    //입력할 때는 숫자로 변환
    inputs[i].addEventListener('keydown', (e) => {
        e.target.value = removeComma(e.target.value);

        if(e.key == 'Enter') { //엔터 눌렀을 시, 자동 제출 방지하며 다음 칸으로 이동
            e.preventDefault();
            console.log(e.target.parentElement.parentElement.nextSibling.nextSibling.querySelector('input[type="text"]'));
            if(i != inputs.length - 1){
                e.target.parentElement.parentElement.nextSibling.nextSibling.querySelector('input[type="text"]').focus();
            }
        }
    });
    
    //입력 완료하면 , 표시
    inputs[i].addEventListener('change', (e) => {
        e.target.value = numberFormating(e.target.value);
    });
    //입력하지 않고 focus out 시 , 표시
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

//적용 버튼 클릭 시, 천단위 , 제거하여 전송
let smBtn = document.querySelector('#submitBtn');
smBtn.onclick = function() {
	for(let i = 0 ; i < inputs.length; i++){
    inputs[i].value = `${removeComma(inputs[i].value)}`;
	}
}