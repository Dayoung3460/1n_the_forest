<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<div class="container">

    <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
        <ol class="breadcrumb" style="margin-top:20px">
          <li class="breadcrumb-item"><a href="main.do">Home</a></li>
          <li class="breadcrumb-item"><a href="#"></a>예약관리</li>
          <li class="breadcrumb-item active" aria-current="page">상세내역</li>
        </ol>
    </nav>
  
    <h4 class="mt-4 fw-bolder mb-4">예약 상세내역</h4>
    
    <form action="bookApp.do" method="POST" autocomplete="off">
        <div class="card text-center mb-4">
            <div class="card-header">
              ${book.startDate} ~ ${book.endDate}
            </div>
            <div class="card-body">
              <h5 class="card-title">${book.siteName}</h5>
              <p class="card-text fw-bolder text-success">
              	<fmt:formatNumber value="${book.totalPrice}" pattern="#,###" />
              </p>
            </div>
        </div>
        
        <p class="fs-5">1. 예약자 정보</p>		
        <div class="mb-3 row">
            <label for="exampleFormControlInput1" class="col-sm-2 col-form-label">예약인원</label>
            <div class="col-sm-10">
                <select name="memCnt" class="form-select w-25" disabled>
                	<c:forEach var="i" begin="1" end="${book.siteMax}">
						<option value="${i}" selected>${i}인</option>
					</c:forEach>
                    <option value="${book.memCnt}" selected>${book.memCnt}인</option>
                </select>
            </div>
        </div>
        
        <div class="mb-3 row">
            <label for="exampleFormControlInput1" class="col-sm-2 col-form-label">예약자명</label>
            <div class="col-sm-10 col-md-5">
                <input type="text" name="name" class="form-control w-100" value="${member.memberName}" disabled>
            </div>
        </div>
        
        <div class="mb-3 row">
            <label for="exampleFormControlInput1" class="col-sm-2 col-form-label">차량번호</label>
            <div class="col-sm-10 col-md-5">
                <input type="text" name="carNum" class="form-control" value="${book.carNum}" disabled>
            </div>
        </div>
        
        <div class="mb-3 row">
            <label for="exampleFormControlInput1" class="col-sm-2 col-form-label">연락처</label>
            <div class="col-sm-10 col-md-5">
                <input type="text" name="tel" maxlength="13" class="form-control w-100" value="${member.tel}" disabled>
            </div>
        </div>
        
        <div class="mb-3 row">
            <label for="exampleFormControlInput1" class="col-sm-2 col-form-label">주소</label>
            <div class="col-sm-10 col-md-5">
                <input type="text" name="address" class="form-control w-100" value="${member.address}" disabled>
            </div>
        </div>
        
        <div class="mb-3 row">
            <label for="exampleFormControlInput1" class="col-sm-2 col-form-label">이메일</label>
            <div class="col-sm-10 col-md-5">
                <input type="text" name="email" class="form-control w-100" value="${member.email}" disabled>
            </div>
        </div>
        
      	<div class="addform">		
			<p class="fs-5">2. 옵션 선택</p>				
			<div class="row g-3">
				<div class="col-md-6">
					<c:forEach var="option" items="${optionList}">
						<div class="input-group mb-3">
						  <div class="input-group-text">
						    <input class="form-check-input mt-0" type="checkbox" value="${option.optionNo}" 
						    	aria-label="Checkbox for following text input" name="option[]">
						  </div>
						  <input type="hidden" id="optionPrice_${option.optionNo}" value="${option.optionPrice}">
						  <input type="text" class="form-control" aria-label="Text input with checkbox" 
						  	value="${option.optionName} (<fmt:formatNumber value="${option.optionPrice}" pattern="#,###" />원)" readonly onclick="">
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
            
        <div class="text-center m-4">
            <button type="button" class="btn btn-outline-success">이전</button>
            <button type="button" class="btn btn-success" id="editBtn">수정</button>
            <button type="button" class="btn btn-secondary" id="deleteBtn" data-bs-toggle="modal" data-bs-target="#exampleModal">삭제</button>
        </div>
    </form>

    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">삭제하기</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    해당 내역을 삭제하시겠습니까?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" data-bs-dismiss="modal">닫기</button>
                    <button type="button" class="btn btn-secondary" id="modalDeleteBtn">삭제</button>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    let modalDeleteBtn = document.getElementById('modalDeleteBtn')
    modalDeleteBtn.addEventListener('click', () => {
        location.href = 'boardList.do?bno=${board.boardNo}&currentPage=${search.currentPage}&searchCondition=${search.searchCondition}&keyword=${search.keyword}&category=${category}';
    });

    let editBtn = document.getElementById('editBtn')
    editBtn.addEventListener('click', (e) => {
        e.preventDefault()
        location.href = 'modifyBook.do?bookNo=${book.bookNo}&memberId=${member.memberId}&siteNo=${book.siteNo}';
    });
</script>