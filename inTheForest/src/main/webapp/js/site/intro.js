//출력할 내용을 객체로 저장
//(name:명칭, content:소개내용, state:보유현황)
let caravan = {
	name   : '카라반',
	content: [
				{title: "편안한 카라반", text: "카라반에서 아늑하게 캠핑을 즐겨보세요.", img: "caravan.jpg"},
				{title: "내부 전경", text: "화이트톤으로 깔끔하게 꾸며져 있습니다.", img: "room2.jpg"},
				{title: "주방용품 구비", text: "따로 준비하지 않아도, 식기와 조미료가 모두 구비되어 있습니다.", img: "kitchen.jpg"},
				{title: "호텔식 침구", text: "최상급 호텔식 침구가 진정한 휴식을 선사합니다.", img: "bed.jpg"},
				{title: "개인 욕실", text: "항상 청결하게 관리되고 있는 개인 욕실이 있습니다.", img: "bathroom2.jpg"},
			],
	state: [
				{category: "침구류", item: "싱글침대", cnt: 2, etc: "또는 더블침대 1 가능<br>※ 필요 시 여분의 침구류를 준비해드립니다."},
				{category: "세면도구", item: "수건", cnt: 4, etc: "필요 시 추가 가능"},
				{category: "세면도구", item: "칫솔/치약 세트", cnt: 2, etc: "예약 인원만큼"},
				{category: "세면도구", item: "샴푸 및 어메니티", cnt: 0, etc: "샴푸, 컨디셔너, 바디워시, 클렌징폼 등"},
				{category: "전기제품", item: "헤어드라이기", cnt: 1, etc: ""},
				{category: "전기제품", item: "전자레인지", cnt: 1, etc: ""},
				{category: "전기제품", item: "인덕션", cnt: 1, etc: ""},
				{category: "전기제품", item: "공기청정기", cnt: 1, etc: ""},
				{category: "전기제품", item: "에어컨", cnt: 1, etc: "냉·난방 리모콘 조절 가능"},
				{category: "기타", item: "식기류", cnt: 0, etc: "냄비, 수저, 접시, 머그컵 등"},
				{category: "기타", item: "*와인잔", cnt: 2, etc: "추가 필요 시 관리사무소 문의"}
			]
};

let autoCamp = {
	name   : '오토캠핑',
	content: [
				{title: "편리한 오토캠핑", text: "주차장이 인접하여, 차량을 가지고 오시면 편리하게 이용 가능합니다.", img: "camping1.jpg"},
				{title: "야외 바베큐장", text: "바베큐장에서 일행들과 즐거운 시간을 보내보세요.", img: "grill.jpg"},
				{title: "바베큐용품 구비", text: "따로 준비해오지 않아도, 바베큐 재료와 용품이 모두 있습니다.", img: "bbq1.jpg"},
				{title: "깨끗한 세면시설", text: "공동 세면실은 매일 청결하게 관리되고 있습니다.", img: "bathroom1.jpg"},
			],
	state: [
				{category: "침구류", item: "베게/이불", cnt: 2, etc: "필요 시 여분의 침구류를 준비해드립니다."},
				{category: "세면도구", item: "수건", cnt: 2, etc: "기본 제공 외 필요 시 추가 가능 (관리사무소 문의)"},
				{category: "세면도구", item: "샴푸", cnt: 0, etc: "샴푸, 바디워시 기본 구비"},
				{category: "전기제품", item: "헤어드라이기", cnt: 0, etc: "필요 시 관리사무소 문의"},
				{category: "기타", item: "식기류", cnt: 0, etc: "바베큐장에서 사용 후 반납"},
			]
};

let deckCamp = {
	name   : '데크캠핑',
	content: [
				{title: "넓은 공간", text: "캠핑용품을 가지고 계시다면, 넓고 한적한 데크에 설치 가능합니다.", img: "deck1.jpg"},
				{title: "한적한 공간", text: "조용한 숲속에서 데크캠핑을 즐겨보세요.", img: "forest.jpg"},
				{title: "바베큐용품 구비", text: "필요 시, 바베큐 재료와 용품을 제공해드립니다.", img: "bbq1.jpg"},
				{title: "캠프파이어", text: "저녁에 광장에서 열리는 캠프파이어에 참여해보세요.", img: "campfire.jpg"},
			],
	state: [
				{category: "침구류", item: "베게/이불", cnt: 0, etc: "필요 시 제공 (관리사무소 문의)"},
				{category: "세면도구", item: "수건", cnt: 0, etc: "필요 시 제공 (관리사무소 문의)"},
				{category: "세면도구", item: "샴푸", cnt: 0, etc: "샴푸, 바디워시 기본 구비"},
				{category: "전기제품", item: "헤어드라이기", cnt: 0, etc: "필요 시 관리사무소 문의"},
				{category: "기타", item: "식기류", cnt: 0, etc: "바베큐장에서 사용 후 반납"},
			]
};


//파라미터로 siteName 값 있을 시 동적으로 페이지 출력
switch(siteName){
	case 'caravan': shiftContent(caravan); break;
	case 'auto': shiftContent(autoCamp); break;
	case 'deck': shiftContent(deckCamp); break;
}


