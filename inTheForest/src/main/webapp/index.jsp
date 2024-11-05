<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>1n the 숲 캠핑장</title>
		<!-- Favicon.io 사이트에서 생성한 favicon.ico -->
		<link rel="icon" type="image/x-icon" href="assets/site/favicon.ico" />
		<!-- Core theme CSS (includes Bootstrap)-->
		<link href="css/site/template.css" rel="stylesheet" />
		
		<style>
			#carouselExampleSlidesOnly img {
				height: 100vh;
        object-fit: cover;
			}
      #messageBox {
				position: absolute;
        top: 20%;
        left: 42%;
        z-index: 10;
        text-align: center;
			}
      #messageBox p:nth-of-type(1) {
        color: white;
        font-size: 2.6rem;
        text-shadow: 2px  2px 5px #333,
                    -2px  2px 5px #333,
                     2px -2px 5px #333,
                    -2px -2px 5px #333;
      }
      #messageBox p:nth-of-type(2) {
        color: rgb(216, 250, 223);
        font-size: 1.1rem;
        text-shadow: 1px  1px 3px #222,
                    -1px  1px 3px #222,
                     1px -1px 3px #222,
                    -1px -1px 3px #222;
      }
			#messageBox button {
        width: 200px;
        height: 70px;
				opacity: 0.8;
        font-size: 1.7rem;
        font-weight: bold;
			}
      @media (max-width: 768px) {
        #messageBox {
          left: 30%;
        }
      }
		</style>
		
	</head>
	<body>

		<div id="carouselExampleSlidesOnly" class="carousel slide carousel-fade" data-bs-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active" data-bs-interval="5000">
					<img src="assets/site/index/forest.jpg" class="d-block w-100" alt="forest">
				</div>
				<div class="carousel-item" data-bs-interval="5000">
					<img src="assets/site/index/field-fall.jpg" class="d-block w-100" alt="fall">
				</div>
				<div class="carousel-item" data-bs-interval="5000">
					<img src="assets/site/index/camping2-1.jpg" class="d-block w-100" alt="camping">
				</div>
				<div class="carousel-item" data-bs-interval="5000">
					<img src="assets/site/index/rainbow.jpg" class="d-block w-100" alt="rainbow">
				</div>
			</div>
		</div>
		
    <div id="messageBox">
        <p>1n the 숲</p>
        <p>자연과 함께하는 힐링 캠핑장</p>
        <button class="btn btn-light" onclick="location.href = 'main.do'">메인으로</button>		
    </div>

		<!-- Bootstrap core JS-->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	</body>
</html>