<%@ page import="com.intheforest.vo.BoardVO" %>
<%@ page import="com.intheforest.common.SearchDTO" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    BoardVO board = (BoardVO) request.getAttribute("board");
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String wdate = sdf.format(board.getWriteDate());
%>
<div class="board">
    <h3>문의하기</h3>
    <p>궁금하신 사항을 자유롭게 질문해주세요</p>
    <hr/>
    <div>
        <div class="top">
            <span>${board.title}</span>
            <span>작성자: ${board.writer}</span>
            <span><%=wdate%></span>
        </div>
        <hr/>
        <div class="content">
            <p>${board.content}</p>
        </div>
        <hr/>
        <div class="btnContainer">
            <div class="btnBox1">
                <button class="btn btn-secondary">이전글</button>
                <button class="btn btn-secondary">다음글</button>
                <button class="btn btn-success">답글쓰기</button>
            </div>
            <div class="btnBox2">
                <button class="btn btn-secondary">수정</button>
                <button class="btn btn-secondary">삭제</button>
                <button class="btn btn-success">목록</button>
            </div>
        </div>
    </div>

    <%--<table class="table">--%>
    <%--    <%--%>
    <%--        BoardVO board = (BoardVO) request.getAttribute("board");--%>
    <%--        SearchDTO search = (SearchDTO) request.getAttribute("search");--%>
    <%--        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");--%>
    <%--        String wdate = sdf.format(board.getWriteDate());--%>
    <%--    %>--%>
    <%--    <tr>--%>
    <%--        <th>조회수</th>--%>
    <%--        <td>${board.viewCnt }</td>--%>
    <%--    </tr>--%>
    <%--    <tr>--%>
    <%--        <th>제목</th>--%>
    <%--        <td colspan="3">${board.title }</td>--%>
    <%--    </tr>--%>
    <%--    <tr>--%>
    <%--        <th>내용</th>--%>
    <%--        <td colspan="3"><textarea readonly rows="4" cols="30"--%>
    <%--                                  class="form-control"><%=board.getContent()%></textarea></td>--%>
    <%--    </tr>--%>

    <%--    <c:if test="${ board.boardFile != null }">--%>
    <%--        <tr>--%>
    <%--            <th>image</th>--%>
    <%--            <td><img src="image/${ board.boardFile }"></td>--%>

    <%--        </tr>--%>
    <%--    </c:if>--%>
    <%--    <tr>--%>
    <%--        <th>작성자</th>--%>
    <%--        <td colspan="3"><%=board.getWriter()%></td>--%>
    <%--    </tr>--%>
    <%--    <tr>--%>
    <%--        <th>작성일시</th>--%>
    <%--        <td colspan="3"><%=wdate%></td>--%>
    <%--    </tr>--%>
    <%--</table>--%>
    <%--<div align="center">--%>

    <%--    <%--%>
    <%--        String logIn = (String) session.getAttribute("memberId");--%>
    <%--    %>--%>
    <%--    <%--%>
    <%--        if (board.getWriter().equals(logIn)) {--%>
    <%--    %>--%>
    <%--    <button type="submit" class="btn btn-success modifyBtn">수정</button>--%>

    <%--    <a><button type="submit" class="btn btn-danger deleteBtn">삭제</button></a>--%>

    <%--    <%--%>
    <%--        }--%>
    <%--    %>--%>

    <%--</div>--%>
</div>

<script>
    <%--let bno = "${board.boardNo}"--%>
    <%--let memberId = "${memberId}"--%>


    <%--document.querySelector('.modifyBtn')?.addEventListener('click', (e) => {--%>
    <%--    // get method--%>
    <%--    location.href = 'modifyBoard.do?bno=<%=board.getBoardNo()%>&currentPage=<%=search.getCurrentPage()%>&searchCondition=<%=search.getSearchCondition()%>&keyword=<%=search.getKeyword()%>';--%>
    <%--})--%>

    <%--document.querySelector('.deleteBtn')?.addEventListener('click', (e) => {--%>
    <%--    location.href = 'deleteBoard.do?bno=<%=board.getBoardNo()%>&currentPage=<%=search.getCurrentPage()%>&searchCondition=<%=search.getSearchCondition()%>&keyword=<%=search.getKeyword()%>';--%>
    <%--})--%>


</script>
<%--<script src="js/jquery-3.7.1.js"></script>--%>
<%--<script src="js/replyService.js"></script>--%>
<%--<!--<script src="js/reply.js"></script>-->--%>
<%--<script src="js/jreply.js"></script>--%>