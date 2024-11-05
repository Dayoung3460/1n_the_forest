<%@ page import="java.util.*"%>
<%@ page import="java.util.List"%>
<%@ page import="com.intheforest.vo.BookVO"%>
<%@ page import="com.intheforest.vo.MemberVO"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<%
String memberId = (String) session.getAttribute("memberId");
String siteNo = (String) request.getParameter("siteNo");
String siteDate = (String) request.getParameter("siteDate");
String category = (String) request.getParameter("category");
int addDate = Integer.parseInt(request.getParameter("addDate"));

BookVO bvo = (BookVO)request.getAttribute("bookvo");
MemberVO mvo = (MemberVO)request.getAttribute("MemberVO");
List<BookVO> optionList = (List<BookVO>)request.getAttribute("optionList");

/*n박 계산[S]*/
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

Calendar calendar = Calendar.getInstance();
Date dt = sdf.parse(siteDate);
calendar.setTime(dt);
calendar.add(Calendar.DATE, addDate); 
String endDate = sdf.format(calendar.getTime());
/*n박 계산[E]*/      
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
			var sitePrice = $("#sitePrice").val();
			sitePrice = sitePrice.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			$("#totalPrice").html(sitePrice);
			
			var totalPrice = ${bookvo.sitePrice};
			var viewPrice = "";
			
			 $('input[name="option[]"]').change(function(){
				
				var optionVal = $("#optionPrice_"+$(this).val()).val();
				
				if($(this).is(":checked")){
					totalPrice += parseInt(optionVal);
				}else{
					totalPrice -= parseInt(optionVal);
				}						
				viewPrice = String(totalPrice);
				$("#totalPrice").html(viewPrice.replace(/\B(?=(\d{3})+(?!\d))/g, ","));
			})
		})
	</script>
	<body>
		<div class="container reservation">
		<nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
		  <ol class="breadcrumb" style="margin-top:20px">
		    <li class="breadcrumb-item"><a href="/inTheForest/main.do">Home</a></li>
		    <li class="breadcrumb-item active" aria-current="page">실시간예약 상세</li>
		  </ol>
		</nav>
	
			<h1>실시간예약 상세</h1>
			<form action="bookApp.do" method="POST">
				<input type="hidden" name="siteDate" value="<%=siteDate%>"> 
				<input type="hidden" name="category" value="<%=category%>">
				<input type="hidden" name="siteNo" value="<%=siteNo%>">
				<input type="hidden" name="endDate" value="<%=endDate%>">
				<input type="hidden" name="memberId" value="<%=memberId%>">
				<input type="hidden" name="sitePrice" id="sitePrice" value="${bookvo.sitePrice}">
					
				<div class="addform">
					
					<p class="h4">1. 예약자 정보</p>		
					
					<div class="mb-3 row">
					  <label for="exampleFormControlInput1" class="col-sm-2 col-form-label">예약인원</label>
					  	<div class="col-sm-10">
						  <select name="memCnt" class="form-select w-25">
						 	<c:forEach var="i" begin="2" end="${bookvo.siteMax}">
								<option value="${i}" selected>${i}인</option>
							</c:forEach>
						</select>
						</div>
					</div>
					
					<div class="mb-3 row">
					  <label for="exampleFormControlInput1" class="col-sm-2 col-form-label">예약자명</label>
					  <div class="col-sm-10">
					  	<input type="text" name="name" class="form-control w-50" value="${MemberVO.memberName}">
					  </div>
					</div>
					
					<div class="mb-3 row">
					  <label for="exampleFormControlInput1" class="col-sm-2 col-form-label">차량번호</label>
					  <div class="col-sm-10">
					  	<input type="text" name="carNum" class="form-control w-50">
					  </div>
					</div>
					
					<div class="mb-3 row">
					  <label for="exampleFormControlInput1" class="col-sm-2 col-form-label">연락처</label>
					  <div class="col-sm-10">
					  	<input type="text" name="tel" maxlength="13" class="form-control w-50" oninput="autoHyphen(this)" value="${MemberVO.tel}">
					  </div>
					</div>
					
					<div class="mb-3 row">
					  <label for="exampleFormControlInput1" class="col-sm-2 col-form-label">이메일</label>
					  <div class="col-sm-10">
					  	<input type="text" name="email" class="form-control w-50" value="${MemberVO.email}">
					  </div>
					</div>
				</div>
				
				<div class="addform">		
					<p class="h4">2. 옵션 선택</p>				
					<div class="row g-3">
						<div class="col-md-6">
							<%for(BookVO ovo : optionList){%>
								<div class="input-group mb-3">
								  <div class="input-group-text">
								    <input class="form-check-input mt-0" type="checkbox" value="<%=ovo.getOptionNo() %>" aria-label="Chec
								    kbox for following text input" name="option[]">
								  </div>
								  <input type="hidden" id="optionPrice_<%=ovo.getOptionNo() %>" value="<%=ovo.getOptionPrice() %>">
								  <input type="text" class="form-control" aria-label="Text input with checkbox" value="<%=ovo.getOptionName() %> (<%=ovo.getOptionPrice().replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",") %>원)" readonly onclick="">
								</div>
							<%} %>
						</div>
					</div>
				</div>
					
					
				<div class="faci-pay">
					<div class="left">
						<p class="tit">${bookvo.siteName}</p>
						<p class="date"><%=siteDate%> ~ <%=endDate%></p>
						<p class="txt">※ 해당 예약에 대한 결제는 현장결제로 진행됩니다.<br> ※ 추가 문의사항은 053-111-2222로 문의부탁드립니다.</p>
					</div>
					<div class="right">
						<div class="sum">
							<p class="tit">결제예정금액</p>
							<p class="txt">총 <span id="totalPrice"></span> 원</p>
						</div>
					</div>
				</div>
				
				<div align="center" style="margin-top:30px">
					<a class="btn btn-secondary btn-lg" href="<%=request.getContextPath()%>/book_calendar.do">이전</a> 
					<button type="submit" class="btn btn-primary btn-lg">예약확정</button>
				</div>
			</form>
		</div>
	</body>
</html>