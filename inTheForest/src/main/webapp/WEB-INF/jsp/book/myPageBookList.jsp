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
    String permission = (String) session.getAttribute("permission");
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    PageDTO paging = (PageDTO) request.getAttribute("paging");
    System.out.println(paging);
    String sc = (String) request.getAttribute("searchCondition");
    String kw = (String) request.getAttribute("keyword");
    kw = (kw == null) ? "" : kw;
%>
<style>
    .myPageMinWidth{
        width: 22%;
    }

    .smallWidth{
        width: 5%;
    }

    .container{
        text-align:center;
    }
    table th:last-of-type{
        width: 100px;
    }
</style>




<div class="container">

	<nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
	    <ol class="breadcrumb" style="margin-top:20px">
	      <li class="breadcrumb-item"><a href="main.do">Home</a></li>
	      <c:choose>
	       <c:when test="${permission == 'admin'}">
	        <li class="breadcrumb-item active" aria-current="page">예약관리</li>
	       </c:when>
	       <c:otherwise>
	       	<li class="breadcrumb-item active" aria-current="page">마이페이지</li>
	       </c:otherwise>
	      </c:choose>
	    </ol>
	</nav>
	
	<div class="d-flex justify-content-between align-items-end">
		<h4 class="mt-2 fw-bolder mb-3">예약목록조회</h4>
		<c:if test="${permission != 'admin'}">
			<button type="button" class="btn btn-outline-success mb-3" value="Submit"
				style="float: right" onclick="location.href='DetailJoin.do?memberId=<%=memberId%>'">
				회원정보 수정
			</button>
		</c:if>
	</div>

	<div>
		
		<table class="table table-hover text-center">
			<thead>
				<tr class="align-middle">
					<th>순번</th>
					<th>예약번호</th>
					<th>예약자ID</th>
					<th>숙소종류</th>
					<th>예약인원</th>
					<th class="myPageMinWidth">이용기간</th>
					<th>금액</th>
					<th class="myPageMinWidth">등록일</th>
					<th>상태</th>
				</tr>
			</thead>
	        <tbody>
            <%
                int n = paging.getCurrentPage() * 10 - 10;
                for (MyBookVO bvo : list) {
                    n++;
            %>
	        <tr class="align-middle" onClick="location.href='detailBook.do?bookNo=<%=bvo.getBookNo()%>&memberId=<%=bvo.getMemberId()%>&siteNo=<%=bvo.getSiteNo()%>&currentPage=<%=paging.getCurrentPage()%>&searchCondition=<%=sc%>&keyword=<%=kw%>'">
              <th scope="row"><%=n%></th>
              <td><%=bvo.getBookNo()%></td>
              <td><%=bvo.getMemberId()%></td>
	            <td><%=bvo.getSiteName()%></td>
	            <td><%=bvo.getMemCnt()%>명</td>
	            <td><%=bvo.getStartDate()%> ~ <%=bvo.getEndDate()%></td>
		        	<td><fmt:formatNumber value="<%=bvo.getTotalPrice()%>" pattern="#,###" />원</td>
	            <td><%=bvo.getCreateDate().substring(0,16)%></td>
	            <%if(bvo.getCancelFlag()==0) { %>
	            <td><span class="btn btn-sm btn-success disabled">확정</span></td>
	            <%} else { %>
	            <td><span class="btn btn-sm btn-danger disabled">예약취소</span></td>
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
	                                                         href="myPageBookList.do?currentPage=<%=paging.getStartPage()-1 %>">Previous</a>
	         <%} else { %>
	            <li class="page-item disabled"><a class="page-link">Previous</a>
	         <%} %></li>
	
	            <!-- 페이지 출력 -->
	         <%
	            System.out.println("시작" + paging.getStartPage() + "마지막" + paging.getEndPage());
	            for(int p = paging.getStartPage(); p <= paging.getEndPage(); p++){
	            if(paging.getCurrentPage() == p){
			 %>
				<li class="page-item active" aria-current="page">
				<span class="page-link"><%=p %></span></li>
			<%} else { %>
				<li class="page-item"><a class="page-link"
					 href="myPageBookList.do?searchCondition=<%=sc %>&keyword=<%=kw %>&currentPage=<%=p %>">
			<%=p %></a></li>
			<% }}%>
	
	            <!-- 다음페이지 -->
	        <% if(paging.isNext()){ %>
	            <li class="page-item" aria-current="page">
	            <a class="page-link" href="myPageBookList.do?currentPage=<%=paging.getEndPage() + 1%>">
	            Next</a>
	        <%} else { %>
	            <li class="page-item disabled"><a class="page-link">Next</a>
	        <%} %>
	            </li>
	
	        </ul>
	
	
	    </nav>
	    <!-- 페이지 네이션 끝 -->
	
	    <!-- 검색창 -->
	    <div class="bottom m-4 ">
	        <form class="row justify-content-center gap-2" action="myPageBookList.do">
	            <div class="col-md-2">
	                <select name="searchCondition" class="form-select">
	                    <option selected value="">선택하세요.</option>
	                    <option value="bno"
	                    <%=(sc != null && sc.equals("bno") ? "selected" : "") %>
	                    >예약번호</option>
	                    <option value="start"
	                    <%=(sc != null && sc.equals("start") ? "selected" : "") %>
	                    >예약일자</option>
	                    <option value="bnoStart"
	                    <%=(sc != null && sc.equals("bnoStart") ? "selected" : "") %>
	                    >번호&일자</option>
	                </select>
	            </div>
	            <div class="col-md-3">
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
</div>	
