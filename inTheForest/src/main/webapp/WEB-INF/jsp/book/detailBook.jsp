<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.intheforest.vo.BookVO"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.*"%>

<div class="container">

    <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
        <ol class="breadcrumb" style="margin-top:20px">
          <li class="breadcrumb-item"><a href="main.do">Home</a></li>
          <li class="breadcrumb-item"><a href="#"></a>예약관리</li>
          <li class="breadcrumb-item active" aria-current="page">상세내역</li>
        </ol>
    </nav>
  
    <h4 class="mt-4 fw-bolder">예약 상세내역</h4>
  
    <form action="bookApp.do" method="POST" autocomplete="off">
        <table class="table table-bordered text-center">
            <thead class="">
                <th>날짜</th>
                <th>사이트명</th>
                <th>금액</th>
            </thead>
            <tbody>
                <td>aa</td>
                <td>aa</td>
                <td>100,000원</td>
            </tbody>
        </table>

        <div class="card text-center mb-3">
            <div class="card-header">
                <div class="row g-0">
                    <div class="col-md-4 mb-1 fw-bolder">날짜</div>
                    <div class="col-md-4 mb-1 fw-bolder">사이트명</div>
                    <div class="col-md-4 mb-1 fw-bolder">금액</div>
                </div>

            </div>
            <div class="card-body">
                <div class="row g-0">
                    <div class="col-md-4 mb-1">날짜</div>
                    <div class="col-md-4 mb-1">사이트명</div>
                </div>
            </div>
        </div>
            
        <div class="mb-3 row">
            <label for="exampleFormControlInput1" class="col-sm-2 col-form-label">예약인원</label>
            <div class="col-sm-10">
                <select name="memCnt" class="form-select w-25" disabled>
                    <c:forEach var="i" begin="1" end="${bookvo.siteMax}">
                        <option value="${i}" selected>${i}인</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        
        <div class="mb-3 row">
            <label for="exampleFormControlInput1" class="col-sm-2 col-form-label">예약자명</label>
            <div class="col-sm-10">
                <input type="text" name="name" class="form-control w-50">
            </div>
        </div>
        
        <div class="mb-3 row">
            <label for="exampleFormControlInput1" class="col-sm-2 col-form-label">차량번호</label>
            <div class="col-sm-10">
                <input type="text" name="carNum" class="form-control w-50">
            </div>
        </div>
        
        <div class="mb-3 row">
            <label for="exampleFormControlInput1" class="col-sm-2 col-form-label">연락처</label>
            <div class="col-sm-10">
                <input type="text" name="tel" maxlength="13" class="form-control w-50" oninput="autoHyphen(this)">
            </div>
        </div>
        
        <div class="mb-3 row">
            <label for="exampleFormControlInput1" class="col-sm-2 col-form-label">주소</label>
            <div class="col-sm-10">
                <input type="text" name="address" class="form-control w-50">
            </div>
        </div>
        
        <div class="mb-3 row">
            <label for="exampleFormControlInput1" class="col-sm-2 col-form-label">이메일</label>
            <div class="col-sm-10">
                <input type="text" name="email" class="form-control w-50">
            </div>
        </div>

        <div class="mb-3 row">
            <span class="col-sm-2 fw-bolder text-mint fs-4">결제금액</span>
            <span class="col-sm-10 fw-bolder text-success fs-4">100,000원</span>
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