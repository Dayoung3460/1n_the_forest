<%@ page import="com.intheforest.common.SearchDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  int bno = (Integer) request.getAttribute("bno");
  SearchDTO search = (SearchDTO) request.getAttribute("search");
%>
<h3><%=bno%>번 글을 삭제하시겠습니까?
</h3>

<button class="btn btn-warning deleteBtn">예</button>
<button class="btn btn-primary backBtn">아니요</button>

<script>
  document.querySelector('.deleteBtn').addEventListener('click', (e) => {
    location.href = 'deleteBoard.do?bno=<%=bno%>&confirm=yes&currentPage=<%=search.getCurrentPage()%>&searchCondition=<%=search.getSearchCondition()%>&keyword=<%=search.getKeyword()%>';
  })

  document.querySelector('.backBtn').addEventListener('click', (e) => {
    history.back();
  })
</script>