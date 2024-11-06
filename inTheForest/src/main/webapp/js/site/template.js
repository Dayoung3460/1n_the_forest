document.addEventListener('DOMContentLoaded', (e) => {
	
  let currentLocation = window.location.pathname; //현재 페이지의 경로 /inTheForest/main.do 식으로 받아옴.
	currentLocation = currentLocation.replace('/inTheForest/', ''); //main.do만 남김
	
	//모든 a링크와 비교
	let alinks = document.querySelectorAll('header a');
	for(let i = 0; i < alinks.length; i++){
		let alink = alinks[i].getAttribute('href');
		
		let param = window.location.search;
		
		//메뉴에서 하위 페이지 이동 시, 상위 메뉴로 적용
		if(currentLocation == 'boardList.do'){ 
			currentLocation += '?' + param.substr(param.indexOf('category')); //bookList.do는 파라미터가 링크에 포함되므로, 파라미터 추가
		} else if(currentLocation == 'board.do'){
			currentLocation = 'boardList.do' + '?' + param.substr(param.indexOf('category')); 
		} else if(currentLocation == 'DetailJoin.do' || currentLocation == 'modifyJoin.do'){
			currentLocation = 'memberList.do';
		} else if(currentLocation == 'detailBook.do'){
			currentLocation = 'myPageBookList.do';
		}
		
		//최종값으로 active 적용		
		if(alink == currentLocation){
			alinks[i].classList.add('active');
		}
	}
	
	
	//직전에 눌렀던 a링크값을 가져오고, null이 아닐 시 페이지 로드할 때 찾아서 active 해줌.
	/*
	let activeHref = localStorage.getItem('activeHref');
	let activeItem = document.querySelector(`.nav-item a[href="${activeHref}"]`);
	if(activeHref && activeItem){
		document.querySelector(`.nav-item a[href="${activeHref}"]`).classList.add('active');
	} else {
		document.querySelector(`.nav-item a[href="${main.do}"]`).classList.add('active');
	}
	
	//이후에 다른 a링크 클릭하면 새로운 a링크값을 localStorage에 저장하여 내보냄.
	let alinks = document.querySelectorAll('header a');
	for(let i = 0; i < alinks.length; i++){
		alinks[i].addEventListener('click', (a) => {
			localStorage.setItem('activeHref', a.target.getAttribute('href'));
		});
	}
	*/
	
});