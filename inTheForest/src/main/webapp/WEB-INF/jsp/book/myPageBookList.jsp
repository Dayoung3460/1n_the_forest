<%@ page import="com.intheforest.vo.BoardVO"%>
<%@ page import="com.intheforest.vo.MyBookVO"%>
<%@ page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%
List<MyBookVO> list = (List<MyBookVO>) request.getAttribute("myPageBookList");
String mid = (String) request.getAttribute("memberId");

%>


<div class="p-3 boardList">
	<h3>마이페이지</h3>
	<button type="button" class="btn btn-outline-secondary" value="Submit"
		style="float: right">
		<a href="login.do?memberId=<%=mid%>">회원정보 수정</a>
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
			<tr onClick="location.href='book_app.do?siteDate=2024-11-01&category=deck&siteNo=1005&addDate=4'">
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


	<!-- 
            <c:choose>
                <c:when test="${ paging.next }">
                    <li class="page-item"><a class="page-link"
                                             href="boardList.do?currentPage=${ paging.endPage + 1 }&searchCondition=${ search.searchCondition }&keyword=${ search.keyword }">Next</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="page-item disabled"><a class="page-link">Next</a></li>
                    </li>
                </c:otherwise>
            </c:choose> -->
	<!-- 
	<div class="bottom m-4 ">
		<form class="row g-3" action="boardList.do" method="get">
			<div class="col-md-4">
				<select name="searchCondition" class="form-select">
					<option value=""
						${search.searchCondition.equals("") ? "selected" : ""}>선택하세요
					</option>
					<option value="title"
						${ search.searchCondition.equals("title") ? "selected" : "" }>제목
					</option>
					<option value="writer"
						${ search.searchCondition.equals("writer") ? "selected" : "" }>작성자
					</option>
					<option value="titleAndWriter"
						${ search.searchCondition.equals("titleAndWriter") ? "selected" : "" }>제목
						& 작성자</option>
				</select>
			</div>
			<div class="col-md-6">
				<input type="text" class="form-control" name="keyword"
					value="${ search.keyword }">
			</div>
			<div class="col-md-2">
				<button type="submit" class="btn btn-success">조회</button>
			</div>
		</form>
		<button type="submit" class="btn btn-success mx-lg-4 write">
			<a href="addBoardForm.do">글쓰기</a>
		</button>
	</div> -->

</div>