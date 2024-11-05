<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<link href="css/book/book.css" rel="stylesheet">

<div class="container reservation">

    <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
        <ol class="breadcrumb" style="margin-top:20px">
          <li class="breadcrumb-item"><a href="main.do">Home</a></li>
          <c:choose>
	          <c:when test="${permission == 'admin'}">
		          <li class="breadcrumb-item"><a href="myPageBookList.do">예약관리</a></li>
		          <li class="breadcrumb-item active" aria-current="page">상세내역</li>
	          </c:when>
	          <c:otherwise>
	          	<li class="breadcrumb-item"><a href="myPageBookList.do?memberId=${member.memberId}">마이페이지</a></li>
		          <li class="breadcrumb-item active" aria-current="page">예약확인</li>
	          </c:otherwise>
          </c:choose>
        </ol>
    </nav>
  
    <h4 class="mt-4 fw-bolder mb-4">예약 상세내역</h4>
					
		<div class="addform">
		
			<p class="h4">1. 예약자 정보</p>		
			
			<div class="mb-3 row">
			  <label for="exampleFormControlInput1" class="col-sm-2 col-form-label">예약인원</label>
		  	<div class="col-sm-10">
           <input type="text" name="name" class="form-control w-50" value="${book.memCnt}인" readonly>
        </div>
			</div>
			
			<div class="mb-3 row">
			  <label for="exampleFormControlInput1" class="col-sm-2 col-form-label">예약자명</label>
			  <div class="col-sm-10">
			  	<input type="text" name="name" class="form-control w-50" value="${member.memberName}" readonly>
			  </div>
			</div>
			
			<div class="mb-3 row">
			  <label for="exampleFormControlInput1" class="col-sm-2 col-form-label">차량번호</label>
			  <div class="col-sm-10">
			  	<input type="text" name="carNum" class="form-control w-50" value="${book.carNum}" readonly>
			  </div>
			</div>
			
			<div class="mb-3 row">
			  <label for="exampleFormControlInput1" class="col-sm-2 col-form-label">연락처</label>
			  <div class="col-sm-10">
			  	<input type="text" name="tel" maxlength="13" class="form-control w-50" oninput="autoHyphen(this)" value="${member.tel}" readonly>
			  </div>
			</div>
			
			<div class="mb-3 row">
			  <label for="exampleFormControlInput1" class="col-sm-2 col-form-label">이메일</label>
			  <div class="col-sm-10">
			  	<input type="text" name="email" class="form-control w-50" value="${member.email}" readonly>
			  </div>
			</div>
		</div>
		
		<div class="addform">		
			<p class="h4">2. 옵션 선택</p>				
			<div class="row g-3">
				<div class="col-md-6">
					<c:forEach var="option" items="${optionList}">
						<div class="input-group mb-3">
						  <div class="input-group-text">
						    <input class="form-check-input mt-0" type="checkbox" value="${option.optionNo}" 
						    	aria-label="Checkbox for following text input" name="option[]"
						    	<c:if test="${myOptions.indexOf(option.optionNo) != -1}">checked</c:if> disabled>
						  </div>
						  <input type="text" class="form-control" aria-label="Text input with checkbox" 
						  	value="${option.optionName} (<fmt:formatNumber value="${option.optionPrice}" pattern="#,###" />원)" readonly onclick="">
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
			
			
		<div class="faci-pay">
			<div class="left">
				<p class="tit">${book.siteName}</p>
				<p class="date">${book.startDate} ~ ${book.endDate}</p>
				<p class="txt">※ 해당 예약에 대한 결제는 현장결제로 진행됩니다.<br> ※ 추가 문의사항은 053-133-1333로 문의부탁드립니다.</p>
			</div>
			<div class="right">
				<div class="sum">
					<p class="tit">결제예정금액</p>
					<p class="txt">
						총 <span id="totalPrice"><fmt:formatNumber value="${book.totalPrice}" pattern="#,###" /></span> 원
					</p>
				</div>
			</div>
		</div>
		
		<div class="text-center m-4">
      <button type="button" class="btn btn-outline-success" id="backBtn">목록</button>
      <button type="button" class="btn btn-secondary" id="deleteBtn" data-bs-toggle="modal" data-bs-target="#exampleModal">예약취소</button>
    </div>
    
    
    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">예약취소</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    예약을 취소하시겠습니까?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-success" data-bs-dismiss="modal">아니오</button>
                    <button type="button" class="btn btn-secondary" id="modalDeleteBtn">예</button>
                </div>
            </div>
        </div>
    </div>
    
    
</div>

<script>
		let backBtn = document.getElementById('backBtn');
		backBtn.addEventListener('click', moveBack);
		
		function moveBack(e){
			if(${permission == 'admin'}){
				location.href = 'myPageBookList.do';
			} else {
				location.href = 'myPageBookList.do?memberId=${member.memberId}';
			}
		}

    let modalDeleteBtn = document.getElementById('modalDeleteBtn')
    modalDeleteBtn.addEventListener('click', () => {
        location.href = 'boardList.do?bno=${board.boardNo}&currentPage=${search.currentPage}&searchCondition=${search.searchCondition}&keyword=${search.keyword}&category=${category}';
    });
</script>