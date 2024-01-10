<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<meta charset="UTF-8">
<%@ include file="../include/head.jsp"%>

<title>발주 조회</title>

<!-- 발주완료 & 입고전인 발주서만 출력합니다 -->

<style type="text/css">
.con:hover{
	background-color : #e1e1e1;
	cursor:pointer;
}
</style>

</head>
<body>
	<div class="modal-content">
	<div class="login-box bg-white box-shadow border-radius-10">
			
			<div class="login-title">
			<h2 class="text-center text-primary">발주 조회</h2>
			</div>
			
			<!------------------------------- 검색 시작 ------------------------------->
			<div class="search_area">
				<div class="row">
					<div class="col-sm-12 mb-3">
						
						<div class="form-group">
							<label>발주코드</label> 
							<input class="form-control" type="text" id="orderCode" name="searchCode">
						</div> 
							<input class="form-control" type="hidden" id="mapdCode">

						<div class="form-group">
							<label>자재명</label> 
							<input class="form-control" type="text" id="mapdName" name="searchName">
						</div>
							<input class="form-control" type="hidden" id="orderAmount">

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
					<th>발주코드</th>
					<th>자재코드</th>
					<th>자재명</th>
					<th>수량</th>
				</tr>
			</thead>
			
			<tbody>
				<c:forEach items="${searchOrder}" var="vo">
				<tr onclick="selectWork('${vo.code }','${vo.material }', '${vo.name }','${vo.amount }')">
					<td class="con">${vo.code }</td>
					<td class="con">${vo.material }</td>
					<td class="con">${vo.name }</td>
					<td class="con">${vo.amount }</td>
				</tr>
				</c:forEach>
			</tbody>
			</table>
			
			
		    <!------------------------------ 페이징 시작 ------------------------------>
				<div class="btn-toolbar justify-content-center mb-15">
				<c:if test="${pageVO.totalCount > 1}">
					<div class="btn-group">
						<c:if test="${pageVO.prev}">
							<a href="/material/searchOrder?page=${pageVO.startPage - 1}" class="btn btn-outline-primary prev"> 
								<i class="fa fa-angle-double-left"></i>
							</a>
						</c:if>
						<c:forEach begin="${pageVO.startPage}" end="${pageVO.endPage}" var="i" step="1">
							<a href="/material/searchOrder?page=${i}" class="btn btn-outline-primary ${pageVO.cri.page == i ? 'active' : ''}">
								${i} </a>
						</c:forEach>
						<c:if test="${pageVO.next}">
							<a href="/material/searchOrder?page=${pageVO.endPage + 1}" class="btn btn-outline-primary next"> 
								<i class="fa fa-angle-double-right"></i>
							</a>
						</c:if>
					</div>
				</c:if>
				</div>



			<script type="text/javascript">
				function selectWork(a, b, c, d) { 

					opener.document.getElementById("orderCode").value = a
					opener.document.getElementById("mapdCode").value = b
					opener.document.getElementById("mapdName").value = c
					opener.document.getElementById("orderAmount").value = d
					window.close();
				}
				
		 		//검색하기
		  		function doSearch() {
				        var query = {"searchCode" : $("#orderCode").val(), "searchName" : $("#mapdName").val()};
				        
				        console.log("searchCode:", query.searchCode);
				        console.log("searchName:", query.searchName);
				        
				        $.ajax({
				            url : "${pageContext.request.contextPath}/material/searchOrder",
				            type : "get",
				            data : query,
				            dataType : "text",
				            success : function(data){
				                 if (query.searchCode == "" && query.searchName == "") {
				                    location.href = "${pageContext.request.contextPath}/material/searchOrder";
				                } else {
				                    location.href = "${pageContext.request.contextPath}/material/searchOrder?searchCode=" + $("#orderCode").val() + "&searchName=" + $("#mapdName").val();
				                } 
				                 
//				                if (data) {
//				                    alert("완료");
//				                } else {
//				                    alert("전송된 값 없음");
//				                }
				            }
				            
				        });
				    
		 		}
			</script>
		</div>
	</div>
	
	
	
	
	
	
	<!-- 콘텐츠 끝> -->
	<%@ include file="../include/footer.jsp"%>
	
</body>
</html>