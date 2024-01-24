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
</style>
<title>발주서 상세</title>
</head>
<body>
<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10">
			<!-- 타이틀 -->
			<div class="login-title">
				<h1 class="text-center text-primary">발주서 상세</h1>
			</div>
			<!-- 폼 -->
			<form action="/material/orderEdit" method="get" id="editForm">
				<!-- 비입력 구간 -->
				<!-- 입력 구간 -->
				<div class="row">
					<div class="col-sm-12 mb-3">
						<!-- 필수입력내역 -->
						
									<label>발주 코드</label> 
								<div class="form-group">
								<input class="form-control" type="text" name="code" id="code" value="${List.code }" readonly>
								</div>

									<label>발주 일자</label> 
								<div class="form-group">
									<input class="form-control" type="text" id="" name="" value="${List.reg_date}" readonly>
								</div>
								
									<label>납기 일자</label> 
								<div class="form-group">
									<input class="form-control" type="text" id="" name="" value="${List.order_date}" readonly>
								</div>
								
									<label>품목 정보</label> 
								<div class="form-group">
									<input class="form-control" type="text" id="material" name="material" placeholder="품목코드" value="${List.material}" readonly>
								</div>
								<div class="form-group">
									<input class="form-control" type="text" id="name" placeholder="품명" readonly value="${List.name }">
								</div>

									<label>발주량</label> 
								<div class="form-group">
									<input class="form-control" type="text" id="orderAmount" name="amount" value="${List.amount } ${List.unit }" readonly>
								</div>

									<label>총 발주 금액</label> 
								<div class="form-group">
									<input class="form-control" type="text" id="price" name="" value="${List.price}" readonly>
								</div>
								
									<label>거래처 정보</label> 
								<div class="form-group">
									<input class="form-control" type="text" value="${List.client_code}" readonly>
								</div>
								<div class="form-group">
									<input class="form-control" type="text" id="name" readonly value="${List.clName }">
								</div>
								
									<label>담당자</label> 
									<input class="form-control" type="hidden" id="" name="" value="${List.reg_emp}" readonly>
								<div class="form-group">
									<input class="form-control" type="text" id="" name="" value="${List.empName}" readonly>
								</div>

				<!-- 버튼 -->
				<div class="row">
					<div class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
						<button type="button" class="btn btn-secondary" onclick="window.close();"><b>닫기</b></button>
						<!-- <input type="submit" class="btn btn-success" value="수정" id="update"> -->
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

<script>
  function formatNumberWithCommas(number) {
    return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
  }

  document.addEventListener("DOMContentLoaded", function () {
    var priceInput = document.getElementById("price");

    var priceValue = priceInput.value;

    var formattedPrice = formatNumberWithCommas(priceValue);

    priceInput.value = formattedPrice;
  });
</script>


	<%@ include file="../include/footer.jsp"%>
</body>
</html>