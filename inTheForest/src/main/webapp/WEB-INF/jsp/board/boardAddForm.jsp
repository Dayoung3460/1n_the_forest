<%@ page import="com.intheforest.vo.MemberVO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<% String msg = (String) request.getAttribute("msg");%>
<% String memberId = (String) session.getAttribute("memberId");%>
<% String category = (String) request.getAttribute("category");%>

<div class="boardAddForm">
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


    <%if (msg != null) { %>
    <p class="text-danger"><%=msg %>
    </p>
    <% }%>

    <form action="addBoard.do?category=<%=category%>" method="post" enctype="multipart/form-data">
        <table>
            <tr>
                <th>제목</th>
                <td class="content-col"><input class="form-control" id="boardTitle" autofocus type="text" name="title"/></td>
                <th>작성자</th>
                <td class="content-col">
                    <c:if test="${memberId == null}">
                        <input readonly class="form-control" type="text" id="boardWriter" value="로그인 안함"/>
                    </c:if>
                    <c:if test="${memberId != null}">
                        <input readonly class="form-control" type="text" id="boardWriter" name="writer"
                               value="<%=memberId%>"/>
                    </c:if>
                </td>
            </tr>
            <tr class="content">
                <th>내용</th>
                <td colspan="3" class="content-col">
                    <textarea rows="4" cols="30" id="boardContent" name="content" class="form-control"></textarea>
                </td>
            </tr>
            <tr>
                <th>파일 첨부</th>
                <td colspan="3" class="content-col file-input">
                    <input class="form-control" type="file" id="boardImg" name="image"/>
                </td>
            </tr>
        </table>
        <div class="bottom">
            <c:if test="${category eq 'qna'}">
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" name="secretFlag" id="defaultCheck1" value="true">
                    <label class="form-check-label" for="defaultCheck1">
                        비밀글
                    </label>
                </div>
                <table class="table">
                    <tr>
                        <td class="label-cell">비밀번호</td>
                        <td class="password-cell">
                            <input
                                    type="password"
                                    class="password-input"
                                    name="boardPw"
                                    id="boardPw"
                                    maxlength="4"
                                    placeholder="숫자 4자리"
                                    oninput="this.value = this.value.replace(/[^0-9]/g, '');"
                                    title="숫자 4자리를 입력하세요"
                            />
                        </td>
                    </tr>
                </table>
            </c:if>
            <c:if test="${(member.permission == 'admin') && (category eq 'notice')}">
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" name="noticeFlag" id="defaultCheck2">
                    <label class="form-check-label" for="defaultCheck2">
                        중요 공지
                    </label>
                </div>
            </c:if>

            <div class="btns">
                <input class="btn btn-success" type="submit" value="등록하기"/>
                <a href="#" onclick="history.back(); return false;">
                    <input class="btn btn-secondary" type="text" value="목록"/>
                </a>
            </div>
        </div>
    </form>

</div>
<script type="text/javascript">
    const formFail = (msg, e) => {
        alert(msg)
        e.preventDefault()
    }


    const form = document.getElementsByTagName('form')[0];
    form?.addEventListener('submit', function (e) {
        let title = document.getElementById('boardTitle').value// 필수
        let content = document.getElementById('boardContent').value// 필수
        let writer = document.getElementById('boardWriter').value// 필수
        let image = document.getElementById('boardImg').value
        let bookNoArr = "${bookNoList}";// 후기 일 때 필수
        let secretFlag = document.getElementById('defaultCheck1')?.checked
        let boardPw = document.getElementById('boardPw').value// 문의 일 때 필수
        let noticeFlag = document.getElementById('defaultCheck2')?.value

        if(!title || !content) {
            formFail('제목과 내용을 입력해주세요.', e)
        } else if(${category eq 'qna'} && secretFlag && !boardPw) {
            formFail('글 비밀번호를 입력해주세요.', e)
        } else if(${category eq 'review'} && !bookNoArr.length) {
            formFail('예약 내역이 있는 회원만 후기를 작성할 수 있습니다.', e)
        }
    });


</script>