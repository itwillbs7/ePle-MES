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
<title>거래처 조회</title>

<!-- 전체 거래처 출력합니다 -->
<!-- /material/orderAdd 에서 참조중 -->

</head>
<body>
	<div class="modal-content">
	<div class="login-box bg-white box-shadow border-radius-10">
			
			<div class="login-title">
			<h2 class="text-center" style="color: #FF8C00;">거래처 조회</h2>
			</div>
			
			<!------------------------------- 검색 시작 ------------------------------->
			<div class="search_area">
				<div class="row">
					<div class="col-sm-12 mb-3">
						
							<input class="form-control" type="hidden" name="searchCode" id="selectD">
						
						<div class="form-group">
							<label>거래처명</label> 
							<input class="form-control" type="text" name="searchName" id="selectE">
						</div>

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
					<th>거래처코드</th>
					<th>거래처명</th>
				</tr>
			</thead>
			
			<tbody>
				<c:forEach items="${searchClient}" var="vo">
				<tr onclick="selectWork('${vo.code }','${vo.name }')">
					<td class="con">${vo.code }</td>
					<td class="con">${vo.name }</td>
				</tr>
				</c:forEach>
			</tbody>
			</table>
			
			
		    <!------------------------------ 페이징 시작 ------------------------------>
							<div class="btn-toolbar justify-content-center mb-15">
							<c:if test="${pageVO.totalCount > 1}">
								<div class="btn-group">
									<c:if test="${pageVO.prev}">
										<a href="/material/searchClient?page=${pageVO.startPage - 1}" class="btn btn-outline-primary prev"> 
											<i class="fa fa-angle-double-left"></i>
										</a>
									</c:if>
									<c:forEach begin="${pageVO.startPage}" end="${pageVO.endPage}" var="i" step="1">
										<a href="/material/searchClient?page=${i}" class="btn btn-outline-primary ${pageVO.cri.page == i ? 'active' : ''}">
											${i} </a>
									</c:forEach>
									<c:if test="${pageVO.next}">
										<a href="/material/searchClient?page=${pageVO.endPage + 1}" class="btn btn-outline-primary next"> 
											<i class="fa fa-angle-double-right"></i>
										</a>
									</c:if>
								</div>
							</c:if>
							</div>

			<script type="text/javascript">
				function selectWork(a, b) { // 부모창으로 값 넘기기

					opener.document.getElementById("selectD").value = a
					opener.document.getElementById("selectE").value = b
					window.close();
				}
				
				
				
				
		 		//검색하기
		  		function doSearch() {
				        var query = {"searchCode" : $("#selectD").val(), "searchName" : $("#selectE").val()};
				        
				        console.log("searchCode:", query.searchCode);
				        console.log("searchName:", query.searchName);
				        
				        $.ajax({
				            url : "${pageContext.request.contextPath}/stock/searchEmployees",
				            type : "get",
				            data : query,
				            dataType : "text",
				            success : function(data){
				                 if (query.searchCode == "" && query.searchName == "") {
				                    location.href = "${pageContext.request.contextPath}/material/searchClient";
				                } else {
				                    location.href = "${pageContext.request.contextPath}/material/searchClient?searchCode=" + $("#selectD").val() + "&searchName=" + $("#selectE").val();
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