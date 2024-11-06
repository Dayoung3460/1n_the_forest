<%@ page import="com.intheforest.vo.BoardVO" %>
<%@ page import="com.intheforest.common.SearchDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    BoardVO board = (BoardVO) request.getAttribute("board");
    SearchDTO search = (SearchDTO) request.getAttribute("search");
%>

<div class="boardModifyForm container">
    <h3>글 수정하기</h3>
    <p>수정할 내용을 입력하고 수정완료 버튼을 눌러주세요</p>
    <form class="form-control" action="modifyBoard.do?&bno=${board.boardNo}" method="post">
        <%--    <form class="form-control" action="modifyBoard.do?category=${category}&bno=${board.boardNo}&currentPage=${search.currentPage}&searchCondition=${search.searchCondition}&keyword=${search.keyword}" method="post">--%>
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
            <c:if test="${ board.boardFile != null }">
                <tr>
                    <th>파일 첨부56</th>
                    <td colspan="3" class="content-col file-input">

                            <%--          <input class="form-control" type="file" id="boardImg" name="image"/>--%>
                        <img src="image/${ board.boardFile }">
                            <%--                    <span aria-hidden="true">${board.boardFile}</span>--%>
                    </td>
                </tr>
            </c:if>

        </table>
        <div class="bottom">
            <c:if test="${(memberPermission eq 'admin') && (category eq 'notice')}">
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" name="noticeFlag" id="noticeFlag" value="${board.noticeFlag eq 1}">
                    <label class="form-check-label" for="noticeFlag">
                        중요 공지
                    </label>
                </div>
            </c:if>
            <div class="btns">
                <input name="currentPage" type="text" value="<%=search.getCurrentPage() %>" hidden="hidden"/>
                <input name="searchCondition" type="text" value="<%=search.getSearchCondition() %>" hidden="hidden"/>
                <input name="keyword" type="text" value="<%=search.getKeyword() %>" hidden="hidden"/>
                <input name="category" type="text" value="<%=search.getCategory() %>" hidden="hidden"/>

                <input class="btn btn-success" type="submit" value="수정완료"/>

                <a href="#" onclick="history.back(); return false;">
                    <input class="btn btn-secondary" type="text" value="취소"/>
                </a>
            </div>
        </div>


    </form>
</div>
<script>
    <%--let noticeFlag = document.getElementById('noticeFlag')--%>
    <%--console.log(${board.noticeFlag})--%>
    <%--console.log(typeof ${board.noticeFlag})--%>
    <%--if (${board.noticeFlag} === 1){--%>
    <%--    noticeFlag.checked = true--%>
    <%--}else{--%>
    <%--    noticeFlag.checked = false--%>
    <%--}--%>
</script>

