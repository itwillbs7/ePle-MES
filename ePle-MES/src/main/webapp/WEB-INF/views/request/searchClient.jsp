<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/head.jsp"%>
<title>수주 등록</title>
</head>
<body>
	<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10">
			<!-- 타이틀 -->
			<div class="login-title">
				<h1 class="text-center text-primary">수주업체 검색</h1>
			</div>
			<!-- 폼 -->
			<div class="search_area">
			<form method="post" id="accordion-search" action="/request/searchClient">
				<!-- 입력 구간 -->
				<div class="row">
					<div class="col-sm-12 mb-3">
						<!-- 필수입력내역 -->
						<div class="form-group">
							<label>업체코드</label> 
							<input class="form-control" type="text" placeholder="업체코드를 입력하세요" 
							name="client_code" id="client_code" >
						</div>
						<div class="form-group">
							<label>업체명</label> 
							<input class="form-control" type="text" placeholder="업체이름을 입력하세요" 
							name="clientName" id="clientName" >
						</div>
<!-- 정렬, asc, desc -->
										<input type="hidden" name="activeSortCategory" id="sortCategory" value="${pageVO.search.activeSortCategory}"> 
										<input type="hidden" name="sortValue" id="sortValue" value="${pageVO.search.sortValue}">

										<c:choose>
											<c:when test="${!empty pageVO.cri.page}">
												<input type="hidden" id="page" name="page" value="1">
											</c:when>
											<c:when test="${!empty pageVO.cri.page}">
												<input type="hidden" id="page" name="page" value="${pageVO.cri.page}">
											</c:when>
										</c:choose>

										<c:choose>
											<c:when test="${empty pageVO.cri.pageSize}">
												<input type="hidden" id="pageSize" name="pageSize" value="10">
											</c:when>
											<c:when test="${!empty pageVO.cri.pageSize}">
												<input type="hidden" id="pageSize" name="pageSize" value="${pageVO.cri.pageSize}">
											</c:when>
										</c:choose>
				<!-- 버튼 -->
				<div class="row">
					<div class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
						<button type="submit" class="btn btn-success" >
							<b>검색</b>
						</button>
					</div>
				</div>
					</div>
				</div>
				<!-- 버튼 -->
			</form>
			</div>
			<!-- 폼 -->
			
			
			<table class="table table-striped" id="tableId">
			<thead>
				<tr>
					<th>업체코드</th>
					<th>업체명</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${List}" var="List">
				<tr onclick="selectWork('${List.client_code }','${List.clientName }')">
					<th >${List.client_code }</th>
					<th >${List.clientName }</th>
				</tr>
				</c:forEach>
			</tbody>
			</table>
			<div class="btn-toolbar justify-content-center mb-15">
							<c:if test="${pageVO.totalCount > 1}">
									<div class="btn-group">
										<c:if test="${pageVO.prev}">
											<a href="javascript:pageMove(${pageVO.startPage - 1})" class="btn btn-outline-primary prev"> 
											<i class="fa fa-angle-double-left"></i>
											</a>
										</c:if>
										<c:forEach begin="${pageVO.startPage}" end="${pageVO.endPage}" var="i">
											<c:if test="${pageVO.cri.page == i}">
												<span class="btn btn-primary current">${i}</span>
											</c:if>
											<c:if test="${pageVO.cri.page != i}">
												<a href="javascript:pageMove(${i})" class="btn btn-outline-primary">${i}</a>
											</c:if>
										</c:forEach>
										<c:if test="${pageVO.next}">
											<a href="javascript:pageMove(${pageVO.endPage + 1})" class="btn btn-outline-primary next"> 
											<i class="fa fa-angle-double-right"></i>
											</a>
										</c:if>
									</div>
								</c:if>
							</div>
			
		</div>
	</div>
	<!-- 콘텐츠 끝> -->
	<%@ include file="../include/footer.jsp"%>
	
	 <script type="text/javascript">
			
	//부모창으로 데이터 넘기기
    function selectWork(a,b){ // 부모창으로 값 넘기기
		  
		if(opener.document.getElementById("searchCompany") != null){
    		opener.document.getElementById("client_code").value = a
    		opener.document.getElementById("searchCompany").value = b
    		opener.document.getElementById("client_code").dispatchEvent(new Event('input'));
    	    opener.document.getElementById("searchCompany").dispatchEvent(new Event('input'));
    		self.close();
			return;
		}

    		opener.document.getElementById("client_code").value = a
    		opener.document.getElementById("clientName").value = b
    		opener.document.getElementById("client_code").dispatchEvent(new Event('input'));
    	    opener.document.getElementById("clientName").dispatchEvent(new Event('input'));
    		self.close();
    	

      }
	
	
	</script> 
</body>
</html>