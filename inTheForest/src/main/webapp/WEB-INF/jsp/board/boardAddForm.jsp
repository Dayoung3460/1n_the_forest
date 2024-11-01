<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<% String msg = (String) request.getAttribute("msg");%>
<% String memberId = (String) session.getAttribute("memberId");%>
<% String category = (String) request.getAttribute("category");%>

<div class="boardAddForm">
    <c:choose>
        <c:when test="${category == 'qna'}">
            <h3>문의하기</h3>
            <p>궁금하신 사항을 자유롭게 질문해주세요</p>
        </c:when>
        <c:when test="${category == 'review'}">
            <h3>후기 작성</h3>
            <p>캠핑장 사용 후기를 남겨주세요</p>
        </c:when>
        <c:when test="${category == 'notice'}">
            <h3>공지사항</h3>
            <p>중요한 소식이나 안내를 작성해 주세요</p>
        </c:when>
        <c:when test="${category == 'reply'}">
            <h3>문의 답글</h3>
            <p>문의에 답글을 남겨 주세요</p>
        </c:when>
    </c:choose>



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
                    <input readonly class="form-control" type="text" name="writer"
                           value="<%=memberId == null ? "로그인 필요" : memberId%>"/>
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
        </table>
        <div class="bottom">
            <c:if test="${member.permission != 'admin'}">
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" name="secretFlag" id="defaultCheck1">
                    <label class="form-check-label" for="defaultCheck1">
                        비밀글
                    </label>
                </div>
                <table class="table">
                    <tr>
                        <td class="label-cell">비밀번호</td>
                        <td class="password-cell">
                            <input type="password" class="password-input" name="boardPw" maxlength="4" placeholder="숫자 4자리" oninput="this.value = this.value.replace(/[^0-9]/g, '');" title="숫자 4자리를 입력하세요">
                        </td>
                    </tr>
                </table>
            </c:if>
            <c:if test="${member.permission == 'admin'}">
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" name="noticeFlag" id="defaultCheck2">
                    <label class="form-check-label" for="defaultCheck2">
                        중요 공지
                    </label>
                </div>
            </c:if>

            <div class="btns">
                <c:choose>
                    <c:when test="${memberId == null}">
                        <input class="btn btn-secondary" value="저장"/>
                    </c:when>
                    <c:otherwise>
                        <input class="btn btn-success" type="submit" value="등록하기"/>
                    </c:otherwise>
                </c:choose>
                <a href="#" onclick="history.back(); return false;">
                    <input class="btn btn-secondary" type="text" value="목록"/>
                </a>
            </div>

        </div>

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
