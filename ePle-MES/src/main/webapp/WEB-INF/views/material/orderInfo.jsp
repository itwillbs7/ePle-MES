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
<title>발주 요청서</title>
</head>
<body>
<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10">
			<!-- 타이틀 -->
			<div class="login-title">
				<h1 class="text-center text-primary">발주 요청서</h1>
			</div>
			<!-- 폼 -->
			<form action="/material/askOrderEdit" method="get" id="editForm">
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

									<label>품목 정보</label> 
								<div class="form-group">
									<input class="form-control" type="text" id="material" name="material" placeholder="품목코드" value="${List.material}" readonly>
								</div>
								<div class="form-group">
									<input class="form-control" type="text" id="name" placeholder="품명" readonly value="${List.name }">
								</div>

									<label>발주량</label> 
								<div class="form-group">
									<input class="form-control" type="text" id="orderAmount" name="amount" placeholder="요청량" value="${List.amount } ${List.unit }" readonly>
								</div>

									<label>요청자</label> 
								<div class="form-group">
									<input class="form-control" type="text" id="" name="" placeholder="사원이름" value="${List.empName}" readonly>
								</div>

									<label>요청 일자</label> 
								<div class="form-group">
									<input class="form-control" type="text" id="warehouseCode" name="warehouse_code" placeholder="" value="${List.date}" readonly>
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

	
	</script>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>