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
    <c:if test="${msg == 'confirm'}">
    		<h4 class="text-center text-success mb-4">예약이 완료되었습니다.</h4>
    </c:if>
    
    <div class="card">
        <div class="card-header">
            <table class="table table-borderless text-center">
                <tr>
                    <td>시설명</td>
                    <td>예약기간</td>
                    <td>결제금액</td>
                    <td>상태</td>
                </tr>
                <tr>
                    <td class="fs-4 fw-bolder">${book.siteName}</td>
                    <td class="fs-4 fw-bolder text-success">${book.startDate} ~ ${book.endDate}</td>
                    <td class="fs-4 fw-bolder"><fmt:formatNumber value="${book.totalPrice}" pattern="#,###" />원</td>
                    <td class="fs-4 fw-bolder ${book.cancelFlag == 0 ? 'text-mint' : 'text-danger'}">${book.cancelFlag == 0 ? '확정' : '예약취소'}</td>
                </tr>
            </table>
        </div>
		<div class="card-body">
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
                    <input type="text" name="carNum" class="form-control w-50" value="${book.carNum == null ? '없음' : book.carNum}" readonly>
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

        <h5 class="fw-bolder ms-4">옵션 내역</h4>

        <div class="row g-3 m-3 mb-4">
            <c:forEach var="option" items="${optionList}">
                <div class="input-group w-50">
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
		
		<div class="text-center m-4">
      <button type="button" class="btn btn-secondary" id="backBtn">목록</button>
      <button type="button" class="btn btn-success" id="funcBtn" data-bs-toggle="modal" data-bs-target="#exampleModal">예약취소</button>
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
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">아니오</button>
                    <button type="button" class="btn btn-success" id="modalDeleteBtn">예</button>
                </div>
            </div>
        </div>
    </div>
    
    
</div>

<script>
	//목록 버튼 클릭 시 페이지 이동 이벤트
	let backBtn = document.getElementById('backBtn');
	backBtn.addEventListener('click', moveBack);
	
	function moveBack(e){
		if(${permission == 'admin'}){
			location.href = 'myPageBookList.do';
		} else {
			location.href = 'myPageBookList.do?memberId=${member.memberId}';
		}
	}
	
	//funcBtn 상태에 따라 다르게 표시
	let funcBtn = document.getElementById('funcBtn');
	let endDate = new Date(`${book.endDate}`);
	let startDate = new Date(`${book.startDate}`);
	let today = new Date();
	
	if(${permission == user} && endDate < today && ${isReview == false}){ //이용기간이 지났으며 후기를 작성하지 않은 사용자에게는, 후기작성 버튼을 표시
	  funcBtn.removeAttribute('data-bs-toggle');
	  funcBtn.removeAttribute('data-bs-target');
	  funcBtn.innerText = '후기작성';
	  funcBtn.addEventListener('click', (e) => {location.href = 'addBoardForm.do?category=review&bookNo=aaaaaaa'});
	} else if(${book.cancelFlag == 1} || startDate <= today || ${isReview == true}){ //이미 취소했거나 이용기간 중에 있거나 후기를 작성한 예약건에는 아무것도 표시 안 함.
	  funcBtn.style.display = 'none';	
	}

	//모달에서 '예' 클릭 시 삭제페이지로 이동
  let modalDeleteBtn = document.getElementById('modalDeleteBtn')
  modalDeleteBtn.addEventListener('click', () => {
      location.href = `cancelBook.do?bookNo=${book.bookNo}`;
  });
    
</script>