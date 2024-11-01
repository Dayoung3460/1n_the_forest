<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="boardAddForm">
    <h3>문의하기</h3>
    <p>궁금하신 사항을 자유롭게 질문해주세요</p>

    <% String msg = (String) request.getAttribute("msg");%>
    <% String memberId = (String) session.getAttribute("memberId");%>
    <% String category = (String) request.getAttribute("category");%>
    <%if (msg != null) { %>
    <p class="text-danger"><%=msg %>
    </p>
    <% }%>

    <form action="addBoard.do?category=<%=category%>" method="post" enctype="multipart/form-data">
        <table>
            <tr>
                <th>제목</th>
                <td class="content-col"><input class="form-control" autofocus type="text" name="title"/></td>
                <th>작성자</th>
                <td class="content-col">
                    <input readonly class="form-control" type="text" name="writer" value="<%=memberId == null ? "로그인 필요" : memberId%>"/>
                    <%--                    <input readonly class="form-control" type="text" name="writer" value="<%=memberId%>"/>--%>

                </td>
            </tr>
            <tr class="content">
                <th>내용</th>
                <td colspan="3" class="content-col">
                    <textarea rows="4" cols="30" name="content" class="form-control"></textarea>
                </td>
            </tr>
            <tr>
                <th>파일 첨부</th>
                <td colspan="3" class="content-col file-input">
                    <input class="form-control" type="file" name="image"/>
                </td>
            </tr>
            <tr>
                <td colspan="4" align="center" class="btns">
                    <input class="btn btn-success" type="submit" value="저장"/>
                    <input class="btn btn-secondary" type="submit" value="취소"/>
                </td>
            </tr>
        </table>

    </form>

    <%--    <table class="table">--%>
    <%--      <tr>--%>
    <%--        <th>제목</th>--%>
    <%--        <td><input class="form-control" type="text" name="title" /></td>--%>
    <%--      </tr>--%>
    <%--      <tr>--%>
    <%--        <th>내용</th>--%>
    <%--        <td><textarea rows="4" cols="30" name="content"--%>
    <%--                      class="form-control"></textarea></td>--%>
    <%--      </tr>--%>
    <%--      <tr>--%>
    <%--        <th>작성자</th>--%>
    <%--        <td><input readonly class="form-control" type="text" name="writer" value="<%=memberId%>"/></td>--%>
    <%--      </tr>--%>
    <%--      <tr>--%>
    <%--        <th>image</th>--%>
    <%--        <td><input class="form-control" type="file" name="image"></td>--%>
    <%--      </tr>--%>
    <%--      <tr>--%>
    <%--        <td colspan="2" align="center">--%>
    <%--          <input class="btn btn-success" type="submit" value="저장" />--%>
    <%--          <input class="btn btn-warning" type="submit" value="취소" />--%>
    <%--        </td>--%>
    <%--      </tr>--%>

    <%--    </table>--%>

</div>
