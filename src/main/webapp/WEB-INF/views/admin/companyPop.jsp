<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>      
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../resources/css/admin/companyPop.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>
	<div class="subject_name_warp">
			<span>회사 선택</span>
		</div>
		<div class="content_wrap">
               	<!-- 게시물 표 영역 -->
				<div class="company_table_wrap">
               		<!-- 게시물 O -->
               		<c:if test="${listCheck != 'empty'}">
               			<div class="table_exist">
	                    	<table class="company_table">
	                    		<thead>
	                    			<tr>
	                    				<td class="th_column_1">회사 번호</td>
	                    				<td class="th_column_2">회사 이름</td>
	                    				<td class="th_column_3">회사 국가</td>
	                    			</tr>
	                    		</thead>
	                    		<c:forEach items="${list}" var="list">
									  <tr>
									    <td>
									      <c:out value="${list.companyId}"></c:out>
									    </td>
									    <td>
									      <a class="move" href='<c:out value="${list.companyId}"/>' data-name='<c:out value="${list.companyName}"/>'>
		                    			<c:out value="${list.companyName}"></c:out>
		                    			</a>
		                    			
									    </td>
									    <td>
									      <c:out value="${list.nationName}"></c:out>
									    </td>
									  </tr>
									</c:forEach>
	                    	</table>
                    	</div>                			
               		</c:if>
               		<!-- 게시물 x -->
               		<c:if test="${listCheck == 'empty'}">
               			<div class="table_empty">
               				등록된 회사가 없습니다.
               			</div>
               		</c:if>
               		
                    <!-- 검색 영역 -->
                    <div class="search_wrap">
                    	<form id="searchForm" action="/admin/companyPop" method="get">
                    		<div class="search_input">
                    			<input type="text" name="keyword" value='<c:out value="${pageMaker.cri.keyword}"></c:out>'>
                    			<input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum }"></c:out>'>
                    			<input type="hidden" name="amount" value='${pageMaker.cri.amount}'>
                    			<button class='btn search_btn'>검 색</button>
                    		</div>
                    	</form>
                    </div>
                    
                    <!-- 페이지 이동 인터페이스 영역 -->
                    <div class="pageMaker_wrap" >
                    
	                    <ul class="pageMaker">
	                    
	                    	<!-- 이전 버튼 -->
	                    	<c:if test="${pageMaker.prev}">
	                    		<li class="pageMaker_btn prev">
	                    			<a href="${pageMaker.pageStart - 1}">이전</a>
	                    		</li>
	                    	</c:if>
	                    	
	                    	<!-- 페이지 번호 -->
	                    	<c:forEach begin="${pageMaker.pageStart}" end="${pageMaker.pageEnd}" var="num">
	                    		<li class="pageMaker_btn ${pageMaker.cri.pageNum == num ? "active":""}">
	                    			<a href="${num}">${num}</a>
	                    		</li>
	                    	</c:forEach>
	                    	
	                    	<!-- 다음 버튼 -->
	                    	<c:if test="${pageMaker.next}">
	                    		<li class="pageMaker_btn next">
	                    			<a href="${pageMaker.pageEnd + 1 }">다음</a>
	                    		</li>
	                    	</c:if>
	                    	
	                    </ul>
	                    
                    </div>               		
               		
					<form id="moveForm" action="/admin/companyPop" method="get">
						<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
						<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
						<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
					</form>               		
               		
               		
		</div>

	</div>
<script>

		let searchForm = $('#searchForm');
		let moveForm = $('#moveForm');
		
		/* 작거 검색 버튼 동작 */
		$("#searchForm button").on("click", function(e){
			
			e.preventDefault();
			
			/* 검색 키워드 유효성 검사 */
			if(!searchForm.find("input[name='keyword']").val()){
				alert("키워드를 입력하십시오");
				return false;
			}
			
			searchForm.find("input[name='pageNum']").val("1");
			
			searchForm.submit();
			
		});
		
		
		/* 페이지 이동 버튼 */
		$(".pageMaker_btn a").on("click", function(e){
			
			e.preventDefault();
			
			console.log($(this).attr("href"));
			
			moveForm.find("input[name='pageNum']").val($(this).attr("href"));
			
			moveForm.submit();
			
		});	

			$(".move").on("click", function(e){
			
			e.preventDefault();
			
			let companyId = $(this).attr("href");
			let companyName= $(this).data("name");
			$(opener.document).find("#companyId_input").val(companyId);
			$(opener.document).find("#companyName_input").val(companyName);
			
			window.close();

		});	
	</script>
</body>
</html>