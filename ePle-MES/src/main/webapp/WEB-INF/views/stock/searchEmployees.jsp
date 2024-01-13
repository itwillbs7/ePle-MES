<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<%@ include file="../include/head.jsp"%>
<style>
  .table th,
  .table td {
    text-align: center;
  }
.con:hover{
	background-color : #e1e1e1;
	cursor:pointer;
}
</style>
<title>사원 조회</title>

<!-- 모든 사원 출력합니다 -->
<!-- /material/askOrderAdd 에서 참조중 -->
<!-- /material/askOrderEdit에서 참조중 -->
<!-- /material/orderList   에서 참조중 -->

</head>
<body>
	<div class="modal-content">
	<div class="login-box bg-white box-shadow border-radius-10">
			
			<div class="login-title">
			<h2 class="text-center" style="color: #FF8C00;">사원 조회</h2>
			</div>
			
			<!------------------------------- 검색 시작 ------------------------------->
			<div class="search_area">
				<div class="row">
					<div class="col-sm-12 mb-3">
						
						<div class="form-group">
							<label>사원코드</label> 
							<input class="form-control" type="text" name="searchCode" id="selectA">
						</div>
						
						<div class="form-group">
							<label>사원명</label> 
							<input class="form-control" type="text" name="searchName" id="selectB">
						</div>
							<input class="form-control" type="hidden" id="selectC">

						<div class="row">
							<div class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
								<button type="submit" class="btn btn-success" onclick="doSearch()" ><b>조회</b></button>
							</div>
						</div>
						
					</div>
				</div>
			</div>


			<!------------------------------- 목록 시작 ------------------------------->
			<table class="table table-striped" id="tableId">
			<thead>
				<tr>
					<th>사원코드</th>
					<th>사원명</th>
					<th>연락처</th>
				</tr>
			</thead>
			
			<tbody>
				<c:forEach items="${searchEmployees}" var="vo">
				<tr onclick="selectWork('${vo.code }','${vo.name }','${vo.phone }')">
					<td class="con">${vo.code }</td>
					<td class="con">${vo.name }</td>
					<td class="con">${vo.phone }</td>
				</tr>
				</c:forEach>
			</tbody>
			</table>
			
			
		    <!------------------------------ 페이징 시작 ------------------------------>
							<div class="btn-toolbar justify-content-center mb-15">
							<c:if test="${pageVO.totalCount > 1}">
								<div class="btn-group">
									<c:if test="${pageVO.prev}">
										<a href="/stock/searchEmployees?page=${pageVO.startPage - 1}" class="btn btn-outline-primary prev"> 
											<i class="fa fa-angle-double-left"></i>
										</a>
									</c:if>
									<c:forEach begin="${pageVO.startPage}" end="${pageVO.endPage}" var="i" step="1">
										<a href="/stock/searchEmployees?page=${i}" class="btn btn-outline-primary ${pageVO.cri.page == i ? 'active' : ''}">
											${i} </a>
									</c:forEach>
									<c:if test="${pageVO.next}">
										<a href="/stock/searchEmployees?page=${pageVO.endPage + 1}" class="btn btn-outline-primary next"> 
											<i class="fa fa-angle-double-right"></i>
										</a>
									</c:if>
								</div>
							</c:if>
							</div>

			<script type="text/javascript">
				function selectWork(a, b, c) { // 부모창으로 값 넘기기

					opener.document.getElementById("selectA").value = a
					opener.document.getElementById("selectB").value = b
					opener.document.getElementById("selectC").value = c
					window.close();
				}
				
				
				
				
		 		//검색하기
		  		function doSearch() {
				        var query = {"searchCode" : $("#selectA").val(), "searchName" : $("#selectB").val()};
				        
				        console.log("searchCode:", query.searchCode);
				        console.log("searchName:", query.searchName);
				        
				        $.ajax({
				            url : "${pageContext.request.contextPath}/stock/searchEmployees",
				            type : "get",
				            data : query,
				            dataType : "text",
				            success : function(data){
				                 if (query.searchCode == "" && query.searchName == "") {
				                    location.href = "${pageContext.request.contextPath}/stock/searchEmployees";
				                } else {
				                    location.href = "${pageContext.request.contextPath}/stock/searchEmployees?searchCode=" + $("#selectA").val() + "&searchName=" + $("#selectB").val();
				                } 
				                 
//				                if (data) {
//				                    alert("완료");
//				                } else {
//				                    alert("전송된 값 없음");
//				                }
				                
				            },
				            

				        });
				    
				} 
		 		
		 		
		 		
		 		
		  		document.addEventListener('keydown', function (event) {
		  	        if (event.key === 'Enter') {
		  	            doSearch();
		  	            event.preventDefault(); 
		  	        }
		  	    });
		  		
		  		
		  		
		  		
			</script>
		</div>
	</div>
	
	
	
	
	
	
	<!-- 콘텐츠 끝> -->
	<%@ include file="../include/footer.jsp"%>
	
</body>
</html>