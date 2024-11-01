<%@page import="com.intheforest.vo.MyBookVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<meta charset="UTF-8">

<%
List<MyBookVO> list = (List<MyBookVO>) request.getAttribute("myPageBookList");

%>

<title>마이페이지</title>
<span style="font-size:20px">예약목록 조회</span>

<button type="button" class="btn btn-outline-secondary" value="Submit" style="float:right">
<a href="book/상세페이지.do?bookNo=">회원정보 수정</a></button>

<table class="table table-hover">
  <thead>
    <tr>
      <th scope="col">예약번호</th>
      <th scope="col">숙소종류</th>
      <th scope="col">예약인원</th>
      <th scope="col">이용기간</th>
      <th scope="col">금액</th>
      <th scope="col">등록일</th>
      <th scope="col">상태</th>
    </tr>
  </thead>
  <tbody>
  <%
  for (MyBookVO bvo : list){
  %>
    <tr>
      <th scope="row"><%=bvo.getBookNo() %></th>
      <td><%=bvo.getSiteName() %></td>
      <td><%=bvo.getMemCnt() %></td>
      <td><%=bvo.getStartDate() %> ~ <%=bvo.getEndDate() %></td>
      <td><%=bvo.getTotalPrice() %></td>
      <td><%=bvo.getCreateDate() %></td>
      <td><%=bvo.getCancelFlag() %></td>
    </tr>
    
    <%} %>
    
  </tbody>
</table>

<script>
let btn = document.querySelector('button');
</script>