<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<meta charset="UTF-8">
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
<title>품목 조회</title>

<!-- 원자재 품목만 출력합니다 -->
<!-- /material/askOrderAdd 에서 참조중 -->

</head>
<body>
	<div class="modal-content">
	<div class="login-box bg-white box-shadow border-radius-10">
			
			<div class="login-title">
			<a href="${pageContext.request.contextPath}/material/searchMaterial"><h2 class="text-center" style="color: #FF8C00;">품목 조회</h2></a>
			</div>
			
			<!------------------------------- 검색 시작 ------------------------------->
			<div class="search_area">
				<div class="row">
					<div class="col-sm-12 mb-3">
						
						<div class="form-group">
							<label>품명</label> 
							<input class="form-control" type="hidden" id="mapdCode" >
							<input class="form-control" type="text" id="mapdName" name="searchName">
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
					<th>품목코드</th>
					<th>품명</th>
				</tr>
			</thead>
			
			<tbody>
				<c:if test="${not empty searchMaterial}">
					<c:forEach items="${searchMaterial}" var="vo">
					<tr onclick="selectWork('${vo.code }','${vo.name }')">
						<td class="con">${vo.code }</td>
						<td class="con">${vo.name }</td>
					</tr>
					</c:forEach>
				</c:if>
					<c:if test="${empty searchMaterial}">
						<tr>
							<td colspan="2" style="text-align: center; vertical-align: middle;">검색 결과가 없습니다 ❀ܓ(｡◠ _ ◠｡ )</td>
						</tr>
					</c:if>
			</tbody>
			</table>
			
			
		    <!------------------------------ 페이징 시작 ------------------------------>
				<div class="btn-toolbar justify-content-center mb-15">
				<c:if test="${pageVO.totalCount > 1}">
					<div class="btn-group">
						<c:if test="${pageVO.prev}">
							<a href="/material/searchMaterial?page=${pageVO.startPage - 1}&searchName=${param.searchName}" class="btn btn-outline-primary prev"> 
								<i class="fa fa-angle-double-left"></i>
							</a>
						</c:if>
						<c:forEach begin="${pageVO.startPage}" end="${pageVO.endPage}" var="i" step="1">
							<a href="/material/searchMaterial?page=${i}&searchName=${param.searchName}" class="btn btn-outline-primary ${pageVO.cri.page == i ? 'active' : ''}">
								${i} </a>
						</c:forEach>
						<c:if test="${pageVO.next}">
							<a href="/material/searchMaterial?page=${pageVO.endPage + 1}&searchName=${param.searchName}" class="btn btn-outline-primary next"> 
								<i class="fa fa-angle-double-right"></i>
							</a>
						</c:if>
					</div>
				</c:if>
				</div>



			<script type="text/javascript">
			
				function selectWork(a, b) { 

					opener.document.getElementById("mapdCode").value = a
					opener.document.getElementById("mapdName").value = b
					window.close();
				}
				
		 		//검색하기
		  		function doSearch() {
				        var query = {"searchName" : $("#mapdName").val()};
				        
				        console.log("searchName:", query.searchName);
				        
				        $.ajax({
				            url : "${pageContext.request.contextPath}/material/searchMaterial",
				            type : "get",
				            data : query,
				            dataType : "text",
				            success : function(data){
				                 if (query.searchCode == "" && query.searchName == "") {
				                    location.href = "${pageContext.request.contextPath}/material/searchMaterial";
				                } else {
				                    location.href = "${pageContext.request.contextPath}/material/searchMaterial?&searchName=" + $("#mapdName").val();
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