<%@ page import="com.intheforest.vo.BoardVO"%>
<%@ page import="com.intheforest.vo.MyBookVO"%>
<%@ page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<div class="p-3 boardList">
	<h3>문의하기</h3>
	<p>궁금하신 사항을 자유롭게 질문해주세요</p>

	<table class="table">
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
			<c:forEach var="mybook" items="${ myPageBookList }">
				<!-- 컨트롤러 set 변수이름, var는 추가적으로 만드는거 - 리스트안에 객체안의 하나하나 변수 -->
				<tr>
					<td><span>${mybook.bookNo }</span></td>
					<!--<td><span>${mybook.siteName }</span></td>
					<td><span>${mybook.memNum }인</span></td>
					<td><span>${mybook.startDate } ~ ${mybook.endDate }</span></td>
					<td><span>${mybook.totalPrice }원</span></td>
					<td><span>${mybook.createDate }</span></td>
 
					<c:choose>
						<c:when test="${mybook.cancelFlag eq '0'}">
							<td>확정</td>
						</c:when>
						<c:otherwise>
							<td><span>예약취소</span></td>
						</c:otherwise>

					</c:choose>
					 -->
					 </tr>
			</c:forEach>
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