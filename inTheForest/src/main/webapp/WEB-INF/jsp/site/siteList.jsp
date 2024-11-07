<%@ page import="java.util.*"%>
<%@ page import="java.util.List"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="com.intheforest.vo.BookVO"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.intheforest.service.BookService"%>
<%@ page import="com.intheforest.service.BookServiceImpl"%>
<%@ page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
BookService svc = new BookServiceImpl();
String memberId = (String) session.getAttribute("memberId"); //현재 로그인된 아이디 값
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); //날짜형식 포맷
List<BookVO> list = (List<BookVO>) request.getAttribute("siteListAdmin");
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
<script>
	function siteUse(siteNo, useFlag){	
		getSiteUse(siteNo, useFlag);
		location.reload();
	}
</script>
<style>
	.siteList .off {background-color: #e3e3e3;}
</style>
<body>
	<div class="container reservation">
		<nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
			<ol class="breadcrumb" style="margin-top: 20px">
				<li class="breadcrumb-item"><a href="/inTheForest/main.do">Home</a></li>
				<li class="breadcrumb-item active" aria-current="page">숙소관리</li>
			</ol>
		</nav>

		<h3 class="mt-4 mb-4 fw-bolder">숙소관리</h3>
        <div class="alert alert-warning" role="alert">
            사용유무 값을 '사용안함'으로 변경 시 실시간예약 달력에서 제외됩니다.
        </div>
		<table class="table siteList" style="margin-top:30px">
			<colgroup>
				<col width="10%">
				<col width="15%">
				<col>
				<col width="15%">
				<col width="20%">
				<col width="20%">
			</colgroup>
			<thead class="table-success" align="center">
				<tr class="table-success">
					<th scope="col">순번</th>
					<th scope="col">숙소코드</th>
					<th scope="col">숙소명</th>
					<th scope="col">최대인원</th>
					<th scope="col">가격</th>
					<th scope="col">사용유무</th>
				</tr>
			</thead>
			<tbody>
				<%
				int i = 0;
				for (BookVO bvo : list) {
					i++;
				%>
					<tr class="align-middle <%if(bvo.getUseFlag().equals("n")){ %>off <%} %>" align="center">
						<th scope="row"><%=i%></th>
						<td><%=bvo.getSiteNo()%></td>
						<td><%=bvo.getSiteName()%></td>
						<td><%=bvo.getSiteMax()%>명</td>
						<td><%=bvo.getSitePrice().replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",")%>원</td>
						<td>
							<select class="form-select"
							aria-label="Default select example" name="use" onchange="siteUse(<%=bvo.getSiteNo()%>, this.value)">
								<option value="y" <%if(bvo.getUseFlag().equals("y")){ %>selected <%} %>>사용</option>
								<option value="n" <%if(bvo.getUseFlag().equals("n")){ %>selected <%} %>>사용안함</option>
							</select>
						</td>
					</tr>
				<%}%>
			</tbody>
		</table>
	</div>
</body>
<script src="js/site/siteList.js"></script>
</html>