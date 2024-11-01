
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<h3>글 작성(boardAddForm.jsp)</h3>

<% String msg = (String) request.getAttribute("msg");%>
<% String logId = (String) session.getAttribute("logId");%>
<%if(msg != null){ %>
<p class="text-danger"><%=msg %></p>
<% }%>

<form class="form-control" action="addBoard.do" method="post" enctype="multipart/form-data">

  <table class="table">
    <tr>
      <th>제목</th>
      <td><input class="form-control" type="text" name="title" /></td>
    </tr>
    <tr>
      <th>내용</th>
      <td><textarea rows="4" cols="30" name="content"
                    class="form-control"></textarea></td>
    </tr>
    <tr>
      <th>작성자</th>
      <td><input readonly class="form-control" type="text" name="writer" value="<%=logId%>"/></td>
    </tr>
    <tr>
      <th>image</th>
      <td><input class="form-control" type="file" name="image"></td>
    </tr>
    <tr>
      <td colspan="2" align="center">
        <input class="btn btn-success" type="submit" value="저장" />
        <input class="btn btn-warning" type="submit" value="취소" />
      </td>
    </tr>

  </table>
</form>