<%@ page import="com.intheforest.vo.BoardVO"%>
<%@ page import="com.intheforest.vo.MyBookVO"%>
<%@ page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%
List<MyBookVO> list = (List<MyBookVO>) request.getAttribute("myPageBookList");
String logId = (String) session.getAttribute("logId");
%>

<div class="p-3 boardList">
	<h3>마이페이지</h3>
	<button type="button" class="btn btn-outline-secondary" value="Submit"
		style="float: right">
		<a href="DetailJoin.do?memberId=<%=logId%>" style="text-decoration:none">회원정보 수정</a>
	</button>
	<p style="text-align:left">예약목록조회</p>

	<table class="table table-hover">
		<thead>
			<tr>
				<th>예약번호</th>
				<th>숙소종류</th>
				<th>예약인원</th>
				<th>이용기간</th>
				<th>금액</th>
				<th>등록일</th>
				<th>상태</th>
			</tr>
		</thead>
		<tbody>
			<%
			for (MyBookVO bvo : list) {
			%>
			<tr onClick="location.href='book_app.do?siteDate=<%=bvo.getSiteDate()%>&category=<%=bvo.getCategory()%>&siteNo=<%=bvo.getSiteNo()%>&addDate=<%=bvo.getAddDate()%>'">
				<th scope="row"><%=bvo.getBookNo()%></th>
				<td><%=bvo.getSiteName()%></td>
				<td><%=bvo.getMemCnt()%>명</td>
				<td><%=bvo.getStartDate()%> ~ <%=bvo.getEndDate()%></td>
				<td><%=bvo.getTotalPrice()%>원</td>
				<td><%=bvo.getCreateDate()%></td>
				<%if(bvo.getCancelFlag()==0) { %>
				<td>확정</td>
				<%} else { %>
				<td><span style="color:red">예약취소</span></td>
				<%}}%>
			</tr>
		</tbody>
	</table>
</div>