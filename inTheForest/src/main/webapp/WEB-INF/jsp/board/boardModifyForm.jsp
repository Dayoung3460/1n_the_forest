<%@ page import="com.intheforest.vo.BoardVO" %>
<%@ page import="com.intheforest.common.SearchDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    BoardVO board = (BoardVO) request.getAttribute("board");
    SearchDTO search = (SearchDTO) request.getAttribute("search");
%>

<div class="boardModifyForm">
    <h3>글 수정하기</h3>
    <p>수정할 내용을 입력하고 수정완료 버튼을 눌러주세요</p>
    <form class="form-control" action="modifyBoard.do?category=${category}&bno=${board.boardNo}" method="post" enctype="multipart/form-data">
        <table class="table">
            <tr>
                <th>제목</th>
                <td class="content-col"><input class="form-control" id="boardTitle" autofocus type="text" name="title"
                                               value="<%=board.getTitle()%>"/></td>
                <th>작성자</th>
                <td class="content-col">
                    <input readonly class="form-control" type="text" id="boardWriter" name="writer"
                           value="<%=board.getWriter()%>"/>
                </td>
            </tr>
            <tr class="content">
                <th>내용</th>
                <td colspan="3" class="content-col">
                    <textarea rows="4" cols="30" id="boardContent" name="content"
                              class="form-control"><%=board.getContent()%></textarea>
                </td>
            </tr>

            <tr>
                <th>파일 첨부</th>
                <td colspan="3" class="content-col file-input">
                    <%--          <input class="form-control" type="file" id="boardImg" name="image"/>--%>
                    <c:if test="${ board.boardFile != null }">
                        <img src="image/${ board.boardFile }">
                    </c:if>
<%--                    <span aria-hidden="true">${board.boardFile}</span>--%>
                </td>
            </tr>
        </table>

        <div class="btns">
            <input class="btn btn-success" type="submit" value="수정완료"/>

            <input name="currentPage" value="<%=search.getCurrentPage() %>" hidden="hidden"/>
            <input name="searchCondition" value="<%=search.getSearchCondition() %>" hidden="hidden"/>
            <input name="keyword" value="<%=search.getKeyword() %>" hidden="hidden"/>
            <input name="category" value="<%=search.getCategory() %>" hidden="hidden"/>

            <a href="#" onclick="history.back(); return false;">
                <input class="btn btn-secondary" type="text" value="취소"/>
            </a>
        </div>
    </form>
</div>

