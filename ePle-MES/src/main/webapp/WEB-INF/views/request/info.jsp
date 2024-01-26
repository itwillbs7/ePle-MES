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
		<div class="login-box bg-white box-shadow border-radius-10" style="max-width:600px; padding: 20px 15px;">
			<!-- 타이틀 -->
			<div class="login-title" style="margin-bottom: 20px;">
				<h1 class="text-center text-primary">수주 정보</h1>
			</div>
			<!-- 폼 -->
			<form action="/request/update" method="get" id="addForm">
				<!-- 비입력 구간 -->
				<!-- 입력 구간 -->
				<div class="row" >
					<div class="col-sm-4 mb-3">
							<label style="font-weight: bold;">수주번호</label> 
							<input class="form-control" type="text" name="code" id="code" readonly value="${vo.code }" style="padding-right: 0px;">
					</div>
					<div class="col-sm-4 mb-3">
							<label style="font-weight: bold;">업체코드</label> 
							<input class="form-control" type="text"   id="client_code" readonly value="${vo.client_code }">
					</div>
					<div class="col-sm-4 mb-3">
							<label style="font-weight: bold;">업체명</label> 
							<input class="form-control" type="text" readonly value="${vo.clientName }">
					</div>
				</div>
				<div class="row" >
					<div class="col-sm-4 mb-3">
							<label style="font-weight: bold;">수주일자</label> 
							<input class="form-control date-picker" type="text" id="date-picker" readonly value="${vo.date }">
					</div>
					<div class="col-sm-4 mb-3">
							<label style="font-weight: bold;">납품일자</label> 
							<input class="form-control date-picker"  type="text"  readonly value="${vo.deadline }">
					</div>
				</div>
				<div class="row" >
					<div class="col-sm-4 mb-3">
							<label style="font-weight: bold;">품번</label> 
							<input class="form-control" type="text" readonly value="${vo.product }">
					</div>
					<div class="col-sm-4 mb-3">
							<label style="font-weight: bold;">품명</label> 
							<input class="form-control" type="text" readonly value="${vo.productName }">
					</div>
					<div class="col-sm-4 mb-3">
							<label style="font-weight: bold;">단가</label> 
							<input class="form-control"  type="text" readonly value="${vo.currency }">
					</div>
				</div>
				<div class="row" >
					<div class="col-sm-4 mb-3">
							<label style="font-weight: bold;">수주량</label> 
							<input class="form-control" type="text" readonly value="${vo.amount }${vo.unit}">
					</div>
					<div class="col-sm-4 mb-3">
							<label style="font-weight: bold;">재고량</label> 
							<input class="form-control" type="text" readonly value="${vo.stock }">
					</div>
					<div class="col-sm-4 mb-3" >
							<label style="font-weight: bold;">과부족량</label> 
							<input class="form-control" type="text" readonly value="${vo.stock - vo.amount}">
						</div>
				</div>
				<div class="row">
					<div class="col-sm-4 mb-3">
							<label style="font-weight: bold;">담당자코드</label> 
							<input class="form-control" type="text"  readonly value="${vo.manager }">
					</div>
					<div class="col-sm-4 mb-3">
							<label style="font-weight: bold;">담당자명</label> 
							<input class="form-control" type="text"  readonly value="${vo.managerName}">
					</div>
					<div class="col-sm-4 mb-3">
							<label style="font-weight: bold;">수주상태</label> 
							<input class="form-control" type="text" readonly value="${vo.status }" id="status">
					</div>
				</div>
				<hr>
				<div class="row" style="margin-bottom: 20px;">
					<div class="col-sm-3 mb-3">
						<label style="font-weight: bold;">작성일자</label> 
						<input class="form-control" type="text" readonly value="${vo.reg_date }" id="reg_date">
					</div>
					<div class="col-sm-3 mb-3">
						<label style="font-weight: bold;">작성자 아이디</label> 
						<input class="form-control" type="text" readonly value="${vo.reg_emp }">
					</div>
					<div class="col-sm-3 mb-3">
						<label style="font-weight: bold;">수정일자</label> 
						<input class="form-control" type="text" readonly value="${vo.update_date }" id="update_date">
					</div>
					<div class="col-sm-3 mb-3">
						<label style="font-weight: bold;">수정자 아이디</label> 
						<input class="form-control" type="text" readonly value="${vo.update_emp }">
					</div>
				</div>

				<!-- 버튼 -->
				<div class="row">
					<div class="col-sm-3 mb-3 justify-content-center btn-toolbar btn-group">
					</div>
					<div class="col-sm-6 mb-3 justify-content-center btn-toolbar btn-group">
						<button type="button" class="btn btn-secondary" onclick="window.close();">
							<b>취소</b>
						</button>
						<input type="submit" class="btn btn-success" value="수정" id="update">
					</div>
					<div class="col-sm-3 mb-3 justify-content-center btn-toolbar btn-group">
					</div>
				</div>
				<!-- 버튼 -->
			</form>
			<!-- 폼 -->
		</div>
	</div>
	<!-- 콘텐츠 끝> -->
	<script>
	var reg_date = "${vo.reg_date}";
	var date = reg_date.split(" ")[0];
	document.getElementById("reg_date").value = date;
	
	var update_date ="${vo.update_date}";
	var update = update_date.split(" ")[0];
	document.getElementById("update_date").value = update;
	
	</script>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>