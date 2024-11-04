<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.intheforest.vo.BoardVO" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    BoardVO board = (BoardVO) request.getAttribute("board");
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String wdate = sdf.format(board.getWriteDate());
    String category = (String) request.getAttribute("category");
%>
<div class="board">
    <c:choose>
        <c:when test="${category eq 'qna'}">
            <h3>문의하기</h3>
            <p>궁금하신 사항을 자유롭게 질문해주세요</p>
        </c:when>
        <c:when test="${category eq 'review'}">
            <h3>후기 작성</h3>
            <p>캠핑장 사용 후기를 남겨주세요</p>
        </c:when>
        <c:when test="${category eq 'notice'}">
            <h3>공지사항</h3>
            <p>중요한 소식이나 안내를 작성해 주세요</p>
        </c:when>
        <c:otherwise>
            <h3>문의 답글</h3>
            <p>문의에 답글을 남겨 주세요</p>
        </c:otherwise>
    </c:choose>
    <hr/>
    <form>
        <div class="top">
            <span>${board.title}</span>
            <span>작성자: ${board.writer}</span>
            <span><%=wdate%></span>
        </div>
        <hr/>
        <div class="content">
            <p>${board.content}</p>
            <br/>
            <c:if test="${ board.boardFile != null }">
                <img src="image/${ board.boardFile }">
            </c:if>
        </div>
        <hr/>



        <div class="btnContainer">
            <div class="btnBox1">
                <button class="btn btn-secondary">이전글</button>
                <button class="btn btn-secondary">다음글</button>
                <c:if test="${member.permission eq 'admin'}">
                    <button class="btn btn-success">답글쓰기</button>
                </c:if>

            </div>
            <div class="btnBox2">
                <c:if test="${memberId eq board.writer}">
                    <button class="btn btn-primary" id="editBtn">수정</button>
                    <button type="button" class="btn btn-danger" id="deleteBtn" data-bs-toggle="modal" data-bs-target="#exampleModal">삭제</button>
                </c:if>
                <button class="btn btn-success">목록</button>
            </div>
        </div>
    </form>

    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">삭제하기</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    해당 게시글을 삭제하시겠습니까?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                    <button type="button" class="btn btn-danger" id="modalDeleteBtn">삭제</button>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    let modalDeleteBtn = document.getElementById('modalDeleteBtn')
    modalDeleteBtn.addEventListener('click', () => {
        location.href = 'boardList.do?bno=${board.boardNo}&currentPage=${search.currentPage}&searchCondition=${search.searchCondition}&keyword=${search.keyword}&category=${category}';
    })

    let editBtn = document.getElementById('editBtn')
    editBtn.addEventListener('click', (e) => {
        e.preventDefault()
        location.href = 'modifyBoard.do?bno=${board.boardNo}&currentPage=${search.currentPage}&searchCondition=${search.searchCondition}&keyword=${search.keyword}&category=${category}';
    })

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