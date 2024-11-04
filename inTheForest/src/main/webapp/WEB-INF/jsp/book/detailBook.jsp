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
              <fmt:formatDate value="${book.startDate}" pattern="yyyy-MM-dd"></fmt:formatDate>~
              <fmt:formatDate value="${book.endDate}" pattern="yyyy-MM-dd"></fmt:formatDate>
            </div>
            <div class="card-body">
              <h5 class="card-title">${book.siteName}</h5>
              <p class="card-text fw-bolder text-success">${book.totalPrice}</p>
            </div>
        </div>
            
        <div class="mb-3 row">
            <label for="exampleFormControlInput1" class="col-sm-2 col-form-label">예약인원</label>
            <div class="col-sm-10">
                <select name="memCnt" class="form-select w-25" disabled>
                    <option value="${book.memCnt}" selected>${book.memCnt}인</option>
                </select>
            </div>
        </div>
        
        <div class="mb-3 row">
            <label for="exampleFormControlInput1" class="col-sm-2 col-form-label">예약자명</label>
            <div class="col-sm-10 col-md-5">
                <input type="text" name="name" class="form-control w-100" value="???" disabled>
            </div>
        </div>
        
        <div class="mb-3 row">
            <label for="exampleFormControlInput1" class="col-sm-2 col-form-label">차량번호</label>
            <div class="col-sm-10 col-md-5">
                <input type="text" name="carNum" class="form-control" value="book.carNum" disabled>
            </div>
        </div>
        
        <div class="mb-3 row">
            <label for="exampleFormControlInput1" class="col-sm-2 col-form-label">연락처</label>
            <div class="col-sm-10 col-md-5">
                <input type="text" name="tel" maxlength="13" class="form-control w-100" oninput="autoHyphen(this)">
            </div>
        </div>
        
        <div class="mb-3 row">
            <label for="exampleFormControlInput1" class="col-sm-2 col-form-label">주소</label>
            <div class="col-sm-10 col-md-5">
                <input type="text" name="address" class="form-control w-100">
            </div>
        </div>
        
        <div class="mb-3 row">
            <label for="exampleFormControlInput1" class="col-sm-2 col-form-label">이메일</label>
            <div class="col-sm-10 col-md-5">
                <input type="text" name="email" class="form-control w-100">
            </div>
        </div>
            
        <div class="text-center m-4">
            <button type="button" class="btn btn-outline-success">이전</button>
            <button type="button" class="btn btn-success" id="editBtn" onclick="location.href = 'modifyBook.do?bookNo=${bookNo}'">수정</button>
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
        location.href = 'modifyBoard.do?bno=${board.boardNo}&currentPage=${search.currentPage}&searchCondition=${search.searchCondition}&keyword=${search.keyword}&category=${category}';
    });
</script>