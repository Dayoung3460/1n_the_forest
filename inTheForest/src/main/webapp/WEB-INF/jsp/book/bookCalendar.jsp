<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page import="com.intheforest.vo.BookVO"%>
<%@ page import="com.intheforest.service.BookService"%>
<%@ page import="com.intheforest.service.BookServiceImpl"%>
<%@page import="java.util.List"%>
<%@page import="java.util.*"%>
<%
BookService svc = new BookServiceImpl();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy/MM/dd");
List<BookVO> list = (List<BookVO>) request.getAttribute("siteList");
String memberId = (String)session.getAttribute("memberId");

/*달력출력[S]*/
int year = 0;
int month = 0; // 0 ~ 11
int result2 =0;

// 년도, 월 중 하나라도 지정(넘겨져 오지)되지 않으면 오늘날짜 기준으로 월달력 출력
if (request.getParameter("year") == null || request.getParameter("month") == null) {
	Calendar today = Calendar.getInstance();
	year = today.get(Calendar.YEAR);
	month = today.get(Calendar.MONTH);
	
} else {
	// 출력하고자 하는 달력의 년도와 월
	year = Integer.parseInt(request.getParameter("year")); // 2022,..
	month = Integer.parseInt(request.getParameter("month"))-1; // 0 ~ 11

	// 이전달 클릭 year, month-1 / 다음달 클릭 year, month+1
	// -1 -> 11,year--  12 -> 0,year++
	if (month == 0) {
		month = 12;
		year = year - 1;
	}
	if (month == 13) {
		month = 1;
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
	<nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
	  <ol class="breadcrumb" style="margin-top:20px">
	    <li class="breadcrumb-item"><a href="/inTheForest/main.do">Home</a></li>
	    <li class="breadcrumb-item active" aria-current="page">실시간예약</li>
	  </ol>
	</nav>
	
	<h1>실시간예약</h1>
		
		<%		
		int calMonth = month;
		if (request.getParameter("month") == null) {
			calMonth = month+1;
		}else{
			calMonth = month;			
		}
		int pYear = year;
		int nYear = year;
		int pMonth = calMonth - 1;
		int nMonth = calMonth + 1;
		
		if(nMonth == 13){
			nMonth = 1;
			nYear = year+1;
		}
		if(pMonth == 0){
			pMonth = 12;
			pYear = year-1;
		}
		
		String thismonth = Integer.toString(calMonth);
		String prevMonth= Integer.toString(pMonth);
		String nextMonth = Integer.toString(nMonth);
		
		if(nMonth < 10){
			nextMonth = "0"+nextMonth;
		}
		
		if(pMonth < 10){
			prevMonth = "0"+prevMonth;
		}
		
		if(calMonth < 10){
			thismonth = "0"+thismonth;
		}
		
		%>
		
		<!-- 이전/다음달 버튼 -->
		<div class="bx">
			<div class="res-month">
				<a
					href="<%=request.getContextPath()%>/bookCalendar.do?year=<%=pYear%>&month=<%=prevMonth%>"
					title="이전달" class="prev"><i class="bi bi-chevron-left"></i><span><%=pYear + "-" + prevMonth%></span></a>
				<span><%=year + "-" + thismonth%></span> 
				<a
					href="<%=request.getContextPath()%>/bookCalendar.do?year=<%=nYear%>&month=<%=nextMonth%>"
					title="다음달" class="next"><span><%=nYear + "-" + nextMonth%></span><i
					class="bi bi-chevron-right"></i></a>
			</div>
		</div>

		<!-- 달력 -->
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
							
							String thisDays = Integer.toString(days);
							
							if(days <10){
								thisDays = "0"+days;
							}
							
							String thisDate = year + "-" + thismonth + "-" + thisDays;
							
							//지난날 계산[S]
							String today = sdf.format(new Date(System.currentTimeMillis()));
							Date date = new Date(sdf.parse(thisDate).getTime()); 
							Date todayDate = new Date(sdf.parse(today).getTime());
							
							int result = todayDate.compareTo(date);
							//지난날 계산[E]							
																	
						%>
						<td <%if(result > 0){ %>class="last"<%} %> <%=result %>>
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
								for (BookVO bvo : list) {	
									Date formatDate = sdf.parse(thisDate);
									String newDate = sdf2.format(formatDate);
									result2 = svc.selectBookDate(bvo.getSiteNo(), newDate);
								%>
								<li <%if(result2 > 0){ %>class="out"<%}%>>
									<!--지난 날 또는 예약완료된 숙소-->
									<%if(result > 0 || result2 > 0){ %>
										<button type="button" data-bs-toggle="modal" data-bs-target="#fullModal"><%=bvo.getSiteName()%> <span>(예약불가)</span></button>
									<%}else{ %>
										<!--로그인 여부-->
										<%if(memberId != null){ %>
											<button type="button" data-bs-toggle="modal" data-bs-target="#exampleModal" onclick="calValue('<%=thisDate%>', <%=bvo.getSiteNo()%>, '<%=bvo.getCategory()%>')"><%=bvo.getSiteName()%> <span>(예약가능)</span></button>
										<%}else{ %>
											<button type="button" data-bs-toggle="modal" data-bs-target="#loginModal"><%=bvo.getSiteName()%> <span>(예약가능)</span></button>
										<%}%>
									<%} %>
								</li>
								<%}%>
							</ul> 
							<%} else {%> 
								&nbsp; 
							<%} %>
						</td>
						<%if (i != tdCnt && i % 7 == 0) {%>
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
			 	location.href = '/inTheForest/bookAppForm.do?siteDate='+date+'&category='+cate+'&siteNo='+no+'&addDate='+$("#dateSelect").val();
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
							<option value="4">4박 5일</option>
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
	
	<!-- 예약불가 모달 -->
	<div class="modal fade" id="fullModal" tabindex="-1"
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
					<span>예약이 마감된 숙소입니다.</span>
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