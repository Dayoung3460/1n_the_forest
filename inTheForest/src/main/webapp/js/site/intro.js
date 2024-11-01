/* 데이터 입력 예시 (javascript 활용하여 한 페이지 내에서 여러 내용 구현하려 함.) */
/*
let site = {
	name: "카라반",
	content: [
		{title: "편안한 카라반", text: "카라반에서 아늑하게 캠핑을 즐겨보세요.", img: "caravan.jpg"},
		{title: "내부 전경", text: "화이트톤으로 깔끔한 가구들이 준비되어 있습니다.", img: "room2.jpg"},
		{title: "주방용품 구비", text: "따로 준비하지 않아도, 식기와 조미료가 모두 구비되어 있습니다.", img: "kitchen.jpg"},
		{title: "호텔식 침구", text: "최상급 호텔식 침구가 진정한 휴식을 선사합니다.", img: "bed.jpg"},
		{title: "개인 욕실", text: "항상 청결하게 관리되고 있는 개인 욕실이 있습니다.", img: "bathroom2.jpg"}
	],
	state: [
		{category: "침구류", item: "싱글침대", cnt: 2, etc: "또는 더블침대 1 가능<br>※ 필요 시 여분의 침구류를 준비해드립니다."}
	]
}
*/

//객체를 만들 양식 생성
let site = {name, content, state};

//버튼 누를 시 내용 가져오기
let buttons = document.querySelectorAll('#btnBox button');
for(let i = 0; i < buttons.length; i++){
	buttons[i].addEventListener('click', printFunc);
}

function printFunc(e) {
	let btnText = e.target.innerText;
	console.log(btnText);
	
	if(btnText == "카라반"){
		//만약 실제 DB 있을 시 이런 형태로 데이터 가져와 출력하면 됨.
		let contents = [
			{title: "편안한 카라반", text: "카라반에서 아늑하게 캠핑을 즐겨보세요.", img: "caravan.jpg"},
			{title: "내부 전경", text: "화이트톤으로 깔끔한 가구들이 준비되어 있습니다.", img: "room2.jpg"},
			{title: "주방용품 구비", text: "따로 준비하지 않아도, 식기와 조미료가 모두 구비되어 있습니다.", img: "kitchen.jpg"},
			{title: "호텔식 침구", text: "최상급 호텔식 침구가 진정한 휴식을 선사합니다.", img: "bed.jpg"},
			{title: "개인 욕실", text: "항상 청결하게 관리되고 있는 개인 욕실이 있습니다.", img: "bathroom2.jpg"},
		];
		
		let states = [
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
		];
		
		site.name = btnText;
		site.content = contents;
		site.state = states;
		
		
		
	}	else if(btnText == "오토캠핑"){
		
	} else if(btnText == "데크캠핑"){
		
	}
}