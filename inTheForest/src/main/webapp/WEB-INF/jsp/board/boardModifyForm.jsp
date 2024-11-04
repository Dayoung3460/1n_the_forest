<%@ page import="com.intheforest.vo.BoardVO" %>
<%@ page import="com.intheforest.common.SearchDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<h3>글 수정(boardModifyForm.jsp)</h3>

<%
  BoardVO board = (BoardVO) request.getAttribute("board");
  SearchDTO search = (SearchDTO) request.getAttribute("search");
%>

<div class="boardModifyForm">
  <h3>글 수정하기</h3>
  <p>수정할 내용을 입력하고 저장 버튼을 눌러주세요</p>

</div>

<form class="form-control" action="modifyBoard.do?category=${category}" method="post" enctype="multipart/form-data">
  <table class="table">

    <tr>
      <th>글번호</th>
      <td><input readonly class="form-control" type="number" name="bno"
                 value="<%=board.getBoardNo()%>" /></td>
    </tr>
    <tr>
      <th>조회수</th>
      <td><input readonly disabled class="form-control" type="text"
                 name="viewCnt" value="<%=board.getViewCnt()%>" /></td>
    </tr>
    <tr>
      <th>제목</th>
      <td><input class="form-control" type="text" name="title"
                 value="<%=board.getTitle()%>" /></td>
    </tr>
    <tr>
      <th>내용</th>
      <td><textarea rows="4" cols="30" name="content"
                    class="form-control"><%=board.getContent()%></textarea></td>
    </tr>
    <tr>
      <th>작성자</th>
      <td><input readonly disabled class="form-control" type="text" name="writer"
                 value="<%=board.getWriter()%>" /></td>
    </tr>
    <tr>
      <td colspan="2" align="center">
        <input class="btn btn-success"
               type="submit" value="저장" />
        <input name="currentPage" value="<%=search.getCurrentPage() %>" hidden="true"/>
        <input name="searchCondition" value="<%=search.getSearchCondition() %>" hidden="true"/>
        <input name="keyword" value="<%=search.getKeyword() %>" hidden="true"/>
        <input name="category" value="<%=search.getCategory() %>" hidden="true"/>
        <input class="btn btn-danger"
               type="submit" value="취소" />
      </td>
    </tr>
  </table>
</form>