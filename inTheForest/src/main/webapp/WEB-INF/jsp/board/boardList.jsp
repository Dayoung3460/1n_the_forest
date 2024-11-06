<%@ page import="com.intheforest.vo.BoardVO" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div class="p-3 boardList container">
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
    </c:choose>
    <table class="table">
        <thead>
        <tr>
            <th>글번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>조회수</th>
            <th>작성일자</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="board" items="${ boardList }">
            <tr>
                <c:choose>
                    <c:when test="${board.noticeFlag eq '0'}">
                        <td>${board.boardNo}</td>
                    </c:when>
                    <c:otherwise>
                        <td><span class="redLabel">공지</span></td>
                    </c:otherwise>

                </c:choose>

                <td class="title">
                    <a data-board-no="${board.boardNo}"
                       data-secret-flag="${board.secretFlag}" data-board-pw="${board.boardPw}" data-board-category="${board.boardCategory}">${board.title}</a>
                    <c:if test="${board.secretFlag == 1}">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                             class="bi bi-lock-fill" viewBox="0 0 16 16">
                            <path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2m3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2"/>
                        </svg>
                    </c:if>
                </td>
                <c:if test="${board.writer ne null}">
                    <td>${board.writer}</td>
                </c:if>
                <c:if test="${board.writer eq null}">
                    <td>-</td>
                </c:if>
                <td><c:out value="${board.viewCnt}"/></td>
                <td>${board.writeDate}</td>
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
                                             href="boardList.do?currentPage=${ paging.startPage - 1 }&searchCondition=${ search.searchCondition }&keyword=${ search.keyword }&category=${ search.category }">Previous</a>
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
                                href="boardList.do?currentPage=${ p }&searchCondition=${ search.searchCondition }&keyword=${ search.keyword }&category=${ search.category }">${ p }</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item"><a class="page-link"
                                                 href="boardList.do?currentPage=${ p }&searchCondition=${ search.searchCondition }&keyword=${ search.keyword }&category=${ search.category }">${ p }</a>
                        </li>

                    </c:otherwise>
                </c:choose>

            </c:forEach>


            <c:choose>
                <c:when test="${ paging.next }">
                    <li class="page-item"><a class="page-link"
                                             href="boardList.do?currentPage=${ paging.endPage + 1 }&searchCondition=${ search.searchCondition }&keyword=${ search.keyword }&category=${ search.category }">Next</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="page-item disabled"><a class="page-link">Next</a></li>
                    </li>
                </c:otherwise>
            </c:choose>

        </ul>
    </nav>
    <div class="bottom m-4 ">
        <form class="row g-3" action="boardList.do" method="get">
            <div class="col-md-4">
                <select name="searchCondition" class="form-select">
                    <option value=""
                    ${search.searchCondition.equals("") ? "selected" : ""}>선택하세요
                    </option>
                    <option value="title"
                    ${ search.searchCondition.equals("title") ? "selected" : "" }>제목
                    </option>
                    <option value="writer"
                    ${ search.searchCondition.equals("writer") ? "selected" : "" }>작성자
                    </option>
                    <option value="titleAndWriter"
                    ${ search.searchCondition.equals("titleAndWriter") ? "selected" : "" }>제목
                        & 작성자
                    </option>
                </select>
            </div>
            <div class="col-md-6">
                <input type="text" class="form-control" name="keyword"
                       value="${ search.keyword }">
            </div>
            <div class="col-md-2">
                <button type="submit" class="btn btn-success">조회</button>
            </div>
        </form>
        <c:if test="${(category eq 'notice' && member.permission eq 'admin') || (category eq 'qna') || ((category eq 'review') && (bookNoListSize > 0))}">
            <button type="submit" class="btn btn-success mx-lg-4 write">
                <a href="addBoardForm.do?category=${ search.category }">글쓰기</a>
            </button>
        </c:if>


    </div>

    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <%--                    <h1 class="modal-title fs-5" id="exampleModalLabel">삭제하기</h1>--%>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="mb-3">
                            <label for="board-pw" class="col-form-label">글 비밀번호</label>
                            <input type="password" class="form-control" id="board-pw" maxlength="4"
                                   placeholder="숫자 4자리"
                                   oninput="this.value = this.value.replace(/[^0-9]/g, '');"
                                   title="숫자 4자리를 입력하세요"/>
                        </div>
                        <p class="fs-6 text-danger hide wrongPw">글 비밀번호가 틀렸습니다.</p>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                    <button type="button" class="btn btn-danger" id="okBtn">확인</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    let boardPw = 0
    let boardNo = 0
    let inputBoardPw = document.getElementById('board-pw')
    let wrongPw = document.getElementsByClassName('wrongPw')[0]

    let title = document.querySelectorAll('.title')

    title.forEach((item) => {
        let category = item.getElementsByTagName('a')[0].getAttribute('data-board-category')
        if(category === 'reply') {
            item.getElementsByTagName('a')[0].classList.add('reply')
        }

        item.addEventListener('click', (e) => {
            boardNo = e.currentTarget.getElementsByTagName('a')[0].getAttribute('data-board-no')
            let secretFlag = e.currentTarget.getElementsByTagName('a')[0].getAttribute('data-secret-flag')
            boardPw = e.currentTarget.getElementsByTagName('a')[0].getAttribute('data-board-pw')

            if (Number(secretFlag) == 1) {
                e.currentTarget.setAttribute('data-bs-toggle', 'modal')
                e.currentTarget.setAttribute('data-bs-target', '#exampleModal')
                inputBoardPw.value = ''
                wrongPw.classList.add('hide')
                wrongPw.classList.remove('show')
                e.currentTarget.click()
            } else {
                location.href = 'board.do?bno=' + boardNo + '&currentPage=${search.currentPage}&searchCondition=${search.searchCondition}&keyword=${search.keyword}&category=${search.category}'
            }
        })
    })

    let okBtn = document.getElementById('okBtn')
    okBtn.addEventListener('click', (e) => {
        wrongPw.classList.add('hide')
        wrongPw.classList.remove('show')

        if (inputBoardPw.value === boardPw) {

            let closeBtn = document.getElementsByClassName('btn-close')[0]
            closeBtn.click()

            setTimeout(() => {
                location.href = 'board.do?bno=' + boardNo + '&currentPage=${search.currentPage}&searchCondition=${search.searchCondition}&keyword=${search.keyword}&category=${search.category}'
            }, 200)

        } else {
            let wrongPw = document.getElementsByClassName('wrongPw')[0]
            wrongPw.classList.add('show')
            wrongPw.classList.remove('hide')
        }
    })
</script>