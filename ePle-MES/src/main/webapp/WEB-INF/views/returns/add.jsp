<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/head.jsp"%>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<title>반품 등록</title>
</head>
<body>
	<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10" style="max-width:650px; padding: 20px 15px;">
			<!-- 타이틀 -->
			<div class="login-title" style="margin-bottom: 20px;">
				<h1 class="text-center text-primary">반품 등록</h1>
			</div>
			<!-- 폼 -->
			<form action="/returns/add" method="post" id="addForm" onsubmit="">
				<!-- 비입력 구간 -->
				<input class="form-control" type="hidden" placeholder="반품번호" name="code" id="code">
				<!-- 입력 구간 -->
				<div class="row">
					<div class="col-sm-4 mb-3">
							<label style="font-weight: bold;" for="client_code">출하번호</label> 
							<input class="readonly form-control" autocomplete="off" spellcheck="false"
								type="text" placeholder="검색하기" name="ship_code"
								id="ship_code" required="required"
								value="${List.code }">
						</div>
					<div class="col-sm-4 mb-3">
							<label style="font-weight: bold;" for="client_code">수주번호</label> 
							<input class="form-control"
								type="text" name="request_code"
								id="request_code" readonly required="required"
								value="${List.reqs_code }">
						</div>
					<div class="col-sm-4 mb-3">
							<label style="font-weight: bold;">수주업체</label> 
							<input class="form-control" type="text"
								readonly id="clientName" required="required" readonly
								value="${List.clientName }"> <input class="form-control"
								type="hidden" readonly id="client_code" required="required"
								readonly>
						</div>
				</div>
				<div class="row">
					<div class="col-sm-4 mb-3">
							<label style="font-weight: bold;" for="date">출하일자</label> 
							<input class="form-control"
								name="shipdate" type="text" id="shipdate" autocomplete="off"
								required="required" readonly value="${List.date }">
						</div>
						<div class="col-sm-4 mb-3" id="returndate">
							<label style="font-weight: bold;" for="deadline ">반품일자</label> 
							<input
								class="readonly form-control date-picker" name="date" type="text"
								id="date" placeholder="클릭 시 달력이 뜹니다" autocomplete="off"
								required="required" >
						</div>
				</div>
				<div class="row">
					<div class="col-sm-4 mb-3">
							<label style="font-weight: bold;" for="amount">출하량</label> 
							<input class="form-control"
								name="samount" id="samount" type="number" autocomplete="off"
								min="1" required="required" readonly value="${List.amount }">
							<input type="hidden" name="unit" id="unit">
						</div>
					<div class="col-sm-4 mb-3">
							<label style="font-weight: bold;">lot</label> 
							<select
								class="custom-select2 form-control select2-hidden-accessible"
								name="lot" style="width: 100%; height: 38px" data-select2-id="1"
								tabindex="-1" aria-hidden="true" id="lot">
							</select>
						</div>
					<div class="col-sm-4 mb-3">
							<label style="font-weight: bold;" for="amount">반품량</label> 
							<input class="form-control"
								name="amount" id="amount" type="number"
								placeholder="필수 입력" autocomplete="off" min="1"
								required="required">
						</div>
				</div>
				<div class="row" style="margin-bottom: 20px;">
					<div class="col-sm-12 mb-3">
							<label style="font-weight: bold;" for="amount">반품사유</label>
							<textarea class="form-control" placeholder="반품사유를 입력하세요"
								name="reason"></textarea>
						</div>
				</div>
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
				<!-- 버튼 -->
			</form>
			<!-- 폼 -->
		</div>
	</div>
	<!-- 콘텐츠 끝> -->
	<%@ include file="../include/footer.jsp"%>

	<script type="text/javascript" class="formDataSetting">
		let returnNumber;
		let lot;

		function createOrderNum() {
			const date = new Date();
			const year = date.getFullYear().toString().slice(-2); 
			const month = String(date.getMonth() + 1).padStart(2, "0"); 
			const day = String(date.getDate()).padStart(2, "0"); 

			lot = $('#lot option:selected').val();
			lot = lot.substr(0,3);
			
			const orderNum = year + "RT" + month + day + lot;
			return orderNum;

		}
		
		document.querySelector('form').addEventListener('submit',function(event) {
							event.preventDefault();
							
							var date = document.getElementById('date').value;
							var shipdate = document.getElementById('shipdate').value;
							
							if(date<reqsdate){
								var returnDateElement = $('#returndate');
							    if (returnDateElement.find('span').length === 0) {
							        returnDateElement.append('<span style="color : red; font-size : 12px"> * 납품예정일은 수주일자 이후여야 합니다 </span>');
							    }
							    document.getElementById('date').focus();
							    return;
							}

							const orderNum = createOrderNum();

							document.querySelector('input[name="code"]').value = orderNum;

							this.submit();
						});
	</script>
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
	<script type="text/javascript">
		$(document).ready(function() {
			$(".readonly").on('keydown paste', function(e){
		        if(e.keyCode != 9) 
		            e.preventDefault();
		    });

			if ($("#ship_code").val() != null) {ajax();}

			$('#lot').change(function() {
						document.getElementById('amount').max = $('option:selected', this).data('amount');
										});

			$("#ship_code").click(function() {
				window.open("/returns/searchShipment","Shipment Search","width=650,height=600,left=200,top=200");
									});

			$("#ship_code").on("input", function() { ajax(); });
			});
	</script>

</body>
</html>