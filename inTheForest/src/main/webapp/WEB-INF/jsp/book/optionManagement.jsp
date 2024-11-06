<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<style>
    .container table {
        margin-bottom: 100px;
    }
</style>

<div class="container">

    <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
        <ol class="breadcrumb" style="margin-top:20px">
            <li class="breadcrumb-item"><a href="/inTheForest/main.do">Home</a></li>
            <li class="breadcrumb-item active" aria-current="page">예약옵션</li>
        </ol>
    </nav>
    
    <h4 class="mt-4 fw-bolder">예약옵션 관리</h4>
			
    <div class="text-end">
				<h5 id="msgBox" class="text-center"></h5>
        <button type="button" id="submitBtn" class="btn btn-lg btn-success">적용</button>
    </div>
   
    <table class="table align-middle text-center mt-4 fs-5">
        <thead>
		        <tr class="table-light">
		        		<th>순번</th>
		            <th>옵션코드</th>
		            <th>옵션명</th>
		            <th>가격</th>
		        </tr>
        </thead>
        
        <tbody>
        <c:forEach var="i" begin="0" end="${options.size()-1}" step="1">
            <tr>
            		<td>${i+1}</td>
                <td class="w-25">${options[i].optionNo}</td>
                <td class="w-50">${options[i].optionName}</td>
                <td class="d-flex justify-content-center">
                	<input type="text" name="price" value="${options[i].optionPrice}" class="form-control text-end w-75 fs-5">
               	</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

</div>

<script src="js/book/optionManagement.js"></script>