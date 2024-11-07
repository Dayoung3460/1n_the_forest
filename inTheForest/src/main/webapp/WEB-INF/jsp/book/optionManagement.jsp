<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<div class="container">

    <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
        <ol class="breadcrumb" style="margin-top:20px">
            <li class="breadcrumb-item"><a href="/inTheForest/main.do">Home</a></li>
            <li class="breadcrumb-item active" aria-current="page">예약옵션</li>
        </ol>
    </nav>
    
    <div class="d-flex justify-content-between align-items-end">
				<h4 class="mt-2 fw-bolder mb-4">예약옵션 관리</h4>
        <span id="msgBox" class="fs-5 mb-3"></span>
        <button type="button" id="submitBtn" class="btn btn-success mb-3">적용</button>
		</div>
   
   	<form autocomplete="off">
	    <table class="table align-middle text-center mb-5">
	        <thead>
			        <tr class="table-success">
			        		<th class="w-10">순번</th>
			            <th>옵션코드</th>
			            <th>옵션명</th>
			            <th>가격</th>
			        </tr>
	        </thead>
	        
	        <tbody>
	        <c:forEach var="i" begin="0" end="${options.size()-1}" step="1">
	            <tr>
	            		<td class="fw-bolder">${i+1}</td>
	                <td>${options[i].optionNo}</td>
	                <td>${options[i].optionName}</td>
	                <td class="d-flex justify-content-center">
	                	<input type="text" name="price" value="${options[i].optionPrice}" class="form-control text-end w-75">
	               	</td>
	            </tr>
	        </c:forEach>
	        </tbody>
	    </table>
   	</form>

</div>

<script src="js/book/optionManagement.js"></script>