//버튼 클릭 시 내용 교체하는 이벤트
let buttons = document.querySelectorAll('#btnBox button');
for(let i = 0; i < buttons.length; i++){
	buttons[i].addEventListener('click', (e) => {
		let btnText = e.target.innerText;
	
		switch(btnText){
			case '카라반': shiftContent(caravan); break;
			case '오토캠핑': shiftContent(autoCamp); break;
			case '데크캠핑': shiftContent(deckCamp); break;
		}
	});
}

//실행될 함수
function shiftContent(site){
	let breadcrumb_items = document.querySelectorAll('.breadcrumb-item');

	//breadcrumb_item 세 번째 있을 시 삭제하고 링크 추가
	if(breadcrumb_items.length == 3){
		breadcrumb_items[2].remove();
	}
	breadcrumb_items[1].classList.remove('active');
	breadcrumb_items[1].innerHTML = '<a href="/inTheForest/intro.do">시설안내</a>';

	//breadcrumb 추가
	let li = document.createElement('li');
	li.classList.add('breadcrumb-item');
	li.classList.add('active');
	li.innerText = site.name;
	document.querySelector('.breadcrumb').appendChild(li);
	
	//h1 교체
	document.querySelector('nav[aria-label="breadcrumb"] + h1').innerText = site.name + ' 소개';



	//carousel 내부 요소 모두 삭제
	let indicator = document.querySelector('.carousel-indicators');
	let inner = document.querySelector('.carousel-inner');
	indicator.innerHTML = ''; //내부 요소 모두 삭제
	inner.innerHTML = '';
	
	//carousel - content 수만큼 indicator 생성
	for(let i = 0; i < site.content.length; i++){ 
		let item = document.createElement('button');
		item.setAttribute('type', 'button');
		item.setAttribute('data-bs-target', '#carouselExampleCaptions');
		item.setAttribute('data-bs-slide-to', i);
		item.setAttribute('aria-label', `Slide ${i+1}`);
		if(i == 0){ //첫번째 indicator일 시
			item.setAttribute('class', 'active');
			item.setAttribute('aria-current', true);
		}
		document.querySelector('.carousel-indicators').appendChild(item);
	}

	//carousel - content 수만큼 이미지와 캡션 삽입
	for(let i = 0; i < site.content.length; i++){ 
		let item = document.createElement('div');
		item.setAttribute('class', 'carousel-item');
		item.setAttribute('data-bs-interval', '5000'); //지연시간
		if(i == 0){ //첫번째 요소일 시
			item.classList.add('active');
		}
		item.innerHTML = `<img src="assets/site/intro/${site.content[i].img}" class="d-block w-100" alt="${site.content[i].img}">`
		               + `<div class="carousel-caption d-none d-md-block">`
									 + `  <h1>${site.content[i].title}</h1>`
									 + `  <p class="fs-4">${site.content[i].text}</p>`
									 + `</div>`;
		document.querySelector('.carousel-inner').appendChild(item);
	}
	
	//carousel - prev-next 버튼 표시
	if(document.querySelector('#carousel-btnBox').style.display == 'none'){
		document.querySelector('#carousel-btnBox').style.display = 'block';
	}

	//테이블 tbody 내용 삭제
	let tbody = document.querySelector('tbody');
	tbody.innerHTML = '';
	
	//테이블 tbody에 state 삽입
	//rowspan 적용하기 위해, 개수를 체크할 빈 객체 선언
	let obj = {};
	
	for(let i = 0; i < site.state.length; i++){
		//{카테고리:개수} 삽입, 초기값은 1
		if(Object.keys(obj).indexOf(site.state[i].category) == -1){
			obj[`${site.state[i].category}`] = 1; 
		}

		//tr 생성
		let tr = document.createElement('tr');
		
		tr.innerHTML = `<td class="table-success text-center">${site.state[i].category}</td>`
								 + `<td>${site.state[i].item}</td>`
								 + `<td>${site.state[i].cnt == 0 ? '-' : site.state[i].cnt}</td>` //0일 시 텍스트 대체
								 + `<td>${site.state[i].etc}</td>`;

		tbody.appendChild(tr);
	}

	//만들어진 테이블에서 rowspan 적용할 개수 체크
	let first_tds = document.querySelectorAll('tbody tr td:first-child');
	for(let i = 0; i < first_tds.length; i++){
		if((i != first_tds.length - 1) && (first_tds[i].innerText == first_tds[i + 1].innerText)){
			//같을 시 개수 증가
			obj[first_tds[i].innerText] += 1;
			
			//앞 - 뒤 비교해서 같을 시 뒤는 제거
			first_tds[i + 1].remove();
		}
	}
	
	//체크한 개수 이용해, 남은 td 다시 가져와 rowspan 적용
	first_tds = document.querySelectorAll('td.table-success');
	for(let i = 0; i < first_tds.length; i++){
		let num = obj[first_tds[i].innerText]; //체크한 개수 불러오기
		first_tds[i].setAttribute('rowspan', num);
	}

}