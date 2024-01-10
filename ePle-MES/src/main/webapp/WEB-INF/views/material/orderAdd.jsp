<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/head.jsp"%>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<title>발주서 등록</title>
<style type="text/css">
.back {
  background-color: white !important;
}
</style>
</head>
<body>
<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10">
			<!-- 타이틀 -->
			<div class="login-title">
				<h1 class="text-center text-primary">발주서 등록</h1>
			</div>
			<!-- 폼 -->
			<form action="/material/orderAdd" method="post" id="editForm">
				<!-- 비입력 구간 -->
				<!-- 입력 구간 -->
				<div class="row">
					<div class="col-sm-12 mb-3">
						<!-- 필수입력내역 -->
						
									<label>발주 코드</label> 
								<div class="form-group">
								<input class="form-control" type="text" name="code" id="code" value="${List.code }" readonly>
								</div>
								
								<div class="form-group">
									<!-- <label>자재 유형</label>  -->
								</div>
									
									<label>거래처 정보</label> 
								<div class="form-group">
									<input class="form-control back" type="text" id="selectD" name="client_code" readonly>
								</div>
								<div class="form-group">
									<input class="form-control back" type="text" id="selectE" readonly>
								</div>
								
									<label>품목 정보</label> 
								<div class="form-group">
									<input class="form-control" type="text" id="mapdCode" name="material" value="${List.material}" readonly>
								</div>
								<div class="form-group">
									<input class="form-control" type="text" id="mapdName" value="${List.name }" readonly>
								</div>
								
									<label>요청량</label> 
								<div class="form-group">
									<input class="form-control" type="number" name="amount" required min="1" max="100" value="${List.amount }" readonly oninput="{(e:any) ->{if(e.target.value > 0){if(e.target.value > 100) e.target.value = 99;}else{e.target.value = 1;}}}">
								</div>

									<label>발주금액</label> 
								<div class="form-group">
									<input class="form-control back" type="text" name="price" required min="1" max="100" oninput="{(e:any) ->{if(e.target.value > 0){if(e.target.value > 100) e.target.value = 99;}else{e.target.value = 1;}}}">
								</div>

									<label>납기 일자</label> 
								<div class="form-group">
									<!-- 달력???? -->
									<input class="form-control back" type="date" id="datepicker" name="order_date" placeholder="">
								</div>

									<label>담당자</label> 
								<div class="form-group">
									<input class="form-control back" type="text" id="selectA" name="reg_emp" placeholder="" readonly>
								</div>
								<div class="form-group">
									<input class="form-control back" type="text" id="selectB" placeholder="" readonly>
									<input class="form-control" type="hidden" id="selectC" placeholder="">
								</div>
								

				<!-- 버튼 -->
				<div class="row">
					<div class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
						<button type="button" class="btn btn-secondary" onclick="window.close();"><b>취소</b></button>
						<input type="submit" class="btn btn-success" value="등록" id="update">
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
		// 등록 - 거래처 리스트 
	    $("#selectD,#selectE").click(function() {
	        var url = '${pageContext.request.contextPath}/material/searchClient';
	        openPopup(url);
	    });
		
	 // 등록 - 사원 리스트 
	    $("#selectA,#selectB").click(function() {
	        var url = '${pageContext.request.contextPath}/stock/searchEmployees';
	        openPopup(url);
	    });
		
	});
		
	$('#datePicker').datepicker({
		format: "yyyy-mm-dd",	
		startDate: '-10d',	
		    
		})
		
	</script>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>