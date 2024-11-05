<%@ page import="com.intheforest.vo.BoardVO"%>
<%@ page import="com.intheforest.vo.MyBookVO"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.intheforest.common.PageDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%
    List<MyBookVO> list = (List<MyBookVO>) request.getAttribute("myPageBookList");
    String memberId = (String) session.getAttribute("memberId");
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    PageDTO paging = (PageDTO) request.getAttribute("paging");
    System.out.println(paging);
    String sc = (String) request.getAttribute("searchCondition");
    String kw = (String) request.getAttribute("keyword");
    kw = (kw == null) ? "" : kw;
%>

<div class="p-3 boardList">
	<h3>마이페이지</h3>
	<button type="button" class="btn btn-outline-secondary" value="Submit"
		style="float: right">
		<a href="DetailJoin.do?memberId=<%=memberId%>" style="text-decoration:none">회원정보 수정</a>
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
            <tr onClick="location.href='book_app.do?siteDate=<%=bvo.getStartDate()%>&category=<%=bvo.getCategory()%>&siteNo=<%=bvo.getSiteNo()%>&addDate=<%=bvo.getAddDate()%>&endDate=<%=bvo.getEndDate()%>'">
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
    <!-- 페이지 네이션 -->
    <nav aria-label="Page navigation example">
        <ul class="pagination justify-content-center">
            <!-- 이전페이지 -->
            <%if (paging.isPrev()){ %>
            <li class="page-item" aria-current="page"><a class="page-link"
                                                         href="myPageBookList.do?page=<%=paging.getStartPage()-1 %>">Previous</a>
                    <%} else { %>
            <li class="page-item disabled"><a class="page-link">Previous</a>
                <%} %></li>

            <!-- 페이지 출력 -->
            <%
            		System.out.println("시작" + paging.getStartPage() + "마지막" + paging.getEndPage());
                for(int p = paging.getStartPage(); p <= paging.getEndPage(); p++){
                    if(paging.getCurrentPage() == p){
				            %>
				            <li class="page-item active" aria-current="page"><span
				                    class="page-link"><%=p %></span></li>
				            <%} else { %>
				            <li class="page-item"><a class="page-link"
				                                     href="myPageBookList.do?searchCondition=<%=sc %>&keyword=<%=kw %>&currentPage=<%=p %>">
				                <%=p %></a></li>
				            <%
                }}%>

            <!-- 다음페이지 -->
            <%
                if(paging.isNext()){
            %>
            <li class="page-item" aria-current="page"><a class="page-link"
                                                         href="myPageBookList.do?page=<%=paging.getEndPage() + 1%>">Next</a>
                    <%} else { %>
            <li class="page-item disabled"><a class="page-link">Next</a>
                <%} %>
            </li>

        </ul>


    </nav>
    <!-- 페이지 네이션 끝 -->

    <!-- 검색창 -->
    <div class="bottom m-4 ">
        <form class="row g-3" action="myPageBookList.do">
            <div class="col-md-4">
                <select name="searchCondition" class="form-select">
                    <option selected value="">선택하세요.</option>
                    <option value="bno"
                    <%=(sc != null && sc.equals("bno") ? "selected" : "") %>
                    >예약번호</option>
                    <option value="start">예약일자</option>
                    <option value="bnoStart">번호&일자</option>
                </select>
            </div>
            <div class="col-md-6">
                <input type="text" class="form-control" name="keyword"
                       value='<%=kw%>'>
            </div>
            <div class="col-md-2">
                <button type="submit" class="btn btn-success">조회</button>
            </div>
        </form>
    </div>
    <!-- 검색창 끝-->


</div>