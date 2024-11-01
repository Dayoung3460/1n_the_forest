<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    
<link href="css/site/main.css" rel="stylesheet" />

<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3" aria-label="Slide 4"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="4" aria-label="Slide 5"></button>
</div>
    <div class="carousel-inner">
    <div class="carousel-item active" data-bs-interval="5000">
        <img src="assets/site/main/camping1.jpg" class="d-block w-100" alt="main_banner1">
    </div>
    <div class="carousel-item" data-bs-interval="5000">
        <img src="assets/site/main/caravan.jpg" class="d-block w-100" alt="main_banner5">
    </div>
    <div class="carousel-item" data-bs-interval="5000">
        <img src="assets/site/main/camping2.jpg" class="d-block w-100" alt="main_banner4">
    </div>
    <div class="carousel-item" data-bs-interval="5000">
        <img src="assets/site/main/camfire2.jpg" class="d-block w-100" alt="main_banner3">
    </div>
    <div class="carousel-item" data-bs-interval="5000">
        <img src="assets/site/main/campfire1.jpg" class="d-block w-100" alt="main_banner2">
    </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
    </button>
</div>

<div class="row justify-content-around m-4">
    <div class="col-sm-12 col-lg-6">
        <div class="row">
            <div class="col-sm-12 col-lg-1 titles fs-5 fw-bolder d-flex align-items-center justify-content-center">
            	공지사항
            </div>
            <ul class="col-md-12 col-lg-8 col-xl-9 list-group list-group-flush">

                <c:forEach var="boardList" items="${boardList}" begin="0" end="4" step="1">
	                <li class="list-group-item">
		                <a href="board.do?bno=${boardList.boardNo}">${boardList.title}</a>
		                <span><fmt:formatDate value="${boardList.writeDate}" pattern="yyyy/MM/dd"></fmt:formatDate></span>
	                </li>                
                </c:forEach>
                
            </ul>
        </div>
    </div>
    <div class="col-sm-12 col-lg-5">
        <div class="row">
            <div class="col-sm-12 col-lg-1 titles fs-5 fw-bolder d-flex align-items-center justify-content-center">
            	오시는길
            </div>
            <div class="col" id="googleMap" class="col-md-9"></div>
        </div>
    </div>
</div>

<!-- icon-icons.com 이미지 사용 -->
<div id="introBox" class="row mb-4 justify-content-center">
    <div class="col-md-3 text-center my-4">
        <a href="#"><img class="img-fluid rounded-circle mb-4" src="assets/site/main/roadcaravan_icon.png" alt="caravan" /></a>
        <h1 class="text-mint fs-4 fw-bolder">카라반</h1>
        <p class="text-muted mb-0">숲 속에서 자연을 느끼며 아늑한 휴식</p>
    </div>
    <div class="col-md-3 text-center my-4">
        <a href="#"><img class="img-fluid rounded-circle mb-4" src="assets/site/main/camping_tent_icon.png" alt="autoCamp" /></a>
        <h1 class="text-mint fs-4 fw-bolder">오토캠핑</h1>
        <p class="text-muted mb-0">가까운 주차공간 완비, 편리한 오토캠핑</p>
    </div>
    <div class="col-md-3 text-center my-4">
        <a href="#"><img class="img-fluid rounded-circle mb-4" src="assets/site/main/eco-field_icon.png" alt="deckCamp" /></a>
        <h1 class="text-mint fs-4 fw-bolder">데크캠핑</h1>
        <p class="text-muted mb-0">한적한 들판에서 즐기는 캠핑의 묘미</p>
    </div>
</div>

<p class="text-center fs-2 fw-bolder mt-5 ">1n the 숲 캠핑장은…</p>
<p class="text-muted text-center fs-6 mb-4">
	1n the 숲 캠핑장은 앞산 전망이 훤히 내다보이는 곳에 위치해 있어<br>
	낮에는 도시 전경, 밤에는 멋진 야경을 감상할 수 있는 곳입니다.<br><br>
	1n the 숲에서 일상을 잠시 내려두고 자연을 즐겨보세요.
</p>

<div class="row">
  <div class="col text-center">
    <button type="button" class="btn btn-success btn-lg fw-bolder mb-4" onclick="location.href = 'book_calendar.do'">실시간예약 바로가기</button>
  </div>
</div>

<img src="assets/site/index/forest.jpg" alt="forest">

<script src="http://maps.google.com/maps/api/js?key=AIzaSyAXTokRl7G2h8eiQH3BbA9KbcHGCZ-27EI&region=kr"></script>

<!-- 구글 지도 생성용 google api 코드 -->
<script>


    let map;

    async function initMap() {
        const { Map } = await google.maps.importLibrary("maps");
        
        let position = { lat: 35.824795, lng: 128.557321 };
        map = new Map(document.getElementById("googleMap"), {
            center: position,
            zoom: 15
        });

        let marker = new google.maps.Marker({
            position: position,
            icon: {
                url: "assets/site/main/camping_icon.png",
                scaledSize: new google.maps.Size(80, 80),
                anchor: new google.maps.Point(35, 50)
            },
            title: "1n the 숲 캠핑장",
            map
        });
    }

    initMap();

</script> 