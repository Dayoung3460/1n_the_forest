<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="container">

    <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
        <ol class="breadcrumb" style="margin-top:20px">
            <li class="breadcrumb-item"><a href="/inTheForest/main.do">Home</a></li>
            <li class="breadcrumb-item active" aria-current="page">회원관리</li>
        </ol>
    </nav>
    
    <h4 class="mt-4 fw-bolder">회원목록</h4>
    
    <table class="table align-middle text-center mb-5">
    
        <thead>
        <tr class="table-light">
            <th>아이디</th>
            <th>이름</th>
            <th>주소</th>
            <th>이메일</th>
            <th>연락처</th>
            <th>가입일</th>
            <th>권한</th>
            <th></th>
        </tr>
        </thead>
        
        <tbody>
        		<c:forEach var="member" items="${ memberList }">
		            <tr>
		                <td>${ member.memberId }</td>
		                <td>${ member.memberName }</td>
		                <td class="w-25">${ member.address }</td>
		                <td>${ member.email }</td>
		                <td>${ member.tel }</td>
		                <td><fmt:formatDate value="${ member.joinedDate }" pattern="yyyy/MM/dd" /></td>
		                <td>${ member.permission }</td>
		                <td>
		                    <button type="button" class="btn btn-outline-success btn-sm fw-bolder m-1" onclick="location.href = 'DetailJoin.do?memberId=${ member.memberId }'">상세정보</button>
		                </td>
		            </tr>
        		</c:forEach>
        </tbody>
    
    </table>
    
    <nav aria-label="Page navigation example">
    		<ul class="pagination justify-content-center">

         <c:choose>
             <c:when test="${ paging.prev }">
                 <li class="page-item">
                 		<a class="page-link" href="memberList.do?currentPage=${ paging.startPage - 1 }&searchCondition=${ search.searchCondition }&keyword=${ search.keyword }">Previous</a>
                 </li>
             </c:when>
             <c:otherwise>
                 <li class="page-item disabled">
                 		<a class="page-link">Previous</a>
                 </li>
             </c:otherwise>
         </c:choose>

         <c:forEach var="p" begin="${ paging.startPage }"
                    end="${ paging.endPage }" step="1">
             <c:choose>
                 <c:when test="${ paging.currentPage == p }">
                     <li class="page-item active" aria-current="page">
                     		<a class="page-link" href="memberList.do?currentPage=${ p }&searchCondition=${ search.searchCondition }&keyword=${ search.keyword }">${ p }</a>
                     </li>
                 </c:when>
                 <c:otherwise>
                     <li class="page-item">
                     		<a class="page-link" href="memberList.do?currentPage=${ p }&searchCondition=${ search.searchCondition }&keyword=${ search.keyword }">${ p }</a>
                     </li>
                 </c:otherwise>
             </c:choose>
         </c:forEach>

         <c:choose>
             <c:when test="${ paging.next }">
                 <li class="page-item">
                 		<a class="page-link" href="memberList.do?currentPage=${ paging.endPage + 1 }&searchCondition=${ search.searchCondition }&keyword=${ search.keyword }">Next</a>
                 </li>
             </c:when>
             <c:otherwise>
                 <li class="page-item disabled">
                 		<a class="page-link">Next</a>
             		 </li>
             </c:otherwise>
         </c:choose>

     		</ul>
 		</nav>
 		
    <div class="bottom m-4">
        <form class="row justify-content-center gap-2" action="memberList.do" method="get">
            <div class="col-md-2">
                <select name="searchCondition" class="form-select">
                    <option value=""
                    ${search.searchCondition == "" ? "selected" : ""}>선택하세요
                    </option>
                    <option value="id"
                    ${ search.searchCondition == "id" ? "selected" : "" }>아이디
                    </option>
                    <option value="name"
                    ${ search.searchCondition == "name" ? "selected" : "" }>이름
                    </option>
                    <option value="address"
                    ${ search.searchCondition == "address" ? "selected" : "" }>주소
                    </option>
                    <option value="email"
                    ${ search.searchCondition == "email" ? "selected" : "" }>이메일
                    </option>
                    <option value="tel"
                    ${ search.searchCondition == "tel" ? "selected" : "" }>연락처
                    </option>
                    <option value="joinDate"
                    ${ search.searchCondition == "joinDate" ? "selected" : "" }>가입일
                    </option>
                    <option value="permission"
                    ${ search.searchCondition == "permission" ? "selected" : "" }>권한
                    </option>
                </select>
            </div>
            <div class="col-md-3">
            		<c:choose>
            				
            				<c:when test="${ search.searchCondition == 'permission'}">
	            				<!-- 권한으로 검색했을 경우, option 박스로 표시 -->
            					<select class="form-select" name="keyword">
                        <option value="admin">admin</option>
                        <option value="user"
                         ${ search.keyword.equals("user") ? "selected" : "" }>user</option>
                    	</select>
            				</c:when>
            				
            				<c:otherwise>
            					<!-- 권한 외에는 일반 text 박스로 키워드 표시 -->
			                <input type="text" class="form-control" name="keyword"
			                    value="${ search.keyword }">
            				</c:otherwise>
            				
            		</c:choose>
            </div>
            <div class="col-md-2">
                <button type="submit" class="btn btn-success">조회</button>
            </div>
        </form>
    </div>

</div>

<script>
    //검색조건을 권한으로 선택했을 경우, user와 admin 중 선택하도록 표시
    let selectBox = document.querySelector('select');
		console.log('${paging}');
    selectBox.addEventListener('change', (e) => {
        let optionVal = e.target.value;
				let keywordBox = e.target.parentElement.nextSibling.nextSibling;
        
        if(optionVal == 'permission'){
            let tag = '<select class="form-select" name="keyword">'
                    + '    <option value="admin">admin</option>' 
                    + '    <option value="user">user</option>'
                    + '</select>';
            keywordBox.innerHTML = tag;
        } else {
        		let tag = '<input type="text" class="form-control" name="keyword"'
                    + `value="${ search.keyword }">`;
        		keywordBox.innerHTML = tag;
        }
    });
</script>