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
    <form class="form-control" action="modifyBoard.do?&bno=${board.boardNo}" method="post" enctype="multipart/form-data">

        <input type="hidden" name="currentPage" value="<%=search.getCurrentPage() %>"/>
        <input type="hidden" name="searchCondition" value="<%=search.getSearchCondition() %>"/>
        <input type="hidden" name="keyword" value="<%=search.getKeyword() %>"/>
        <input type="hidden" name="category" value="<%=search.getCategory() %>"/>
        <table class="table">
            <tr class="align-middle">
                <th>제목</th>
                <td class="content-col"><input class="form-control" id="boardTitle" autofocus type="text" name="title"
                                               value="<%=board.getTitle()%>"/></td>
                <th>작성자</th>
                <td class="content-col">
                    <input readonly class="form-control" type="text" id="boardWriter" name="writer"
                           value="<%=board.getWriter()%>"/>
                </td>
            </tr>
            <tr class="content align-middle">
                <th>내용</th>
                <td colspan="3" class="content-col">
                    <textarea rows="4" cols="30" id="boardContent" name="content"
                              class="form-control"><%=board.getContent()%></textarea>
                </td>
            </tr>
            <c:if test="${ board.boardFile != null }">
                <tr class="align-middle">
                    <th>파일 첨부</th>
                    <td colspan="3" class="content-col file-input">
                        <div class="image-container">
                            <img src="image/${board.boardFile}" alt="Image">
                            <button type="button" class="delete-button">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-circle" viewBox="0 0 16 16">
                                    <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14m0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16"/>
                                    <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708"/>
                                </svg>
                            </button>
                        </div>
                        <input class="form-control hide" type="file" id="newBoardImg" name="image"/>
                    </td>
                </tr>
            </c:if>
            <c:if test="${ board.boardFile == null }">
                <tr class="align-middle">
                    <th>파일 첨부</th>
                    <td colspan="3" class="content-col file-input">
                        <input class="form-control" type="file" id="boardImg" name="image"/>
                    </td>
                </tr>
            </c:if>

        </table>
        <div class="bottom">
            <c:if test="${(memberPermission eq 'admin') && (category eq 'notice')}">
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" name="noticeFlag" id="noticeFlag">
                    <label class="form-check-label" for="noticeFlag">
                        중요 공지
                    </label>
                </div>
            </c:if>
            <div class="btns">


                <input class="btn btn-success" type="submit" value="수정완료"/>

                <a href="#" onclick="history.back(); return false;">
                    <input class="btn btn-secondary" type="text" value="취소"/>
                </a>
            </div>

        </div>
    </form>
</div>
<script>
    let deleteBtn = document.getElementsByClassName('delete-button')[0]

    let imageContainer = document.getElementsByClassName('image-container')[0]
    let newBoardImg = document.getElementById('newBoardImg')
    deleteBtn.addEventListener('click', (e) => {

        imageContainer.classList.toggle('hide')
        newBoardImg.classList.toggle('hide')
        newBoardImg.value = null
    })

    const form = document.getElementsByTagName('form')[0];
    form?.addEventListener('submit', function (e) {
        e.preventDefault(); // 실제 제출을 막고 데이터 확인

        const formData = new FormData(form);

        // FormData의 모든 키와 값을 확인하는 방법
        for (const [key, value] of formData.entries()) {
            console.log(`${key}: ${value}`);
        }

        // 데이터 확인 후 폼을 제출하려면
        form.submit();
    });

    let noticeFlag = document.getElementById('noticeFlag')
    if (${board.noticeFlag} === 1){
        if(noticeFlag) {
            noticeFlag.checked = true
        }
    }else{
        if(noticeFlag) {
            noticeFlag.checked = false
        }
    }
</script>

