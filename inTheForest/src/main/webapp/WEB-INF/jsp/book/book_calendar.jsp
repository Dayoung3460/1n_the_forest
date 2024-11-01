<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page import="com.intheforest.vo.BookVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.*"%>
<%
List<BookVO> list = (List<BookVO>) request.getAttribute("siteList");
String logId = (String)session.getAttribute("logId");

/*달력출력[S]*/
int year = 0;
int month = 0; // 0 ~ 11

// 년도, 월 중 하나라도 지정(넘겨져 오지)되지 않으면 오늘날짜 기준으로 월달력 출력
if (request.getParameter("year") == null || request.getParameter("month") == null) {
	Calendar today = Calendar.getInstance();
	year = today.get(Calendar.YEAR);
	month = today.get(Calendar.MONTH);
} else {
	// 출력하고자 하는 달력의 년도와 월
	year = Integer.parseInt(request.getParameter("year")); // 2022,..
	month = Integer.parseInt(request.getParameter("month")); // 0 ~ 11

	// 이전달 클릭 year, month-1 / 다음달 클릭 year, month+1
	// -1 -> 11,year--  12 -> 0,year++
	if (month == -1) {
		month = 11;
		year = year - 1;
	}
	if (month == 12) {
		month = 0;
		year = year + 1;
	}
}

// 출력하고자 달의 1일 객체 + 1일 요일 + 마지막 날짜
Calendar firstDate = Calendar.getInstance();
firstDate.set(Calendar.YEAR, year);
firstDate.set(Calendar.MONTH, month);
firstDate.set(Calendar.DATE, 1);
int firstDay = firstDate.get(Calendar.DAY_OF_WEEK); // 1일의 요일 정보(1일,2월,....,7토)
int lastDate = firstDate.getActualMaximum(Calendar.DATE);

// 출력 알고리즘(td의 개수 구하기)
int startBlankCnt = firstDay - 1;
int endBlankCnt = 0;
if ((startBlankCnt + lastDate) % 7 != 0) {
	endBlankCnt = 7 - (startBlankCnt + lastDate) % 7;
}
int tdCnt = startBlankCnt + lastDate + endBlankCnt;
/*달력출력[E]*/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>달력</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="./css/book/book.css" rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
</head>

<body>
	<div class="container reservation">

		<!-- 이전/다음달 버튼 -->
		<div class="bx">
			<div class="res-month">
				<a
					href="<%=request.getContextPath()%>/book_calendar.do?year=<%=year%>&month=<%=month - 1%>"
					title="이전달" class="prev"><i class="bi bi-chevron-left"></i><span><%=year + "-" + (month - 1)%></span></a>
				<span><%=year + "-" + month%></span> <a
					href="<%=request.getContextPath()%>/book_calendar.do?year=<%=year%>&month=<%=month + 1%>"
					title="다음달" class="next"><span><%=year + "-" + (month + 1)%></span><i
					class="bi bi-chevron-right"></i></a>
			</div>
		</div>

		<!-- 달력 -->
		<div class="callout">예약가능한 숙소를 선택해주세요</div>
		<div class="res-calendar">
			<table>
				<thead>
					<tr class="">
						<th class="sun">일</th>
						<th>월</th>
						<th>화</th>
						<th>수</th>
						<th>목</th>
						<th>금</th>
						<th class="sat">토</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<%
						for (int i = 1; i <= tdCnt; i++) {
							int days = i - startBlankCnt;
							String thismonth = Integer.toString(month);
							String thisDays = Integer.toString(days);
							
							if(month <10){
								thismonth = "0"+month;
							}
							
							if(days <10){
								thisDays = "0"+days;
							}
						%>
						<td>
							<%
							if (i > startBlankCnt && i <= startBlankCnt + lastDate) {
								if (i % 7 == 0) { //토요일
							%> <span class="day sat"><%=days%></span> <%
							 } else if (i % 7 == 1) { //일요일
							 %>
							<span class="day sun"><%=days%></span> <%
							 } else { //평일
							 %>
							<span class="day"><%=days%></span> <%
							 }
							 %>

							<ul>
								<%
								String thisDate = year + "-" + thismonth + "-" + thisDays;
								for (BookVO bvo : list) {
								%>
								<li>
									<%if(logId != null){ %>
										<button type="button" data-bs-toggle="modal"
										data-bs-target="#exampleModal"
										onclick="calValue('<%=thisDate%>', '<%=bvo.getSiteNo()%>', '<%=bvo.getCategory()%>')"><%=bvo.getSiteName()%> <span>(예약가능)</span></button>
									<%}else{ %>
										<button type="button" data-bs-toggle="modal"
										data-bs-target="#exampleModal"
										onclick="calValue('<%=thisDate%>', '<%=bvo.getSiteNo()%>', '<%=bvo.getCategory()%>')"><%=bvo.getSiteName()%> <span>(예약가능)</span></button>
										<!--  <button type="button" data-bs-toggle="modal"
										data-bs-target="#loginModal"><%=bvo.getSiteName()%></button>-->
									<%} %>
								</li>
								<%
								}
								%>
							</ul> <%
								 } else {
								 %> &nbsp; <%
								 }
								 %>
						</td>
						<%
						if (i != tdCnt && i % 7 == 0) {
						%>
					</tr>
					<tr>
						<%}}%>
					</tr>
				</tbody>
			</table>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script>
		function calValue(date, no, cate) {						
			document.querySelector('#modalSave').addEventListener('click', function(e){
			 	location.href = '/inTheForest/book_app.do?siteDate='+date+'&category='+cate+'&siteNo='+no+'&addDate='+$("#dateSelect").val();
		 	});
		}		
	</script>

	<!-- 모달(modal)창 열기 -->

	<!-- 숙박일수 모달 -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				
				<div class="modal-header">
					<!-- 모달창 타이틀 -->
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>

				<div class="modal-body">
					<div class="mb-3"> 
					<p>숙박일수를 선택해주세요</p>
						<select class="form-select" aria-label="Default select example" id="dateSelect">
							<option selected value="1">1박 2일</option>
							<option value="2">2박 3일</option>
							<option value="3">3박 4일</option>
						</select>
					</div>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal" onclick="modalClose()">닫기</button>
					<!-- 닫는 버튼 -->
					<button type="button" class="btn btn-primary" id="modalSave">다음단계</button>
					<!-- 저장버튼 -->
				</div>
			</div>
		</div>
	</div>
	
	
	<!-- 로그인 모달 -->
	<div class="modal fade" id="loginModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel"></h1>
					<!-- 모달창 타이틀 -->
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>

				<div class="modal-body">
					<span>로그인이 필요합니다.</span>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal" onclick="modalClose()">닫기</button>
					<!-- 닫는 버튼 -->
				</div>
			</div>
		</div>
	</div>
	<script src="js/calendarModal.js"></script>
</body>
</html>