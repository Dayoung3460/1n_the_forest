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
	
		<form action="optionManagement.do" method="post">
		
		    <div class="bottom me-4 text-end">
		        <button type="submit" class="btn btn-lg btn-success">적용</button>
		    </div>
		    
		    <table class="table align-middle text-center mt-4 fs-5">
		        <thead>
		        <tr class="table-light">
		            <th>번호</th>
		            <th>옵션명</th>
		            <th>가격</th>
		        </tr>
		        </thead>
		        
		        <tbody>
		        <c:forEach var="i" begin="0" end="${options.size() - 1}"> <!-- List 타입이므로 size()로 길이 반환 -->
		            <tr>
		                <td class="w-25"><input type="hidden" name="opt[${i}].optionNo">${options[i].optionNo}</td>
		                <td class="w-50">${options[i].optionName}</td>
		                <td class="d-flex justify-content-center"><input type="text" name="opt[${i}].price" 
		                	value="${options[i].optionPrice}" class="form-control text-end w-75 fs-5"></td>
		            </tr>
		        </c:forEach>
		        </tbody>
		    </table>
		    
		</form>

</div>

<script>
	
		//천단위 입력값 , 표시
		let inputs = document.querySelectorAll('td input');
		
		document.addEventListener('DOMContentLoaded', (e) => {
			
			for(let i = 0; i < inputs.length; i++){
					inputs[i].value = numberFormating(inputs[i].value); //로드된 값에 , 표시해서 보여줌
				
			    inputs[i].addEventListener('keydown', (e) => { //입력하기 위한 조작 시 , 제거
			        e.target.value = removeComma(e.target.value);
			    });
			    inputs[i].addEventListener('focusout', (e) => { //조작을 했으나 값이 변하지 않았을 시 , 표시
			        e.target.value = numberFormating(removeComma(e.target.value));
			    });
			    inputs[i].addEventListener('change', (e) => { //입력 완료(값이 변했을) 시 , 표시
			        e.target.value = numberFormating(e.target.value);
			    });
			}
			
		});
		
		// , 제거
		function removeComma(str){
		    str = str.replaceAll(',', '');
		    return str;
		}
		
		// , 추가
		function numberFormating(str){
		    str = Number(str);
		    str = str.toLocaleString('ko-KR');
		    return str;  
		}

</script>