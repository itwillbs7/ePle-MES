<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>반품 등록</title>
</head>
<body>
	<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10">
			<!-- 타이틀 -->
			<div class="login-title">
				<h1 class="text-center text-primary">반품 등록</h1>
			</div>
			<!-- 폼 -->
			<form action="/returns/add" method="post" id="addForm" onsubmit="">
				<!-- 비입력 구간 -->
				<input class="form-control" type="hidden" placeholder="반품번호" name="code" id="code">
				<!-- 입력 구간 -->
				<div class="row">
					<div class="col-sm-12 mb-3">
						<!-- 필수입력내역 -->
						<div class="form-group">
							<label for="client_code">출하번호</label> <input class="form-control"
								type="text" placeholder="클릭 시 검색창이 뜹니다" name="ship_code"
								id="ship_code" readonly required="required"
								value="${List.code }">
						</div>
						<div class="form-group">
							<label>수주업체</label> <input class="form-control" type="text"
								readonly id="clientName" required="required" readonly
								value="${List.clientName }"> <input class="form-control"
								type="hidden" readonly id="client_code" required="required"
								readonly>
						</div>
						<div class="form-group">
							<label for="client_code">수주번호</label> <input class="form-control"
								type="text" placeholder="클릭 시 팝업검색창이 뜹니다" name="request_code"
								id="request_code" readonly required="required"
								value="${List.reqs_code }">
						</div>
						<div class="form-group">
							<label for="date">출하일자</label> <input class="form-control"
								name="shipdate" type="text" id="shipdate" autocomplete="off"
								required="required" readonly value="${List.date }">
						</div>
						<div class="form-group" id="returndate">
							<label for="deadline ">반품일자</label> <input
								class="form-control date-picker" name="date" type="text"
								id="date" placeholder="클릭 시 달력이 뜹니다" autocomplete="off"
								required="required" readonly>
						</div>
						<div class="form-group">
							<label for="amount">출하량</label> <input class="form-control"
								name="samount" id="samount" type="number" autocomplete="off"
								min="1" required="required" readonly value="${List.amount }">
							<input type="hidden" name="unit" id="unit">
						</div>
						<div class="form-group">
							<label>lot</label> <select
								class="custom-select2 form-control select2-hidden-accessible"
								name="lot" style="width: 100%; height: 38px" data-select2-id="1"
								tabindex="-1" aria-hidden="true" id="lot">
							</select>
						</div>
						<div class="form-group">
							<label for="amount">반품량</label> <input class="form-control"
								name="amount" id="amount" type="number"
								placeholder="출하량을 입력해주세요" autocomplete="off" min="1"
								required="required">
						</div>
						<div class="form-group">
							<label for="amount">반품사유</label>
							<textarea class="form-control" placeholder="반품사유를 입력하세요"
								name="reason"></textarea>
						</div>


						<!-- 자동입력내역 -->

						<!-- 버튼 -->
						<div class="row">
							<div
								class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
								<button type="button" class="btn btn-secondary"
									onclick="window.close();">
									<b>취소</b>
								</button>
								<input type="submit" class="btn btn-success" value="등록"
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
	

		// 수주번호 생성
		let returnNumber;
		let lot;

		function createOrderNum() {
			const date = new Date();
			const year = date.getFullYear().toString().slice(-2); //올해연도 끝 2자리
			const month = String(date.getMonth() + 1).padStart(2, "0"); //이번달
			const day = String(date.getDate()).padStart(2, "0"); //오늘날짜 

			lot = $('#lot option:selected').val();
			lot = lot.substr(0,3);
			
			const orderNum = year + "RT" + month + day + lot;
			return orderNum;

		}
		
		document.querySelector('form').addEventListener('submit',function(event) {
							// 기본 제출 이벤트를 막음
							event.preventDefault();
							
							var date = new Date(document.getElementById('date').value);
							var shipdate = new Date(document.getElementById('shipdate').value);
							
							// 반품일자는 출하일자 이전날짜를 선택할 수 없다
							if(date<shipdate){
							$('#returndate').append('<span style="color : red; font-size : 12px"> * 반품일자는 출하일자 이후여야 합니다 </span>');
							document.getElementById('date').focus();
								return;
							}

							// 출하번호 생성
							const orderNum = createOrderNum();

							// 생성된 출하번호를 name="code"인 요소의 값으로 설정
							document.querySelector('input[name="code"]').value = orderNum;

							// 폼 제출
							this.submit();
						});
	</script>
	<!-- ajax -->
	<script type="text/javascript" id="ajaxForSubmit">
	function ajax() {
		$.ajax({
			type : "GET",
			url : "/returns/searchLOT",
			data : {
				request_code : $("#request_code").val(),
				ship_code : $("#ship_code").val()
					},
			success : function(data) {
					$('#lot').empty();

					$.each(data,function(index,item) {
						// item을 이용하여 option 요소를 만들고 select 요소에 추가합니다.
						$('#lot').append('<option value="' + item.lot + '" data-amount="' + item.amount + '">'+ item.lot+ '( 수량 : '+ item.amount+ ' ) </option>');
									});
						document.getElementById('amount').max = $('#lot option:selected').data('amount');
					},
			error : function(data) {
					alert('다시시도');
									}
					});
				};
	</script>
	<!-- 팝업 -->
	<script type="text/javascript">
		$(document).ready(function() {

		// lot , lot 수량 가져오기
		
					
			if ($("#ship_code").val() != null) {ajax();}

			// #lot 셀렉트 박스가 변경되었을 때 발생하는 이벤트를 정의합니다.
			$('#lot').change(function() {
						document.getElementById('amount').max = $('option:selected', this).data('amount');
										});

			// 출하번호 찾기	
			$("#ship_code").click(function() {
				window.open("/returns/searchShipment","Shipment Search","width=500,height=600,left=200,top=200");
									});

			// 출하코드 입력 시
			$("#ship_code").on("input", function() { ajax(); });
			});//끝
	</script>

</body>
</html>