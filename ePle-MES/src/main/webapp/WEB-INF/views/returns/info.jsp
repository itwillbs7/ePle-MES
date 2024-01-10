<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/head.jsp"%>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous" />
<title>반품 상세보기</title>
</head>
<body>
	<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10">
			<!-- 타이틀 -->
			<div class="login-title">
				<h1 class="text-center text-primary">반품 상세보기</h1>
			</div>
			<!-- 폼 -->
			<form action="/returns/update" method="get" id="addForm" onsubmit="">
				<!-- 입력 구간 -->
				<div class="row">
					<div class="col-sm-12 mb-3">
						<!-- 필수입력내역 -->
						<div class="form-group">
							<label for="code">반품번호</label> <input class="form-control"
								type="text"  name="code"
								id="code" readonly required="required"
								value="${List.code }">
						</div>
						<div class="form-group">
							<label for="client_code">출하번호</label> <input class="form-control"
								type="text" placeholder="클릭 시 검색창이 뜹니다" name="ship_code"
								id="ship_code" readonly required="required"
								value="${List.ship_code }">
						</div>
						<div class="form-group">
							<label for="deadline">반품일자</label> <input class="form-control "
								name="date" type="date" id="date" value="${List.date }"
								autocomplete="off" required="required" readonly>
						</div>
						<div class="form-group">
							<label for="amount">반품량</label> 
							<input class="form-control"
								name="amount" id="amount" type="number"
								readonly autocomplete="off" min="1"
								required="required" value=${List.amount }>
						</div>
						<div class="form-group">
							<label for="amount">반품사유</label>
							<textarea class="form-control" placeholder="반품사유를 입력하세요"
								name="reason" readonly>${List.reason}</textarea>
						</div>
						<div class="form-group">
							<label>lot</label> 
							<input type = "text" name="lot" class="form-control"
							id="lot" readonly value =${List.lot }>
						</div>
						
						<!-- 자동입력내역 -->
						<div class="form-group">
							<label for="client_code">수주번호</label> <input class="form-control"
								type="text" placeholder="클릭 시 팝업검색창이 뜹니다" name="request_code"
								id="request_code" readonly required="required"
								value="${List.request_code }">
						</div>
						<div class="form-group">
							<label for="amount">출하량</label> <input class="form-control"
								name="samount" id="samount" type="number" autocomplete="off"
								min="1" required="required" readonly value="${List.amount }">
							<input type="hidden" name="unit" id="unit" value="${List.unit }">
						</div>
						<div class="form-group">
							<label for="date">출하일자</label> 
							<input class="form-control" type="date" id="shipdate" autocomplete="off"
								required="required" readonly value="${List.reqsdate }"
								name="reqsdate">
						</div>
						<div class="form-group">
							<label>수주업체</label> <input class="form-control" type="text"
								readonly id="clientName" name="clientName" required="required" readonly
								value="${List.clientName }"> 
								<input class="form-control"
								type="hidden" readonly id="client_code" required="required"
								readonly name="client_code">
						</div>
						<div class="form-group">
							<label>출하상태</label> 
							<input class="form-control" name ="status" type="text" readonly id="status" 
							required="required" value="${List.status }">
						</div>

						<!-- 버튼 -->
						<div class="row">
							<div
								class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
								<button type="button" class="btn btn-secondary"
									onclick="window.close();">
									<b>취소</b>
								</button>
								<!-- 						<input type="button" class="btn btn-success" value="등록" onclick="finished()" id="sa-custom-position"> -->
								<input type="submit" class="btn btn-success" value="수정"
									id="sa-custom-position">
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
	<%@ include file="../include/footer.jsp"%>

	<script type="text/javascript" class="formDataSetting">
		
	</script>
	

</body>
</html>