<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<title>입고 수정</title>
</head>
<body>
<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10">
			<!-- 타이틀 -->
			<div class="login-title">
				<h1 class="text-center" style="color: #7CB342;">입고 수정</h1>
			</div>
			<!-- 폼 -->
			<form action="/material/inEdit" method="post" id="editForm">
				<!-- 비입력 구간 -->
				<!-- 입력 구간 -->
				<div class="row">
					<div class="col-sm-12 mb-3">
						<!-- 필수입력내역 -->
						
									<label>입고 코드</label> 
								<div class="form-group">
								<input class="form-control" type="text" name="code" id="code" readonly value="${inInfo.code }">
								</div>
								
									<label>자재 유형</label> 
								<div class="form-group">
									<input class="form-control" type="text" name="category" value="${inInfo.category }" readonly>
								</div>

									<label>발주/수주 정보</label> 
								<div class="form-group">
									<input class="form-control" type="text" id="orderCode" name="order_num" placeholder="발주/수주코드" readonly value="${inInfo.order_num}">
								</div>
								<div class="form-group">
									<input class="form-control" type="text"   id="mapdName" placeholder="품명" readonly value="${inInfo.mapdName }">
									<input class="form-control" type="hidden" id="mapdCode" name="mapd_code" placeholder="자재코드" readonly value="${inInfo.mapd_code }">
								</div>
								<div class="form-group">
									<input class="form-control" type="text" id="orderAmount" name="amount" required placeholder="수량" value="${inInfo.amount }">
								</div>

									<label>창고 정보</label> 
								<div class="form-group">
									<input class="form-control back" type="text" id="warehouseCode" name="warehouse_code" required readonly placeholder="창고코드" value="${inInfo.warehouse_code}">
								</div>
								<div class="form-group">
									<input class="form-control back" type="text" id="empName" placeholder="담당자" required readonly value="${inInfo.empName}">
									<input class="form-control back" type="hidden" id="empCode" name="emp_code" placeholder="담당자" readonly value="${inInfo.emp_code}">
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

	function openPopup(url) {
	    var width = 550;
	    var height = 550;
	    var left = (screen.width - width) / 2;
	    var top = (screen.height - height) / 2;
	    var popupWindow = window.open(url, '_blank', "width=" + width + ", height=" + height + ", left=" + left + ", top=" + top);
	    popupWindow.focus();
	}
	$(document).ready(function() {
	 	// 등록 - 창고 리스트
	    $("#warehouseCode, #empName").click(function() {
	        var url = '${pageContext.request.contextPath}/material/searchOrderWarehouse';
	        openPopup(url);
	    });
	});
		
	</script>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>