<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/head.jsp"%>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<title>품목 조회</title>

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
			<h2 class="text-center text-primary">품목 조회</h2>
			</div>
			
			<!------------------------------- 검색 시작 ------------------------------->
			<div class="search_area">
				<div class="row">
					<div class="col-sm-12 mb-3">
						
						<div class="form-group">
							<label>품목코드</label> 
							<input class="form-control" type="text" name="mapdCode" id="mapdCode">
						</div>
						
						<div class="form-group">
							<label>품목명</label> 
							<input class="form-control" type="text" name="mapdName" id="mapdName">
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
					<th>사원코드</th>
					<th>카테고리</th>
					<th>사원명</th>
				</tr>
			</thead>
			
			<tbody>
				<c:forEach items="${mapdList}" var="vo">
				<tr onclick="selectWork('${vo.code }','${vo.name }')">
					<td class="con">${vo.code }</td>
					<td class="con">${vo.category }</td>
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
										<a href="/order/searchMAPD?page=${pageVO.startPage - 1}" class="btn btn-outline-primary prev"> 
											<i class="fa fa-angle-double-left"></i>
										</a>
									</c:if>
									<c:forEach begin="${pageVO.startPage}" end="${pageVO.endPage}" var="i" step="1">
										<a href="/order/searchMAPD?page=${i}" class="btn btn-outline-primary ${pageVO.cri.page == i ? 'active' : ''}">
											${i} </a>
									</c:forEach>
									<c:if test="${pageVO.next}">
										<a href="/order/searchMAPD?page=${pageVO.endPage + 1}" class="btn btn-outline-primary next"> 
											<i class="fa fa-angle-double-right"></i>
										</a>
									</c:if>
								</div>
							</c:if>
							</div>

			<script type="text/javascript">
				function selectWork(a, b) { // 부모창으로 값 넘기기

					opener.document.getElementById("mapdCode").value = a
					opener.document.getElementById("mapdName").value = b
					window.close();
				}
				
				
				
				
		 		//검색하기
		  		function doSearch() {
				        var query = {"mapdCode" : $("#mapdCode").val(), "mapdName" : $("#mapdName").val()};
				        
				        console.log("mapdCode:", query.mapdCode);
				        console.log("mapdName:", query.mapdName);
				        
				        $.ajax({
				            url : "${pageContext.request.contextPath}/order/searchMAPD",
				            type : "get",
				            data : query,
				            dataType : "text",
				            success : function(data){
				                 if (query.mapdCode == "" && query.mapdName == "") {
				                    location.href = "${pageContext.request.contextPath}/order/searchMAPD";
				                } else {
				                    location.href = "${pageContext.request.contextPath}/order/searchMAPD?mapdCode=" + $("#mapdCode").val() + "&mapdName=" + $("#mapdName").val();
				                } 
				                 
//				                if (data) {
//				                    alert("완료");
//				                } else {
//				                    alert("전송된 값 없음");
//				                }
				                
				            },
				            

				        });
				    
				} 
			</script>
		</div>
	</div>
	
	
	
	
	
	
	<!-- 콘텐츠 끝> -->
	<%@ include file="../include/footer.jsp"%>
	
</body>
</html>