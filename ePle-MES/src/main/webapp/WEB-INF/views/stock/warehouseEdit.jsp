<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/head.jsp"%>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
label {
font-weight: bold;
}
.back {
  background-color: white !important;
}
</style>
<title>창고 수정</title>
</head>
<body>
<c:if test="${sessionScope.id eq null}">
	<c:redirect url="/" />
</c:if>
<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10">
			<!-- 타이틀 -->
			<div class="login-title">
				<h1 class="text-center" style="color: #7CB342;">창고 수정</h1>
			</div>
			<!-- 폼 -->
			<form action="/stock/warehouseEdit" method="post" id="editForm" onsubmit="return validateForm()">
				<!-- 비입력 구간 -->
				<!-- 입력 구간 -->
				<div class="row">
					<div class="col-sm-12 mb-3">
						<!-- 필수입력내역 -->
						
									<label>창고코드</label> 
								<div class="form-group">
								<input class="form-control" type="text" name="code" id="code" readonly value="${List.code }">
								</div>
								
									<label>창고 정보</label> 
								<div class="form-group">
									<input class="form-control" type="text" name="category"  id="category" readonly value="${List.category}">
								</div>
								<div class="form-group">
									<input class="form-control" type="text" name="name"  id="name" value="${List.wh_name}">
								</div>
								<div class="form-group">
									<input class="form-control" type="text" name="location" id="location" value="${List.location}">
								</div>

									<label>담당자 정보</label> 
								<div class="form-group">
									<input class="form-control" type="hidden" id="selectA" name="manager" value="${List.empCode}">
									<input class="form-control back" type="text" id="selectB" value="${List.name}" readonly>
								</div>
								<div class="form-group">
									<input class="form-control back" type="text" id="selectC" name="mng_phone" value="${List.phone}" readonly>
								</div>


				<!-- 버튼 -->
				<div class="row">
					<div class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
						<button type="button" class="btn btn-secondary" onclick="window.close();"><b>취소</b></button>
						<input type="submit" class="btn btn-success" value="수정" id="update">
					</div>
				</div>
					</div>
				</div>
				<!-- 버튼 -->
			</form>
			<!-- 폼 -->
		</div>
	</div>
	<!-- 콘텐츠 끝> -->
	<script type="text/javascript">
	window.resizeTo(outerWidth - innerWidth + 500, outerHeight - innerHeight + $(".login-box").outerHeight() + 13);
	
	function openPopup(url) {
	    var width = 550;
	    var height = 550;
	    var left = (screen.width - width) / 2;
	    var top = (screen.height - height) / 2;
	    var popupWindow = window.open(url, '_blank', "width=" + width + ", height=" + height + ", left=" + left + ", top=" + top);
	    popupWindow.focus();
	}
	$(document).ready(function() {
		// 등록 - 사원 리스트 (자재부)
	    $("#selectB,#selectC").click(function() {
	        var url = '${pageContext.request.contextPath}/stock/searchEmployees';
	        openPopup(url);
	    });
	 
	});

	
	function validateForm() {
	    
	    var category = document.getElementById("category").value;
	    var name = document.getElementById("name").value;
	    var location = document.getElementById("location").value;
	    var selectA = document.getElementById("selectA").value;
	    var selectC = document.getElementById("selectC").value;
	  
	    if (category === "" || name === "" || location === "" || selectA === "" || selectC === "") {
	        alert("모든 내용을 입력해주세요!");
	        return false; 
	    }
	    return true;
	}
	
	</script>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>