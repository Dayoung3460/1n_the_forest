<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.intheforest.vo.BookVO"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.*"%>
<%
String siteDate = (String) request.getParameter("siteDate");
String category = (String) request.getParameter("category");
String siteNo = (String) request.getParameter("siteNo");
int addDate = Integer.parseInt(request.getParameter("addDate"));
String logId = (String) session.getAttribute("logId");

List<BookVO> optionList = (List<BookVO>)request.getAttribute("optionList");
BookVO bvo = (BookVO)request.getAttribute("bookvo");

/*n박 계산[S]*/
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

Calendar calendar = Calendar.getInstance();
Date dt = sdf.parse(siteDate);
calendar.setTime(dt);
calendar.add(Calendar.DATE, addDate); 
String endDate = sdf.format(calendar.getTime());
/*n박 계산[E]*/

/*예약번호 랜덤[S]*/
Random random = new Random();

List<String> rlist = new ArrayList<>();
for(int i=0; i<3; i++) {
	rlist.add(String.valueOf(random.nextInt(10)));
}
for(int i=0; i<3; i++) {
	rlist.add(String.valueOf((char)(random.nextInt(26)+65)));
}

Collections.shuffle(rlist);
String bookNo = "";
for(String item : rlist) {
	bookNo += item;
}

/*예약번호 랜덤[E]*/
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>달력</title>
		<!-- Latest compiled and minified CSS -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
		<link href="./css/book/book.css" rel="stylesheet">
		<!-- Latest compiled JavaScript -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
	</head>
	
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script>
		const autoHyphen = (target) => {
			target.value = target.value
				.replace(/[^0-9]/g, '')
				.replace(/^(\d{2,3})(\d{3,4})(\d{4})$/g, "$1-$2-$3")
				.replace(/(\-{1,2})$/g, "");
		}
		
		$(document).ready(function(){
			var totalPrice = ${bookvo.sitePrice};
			var selected = [];
			
			
			 $('input[name="option"]').change(function(){
				 
				var optionVal = $("#optionPrice_"+$(this).val()).val();
				
				if($(this).is(":checked")){
					totalPrice += parseInt(optionVal);	
				}else{
					totalPrice -= parseInt(optionVal);
				}
				
				$("#totalPrice").html(totalPrice+"원");
			})
		})
	</script>
	<body>
		<div class="container reservation">
		
			<h3>캠핑 예약 상세</h3>
			<form action="site_app.do" method="post" enctype="multipart/form-data">
				<input type="hidden" name="siteDate" value="<%=siteDate%>"> 
				<input type="hidden" name="category" value="<%=category%>">
				<input type="hidden" name="siteNo" value="<%=siteNo%>">
				<input type="hidden" name="endDate" value="<%=endDate%>">
				<input type="hidden" name="logId" value="<%=logId%>">
				<input type="hidden" name="bookNo" value="<%=bookNo%>">
				
				<table class="table table-bordered">
					<tr>
						<th class="table-secondary">예약구역</th>
						<th class="table-secondary">이용기간</th>
						<th class="table-secondary">금액</th>
					</tr>
					<tr>
						<td>${bookvo.siteName}</td>
						<td><%=siteDate%> ~ <%=endDate%></td>
						<td id="totalPrice">${bookvo.sitePrice}원</td>
					</tr>
				</table>
				
				<table class="table table-bordered" style="margin-top:10px">
					<tr>
						<th class="table-secondary">예약인원</th>
						<th>
							<select name="mem_cnt" class="form-select">
								<option value="2" selected>2인</option>
								<option value="3">3인</option>
								<option value="4">4인</option>
								<option value="5">5인</option>
							</select>
						</th>
						<th class="table-secondary">예약자명</th>
						<td><input type="text" name="name" class="form-control"></td>
					</tr>
			
					<tr>
						<th class="table-secondary">차량번호</th>
						<th><input type="text" name="car_num" class="form-control"></th>
						<th class="table-secondary">연락처</th>
						<td><input type="text" name="tel" maxlength="13" class="form-control" oninput="autoHyphen(this)"></td>
					</tr>
			
					<tr>
						<th class="table-secondary">주소</th>
						<th><input type="text" name="address" class="form-control"></th>
						<th class="table-secondary">이메일</th>
						<td><input type="text" name="email" class="form-control"></td>
					</tr>
			
					<tr>
						<th colspan="4" style="text-align: center" class="table-secondary">옵션 선택</th>
					</tr>
					
					<tr>
						<td colspan="4">
							<div class="row g-3">
								<div class="col-md-6">
									<%for(BookVO ovo : optionList){%>
										<div class="form-check">
											<input class="form-check-input optionChk" type="checkbox" value="<%=ovo.getOptionNo() %>" name="option"
					 id="<%=ovo.getOptionNo() %>"> 
					 						<input id="optionPrice_<%=ovo.getOptionNo() %>" value="<%=ovo.getOptionPrice() %>" type="hidden">
											<label class="form-check-label" for="<%=ovo.getOptionNo() %>"><%=ovo.getOptionName() %> (<%=ovo.getOptionPrice() %>)</label>
										</div>
									<%} %>
								</div>
							</div>
						</td>
					</tr>
				</table>
				
				<div align="center">
					<a class="btn btn-secondary" href="<%=request.getContextPath()%>/book_calendar.do">이전</a> 
					<a class="btn btn-primary">예약확정</a>
				</div>
			</form>
		</div>
	</body>
</html>