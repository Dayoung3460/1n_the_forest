/**
 * modify.js
 */
let body = document.querySelector('body');
let div = document.createElement('div');
let modal = document.querySelector('#exampleModal');

function modalShow(arg){
	modalArg = arg; // 여러 함수에서 사용할 용도 
	
	//모달창 뜰 때 변경사항 추가 및 삭제 
	body.className = "modal-open";
	body.style.overflow = 'hidden';
	body.style.paddingRight = '16px';
	
	div.className = 'modal-backdrop';
	div.className= 'fade'; 
	div.className= 'show';
	
	body.appendChild(div);
	
}

function modalClose(){
	body.classList.remove('modal-open');
	body.removeAttribute('overflow', 'hidden');
	body.removeAttribute('padding-right','16px');
	
	//div부분  (class자체 삭제 )
	div.remove();
}
//탈퇴처리
function modalSave(){
	let memberId = document.querySelector('#memberId').value;
	
	fetch ('removejoin.do?memberId='+memberId)
		.then (resolve => resolve.json())
		//성공시 회원 quit 1 처리 
		.then(result =>{
			console.log(result.retVal);
			if (result.retCode == 'OK'){
				alert("성공적으로 탈퇴 되었습니다..")
				
				if(result.retVal == 'admin'){
					location.replace('memberList.do');
				}else if(result.retVal == 'user'){
					location.replace('logOut.do');
				}	
					
			} else if (result.retCode == 'FAIL'){
				alert("탈퇴 오류 발생")
			}
		})
		.catch(err => console.log(err));
}