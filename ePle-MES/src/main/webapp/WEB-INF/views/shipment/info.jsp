<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/head.jsp"%>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<title>수주정보</title>
</head>
<body>
<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10">
			<!-- 타이틀 -->
			<div class="login-title">
				<h1 class="text-center text-primary">수주 정보</h1>
			</div>
			<!-- 폼 -->
			<form action="/request/update" method="get" id="addForm">
				<!-- 비입력 구간 -->
				<!-- 입력 구간 -->
				<div class="row">
					<div class="col-sm-12 mb-3">
						<!-- 필수입력내역 -->
						<div class="form-group">
							<label>수주번호</label> 
							<input class="form-control" type="text"  name="code" id="code" readonly value="${vo.code }">
						</div>
						<div class="form-group">
							<label>업체코드</label> 
							<input class="form-control" type="text"  name="client_code" id="client_code" readonly value="${vo.client_code }">
						</div>
						<div class="form-group">
							<label>수주일자</label> 
							<input class="form-control date-picker" name="date" type="text" id="date-picker" readonly value="${vo.date }">
						</div>
						<div class="form-group">
							<label>납품일자</label> 
							<input class="form-control date-picker" name="deadline" type="text"  readonly value="${vo.deadline }">
						</div>
						<div class="form-group">
							<label>담당자코드</label> <input class="form-control" name="manager" type="text"  readonly value="${vo.manager }">
						</div>
						<div class="form-group">
							<label>품번</label> <input class="form-control" name="product" type="text" readonly value="${vo.product }">
						</div>
						<div class="form-group">
							<label>수주량</label> <input class="form-control" name="amount" type="text" readonly value="${vo.amount }">
						</div>
						<!-- 자동입력내역 -->
						<div class="form-group">
							<label>업체명</label> <input class="form-control" type="text" name="clientName" readonly value="${vo.clientName }">
						</div>
						<div class="form-group">
							<label>담당자명</label> <input class="form-control" type="text" name="managerName" readonly value="${vo.managerName}">
						</div>
						<div class="form-group">
							<label>품명</label> <input class="form-control" type="text" name="productName" readonly value="${vo.productName }">
						</div>
						<div class="form-group">
							<label>단위</label> <input class="form-control" name ="unit" type="text" readonly value="${vo.unit }">
						</div>
						<div class="form-group">
							<label>재고량</label> <input class="form-control" name ="stock" type="text" readonly value="${vo.stock }">
						</div>
						<div class="form-group">
							<label>과부족량</label> <input class="form-control" type="text" readonly value="${vo.stock - vo.amount}">
						</div>
						<div class="form-group">
							<label>단가</label> <input class="form-control" name ="currency" type="text" readonly value="${vo.currency }">
						</div>
						<div class="form-group">
							<label>수주상태</label> <input class="form-control" name ="status" type="text" readonly value="${vo.status }" id="status">
						</div>
						<input type="hidden" name="reg_date" value="${vo.reg_date }">
						<input type="hidden" name="reg_emp" value="${vo.reg_emp }">


				<!-- 버튼 -->
				<div class="row">
					<div class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
						<button type="button" class="btn btn-secondary" onclick="window.close();">
							<b>취소</b>
						</button>
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