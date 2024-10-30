<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<div class="p-3">
    <h3>글 목록</h3>
    <form class="row g-3 mt-2 mb-4" action="boardList.do" method="get">
        <div class="col-md-4">
            <select name="searchCondition" class="form-select">
                <option value=""
                ${search.searchCondition.equals("") ? "selected" : ""}>선택하세요</option>
                <option value="title"
                ${ search.searchCondition.equals("title") ? "selected" : "" }>제목</option>
                <option value="writer"
                ${ search.searchCondition.equals("writer") ? "selected" : "" }>작성자</option>
                <option value="titleAndWriter"
                ${ search.searchCondition.equals("titleAndWriter") ? "selected" : "" }>제목
                    & 작성자</option>
            </select>
        </div>
        <div class="col-md-2">
            <input type="text" class="form-control" name="keyword"
                   value="${ search.keyword }">
        </div>
        <div class="col-md-2">
            <button type="submit" class="btn btn-primary">조회</button>
        </div>

    </form>


    <table class="table">
        <thead>
        <tr>
            <th>글번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일자</th>
            <th>조회수</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="board" items="${ boardList }">
            <tr>
                <td>${board.boardNo}</td>
                <td><a
                        href="board.do?bno=${board.boardNo}&currentPage=${search.currentPage}&searchCondition=${search.searchCondition}&keyword=${search.keyword}">
                        ${board.title} </a></td>
                <td><c:out value="${board.writer}" /></td>
                <td>
                    <fmt:formatDate value="${board.writeDate}" pattern="yyyy-MM-dd HH:mm:ss" />
                </td>
                <td><c:out value="${board.viewCnt}" /></td>
            </tr>
        </c:forEach>
        <c:if test="${fn:length(boardList) == 0}">
            <tr>
                <td align="center" colspan="5">no data</td>
            </tr>
        </c:if>
        </tbody>

    </table>

    <nav aria-label="Page navigation example">
        <ul class="pagination justify-content-center">

            <c:choose>
                <c:when test="${ paging.prev }">
                    <li class="page-item"><a class="page-link"
                                             href="boardList.do?currentPage=${ paging.startPage - 1 }&searchCondition=${ search.searchCondition }&keyword=${ search.keyword }">Previous</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="page-item disabled"><a class="page-link">Previous</a>
                    </li>
                </c:otherwise>
            </c:choose>

            <c:forEach var="p" begin="${ paging.startPage }"
                       end="${ paging.endPage }" step="1">
                <c:choose>
                    <c:when test="${ paging.currentPage == p }">
                        <li class="page-item active" aria-current="page"><a
                                class="page-link"
                                href="boardList.do?currentPage=${ p }&searchCondition=${ search.searchCondition }&keyword=${ search.keyword }">${ p }</a></li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item"><a class="page-link"
                                                 href="boardList.do?currentPage=${ p }&searchCondition=${ search.searchCondition }&keyword=${ search.keyword }">${ p }</a></li>

                    </c:otherwise>
                </c:choose>

            </c:forEach>


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
            </c:choose>

        </ul>
    </nav>
</div>