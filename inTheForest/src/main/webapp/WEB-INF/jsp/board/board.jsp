<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.intheforest.vo.BoardVO" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="board container">
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
            <p>중요한 소식이나 안내사항을 전합니다</p>
        </c:when>
    </c:choose>
    <hr/>
    <div>
        <div class="top">
            <span>
                ${board.title}
                <c:if test="${board.boardCategory eq 'qna' && isReply.boardNo != null}">
                    <span class="label">문의 - 답글 완료</span>
                </c:if>
                <c:if test="${board.boardCategory eq 'qna' && isReply.boardNo == null}">
                    <span class="label bg-secondary">문의 - 답글 대기중</span>
                </c:if>
            <c:if test="${board.boardCategory eq 'reply'}">
                <span class="label">답글</span>
            </c:if>

            </span>
            <span>작성자: ${board.writer}</span>
            <span>${board.writeDate}</span>
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

        <div class="mb-4 hide" id="replyBox">
            <textarea rows="4" cols="30" id="replyContent" name="replyContent" placeholder="답글을 입력해주세요"
                      class="form-control"></textarea>
        </div>


        <div class="btnContainer">
            <div class="btnBox1">
                <button class="btn btn-secondary me-2" id="prevBtn" >이전글</button>
                <button class="btn btn-secondary me-2" id="nextBtn" >다음글</button>
                <c:if test="${board.boardCategory eq 'qna' && member.permission eq 'admin' && isReply.boardNo == null}">
                    <button class="btn btn-success" id="replyWriteBtn">답글쓰기</button>
                    <button class="btn btn-success hide" id="replyRegisterBtn">답글 등록</button>
                </c:if>


            </div>
            <div class="btnBox2">
                <c:if test="${memberId eq board.writer}">
                    <button class="btn btn-outline-success" id="editBtn">수정</button>
                    <button type="button" class="btn btn-outline-danger" id="deleteBtn" data-bs-toggle="modal"
                            data-bs-target="#exampleModal">삭제
                    </button>
                </c:if>
                <button class="btn btn-success" id="goListBtn">목록</button>
            </div>
        </div>
    </div>

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

    <!-- Modal -->
    <div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel2" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header alert">
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body modalBody">
                    이전글이 없습니다.
                </div>
            </div>
        </div>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="exampleModal3" tabindex="-1" aria-labelledby="exampleModalLabel3" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header alert">
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body modalBody">
                    다음글이 없습니다.
                </div>
            </div>
        </div>
    </div>
</div>
<script src="js/board/board.js"></script>
<script>


    let replyWriteBtn = document.getElementById('replyWriteBtn')
    let replyRegisterBtn = document.getElementById('replyRegisterBtn')
    let replyBox = document.getElementById('replyBox')

    replyWriteBtn?.addEventListener('click', (e) => {
        replyBox.classList.toggle('hide')
        replyBox.getElementsByTagName('textarea')[0].focus()

        replyRegisterBtn.classList.toggle('hide')
        replyWriteBtn.classList.toggle('hide')
    })

    replyRegisterBtn?.addEventListener('click', function (e) {
        const formData = new FormData(); // 현재 form 데이터 수집

        formData.append('title', '└ [RE] : ' + "${board.title}");
        formData.append('boardNo', "${board.boardNo}");
        formData.append('content', document.getElementById('replyContent').value);
        formData.append('writer', "${memberId}");
        formData.append('secretFlag', "${board.secretFlag}");
        formData.append('boardPw', "${board.boardPw}");

        fetch(`addReply.do?category=reply&boardNo=${board.boardNo}`, {
            method: 'POST',
            body: formData,
        })
            .then((response) => response.text())
            .then((result) => {
                location.href = result
            })
            .catch((err) => {
                console.log(err);
            });
    })

    let modalDeleteBtn = document.getElementById('modalDeleteBtn')
    modalDeleteBtn.addEventListener('click', () => {
        location.href = 'boardList.do?bno=${board.boardNo}&isDelete=true&currentPage=${search.currentPage}&searchCondition=${search.searchCondition}&keyword=${search.keyword}&category=${category}';
    })


    let editBtn = document.getElementById('editBtn')
    console.log("editBtn", editBtn)
    editBtn?.addEventListener('click', (e) => {
        location.href = 'modifyBoard.do?bno=${board.boardNo}&memberPermission=${member.permission}&currentPage=${search.currentPage}&searchCondition=${search.searchCondition}&keyword=${search.keyword}&category=${category}';
    })

    let goListBtn = document.getElementById('goListBtn')
    goListBtn.addEventListener('click', (e) => {
        e.preventDefault()
        location.href = 'boardList.do?currentPage=${search.currentPage}&searchCondition=${search.searchCondition}&keyword=${search.keyword}&category=${category}'
    })

    let prevBtn = document.getElementById('prevBtn')
    prevBtn.addEventListener('mousedown', (e) => {
        getPrevBookNo("${board.writeDate}", "${category}", true, (result) => {
            if (result.result != null) {
                if(result.result.boardNo){
                    location.href = 'board.do?bno=' + result.result.boardNo + '&currentPage=${search.currentPage}&searchCondition=${search.searchCondition}&keyword=${search.keyword}&category=${search.category}';
                }
            } else {
                prevBtn.setAttribute('data-bs-toggle', 'modal')
                prevBtn.setAttribute('data-bs-target', '#exampleModal2')
            }
        });
    });


    let nextBtn = document.getElementById('nextBtn')
    nextBtn.addEventListener('mousedown', (e) => {
        getNextBookNo("${board.writeDate}", "${category}", false, (result) => {
            if (result.result != null) {
                if (result.result.boardNo) {
                    location.href = 'board.do?bno=' + result.result.boardNo + '&currentPage=${search.currentPage}&searchCondition=${search.searchCondition}&keyword=${search.keyword}&category=${search.category}';
                }
            }else {
                nextBtn.setAttribute('data-bs-toggle', 'modal')
                nextBtn.setAttribute('data-bs-target', '#exampleModal3')
            }
        });
    })
</script>