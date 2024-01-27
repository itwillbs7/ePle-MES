<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/head.jsp"%>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<title>출하 등록</title>
</head>
<body>
	<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10" style="max-width:600px; padding: 20px 15px;">
			<!-- 타이틀 -->
			<div class="login-title" style="margin-bottom: 20px;">
				<h1 class="text-center text-primary">출하명령 등록</h1>
			</div>
			<!-- 폼 -->
			<form action="/shipment/add" method="post" id="addForm" >
				<!-- 비입력 구간 -->
				<input class="form-control" type="hidden" placeholder="출하번호" name="code" id="code" >
				<!-- 입력 구간 -->
				<div class="row">
					<div class="col-sm-6 mb-3">
							<label style="font-weight: bold;" for="client_code">수주번호</label> 
							<input class="readonly form-control" type="text" placeholder="검색하기" 
							name="reqs_code" id="reqs_code"required="required" autocomplete="off" spellcheck="false">
						</div>
				</div>
				<div class="row">
					<div class="col-sm-4 mb-3">
							<label style="font-weight: bold;">업체명</label> 
							<input class="form-control" type="text" readonly id="clientName" required="required"
							readonly>
						</div>
					<div class="col-sm-4 mb-3">
							<label style="font-weight: bold;">품번</label> 
							<input class="form-control" name = "product" type="text" readonly id="product" required="required">
						</div>
					<div class="col-sm-4 mb-3">
							<label style="font-weight: bold;">단위</label> 
							<input class="form-control" name ="unit" type="text" readonly id="unit" required="required">
						</div>
				</div>
				<div class="row">
					<div class="col-sm-4 mb-3">
							<label style="font-weight: bold;" >수주일자</label> 
							<input class="form-control " name="reqsdate" type="text" id="reqsdate"
							 autocomplete="off" required="required" readonly>
						</div>
						<div class="col-sm-4 mb-3" id="returndate">
							<label style="font-weight: bold;" for="date">출하일자</label> 
							<input class="readonly form-control date-picker" name="date" type="text" id="date"
							placeholder="클릭 시 달력이 뜹니다" autocomplete="off" required="required">
						</div>
						<div class="col-sm-4 mb-3">
							<label style="font-weight: bold;" for="date">납품예정일</label> 
							<input class="form-control " name="deadlineDate" type="text" id="deadlineDate"
							 autocomplete="off" required="required" readonly >
						</div>
				</div>
				<div class="row">
					<div class="col-sm-4 mb-3">
							<label style="font-weight: bold;" >수주량</label> 
							<input class="form-control" name="reqsamount" id="reqsamount"
							type="number" autocomplete="off" min="1" required="required" readonly>
					</div>
						<div class="col-sm-4 mb-3" id="shipamount">
							<label style="font-weight: bold;" for="shipamount">출하량</label> 
							<input class="form-control" name="amount" id="amount"
							type="number" placeholder="출하량을 입력해주세요" autocomplete="off" min="1" required="required">
						    <span id="message"></span>
						</div>
					<div class="col-sm-4 mb-3">
							<label style="font-weight: bold;">현재 재고량</label> 
							<input class="form-control" name ="stock" type="number" readonly id="stock" required="required">
						</div>
				</div>
						<!-- 자동입력내역 -->
							<input class="form-control" name ="wareHistory_code" type="hidden" readonly id="wareHistory_code" required="required">
							<input class="form-control" name ="ware_code" type="hidden" readonly id="ware_code" required="required">


				<!-- 버튼 -->
				<div class="row">
					<div class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
						<button type="button" class="btn btn-secondary" onclick="window.close();">
							<b>취소</b>
						</button>
						<input type="submit" class="btn btn-success" value="등록" id="sa-custom-position">
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
	 var stock = document.getElementById('stock');
	 var amountInput = document.getElementById('amount');

	 stock.addEventListener('input', function() {
		 amountInput.max = stock.value;
		});
	 
	 amountInput.addEventListener('keyup', function() {
		   var reqsAmount = Number(document.getElementById('reqsamount').value);
		   var amount = Number(this.value);
		   $('#message').empty();
		   if (amount > reqsAmount) {
		       $('#message').append('<span style="color : red; font-size : 11px">* 출하량이 수주량보다 많습니다 </span>');
		   }
		});
	 

	 let ware_code;
	 
	 document.querySelector('input[name="ware_code"]').addEventListener('input', function() {
		 ware_code = this.value; 
		});
	 
	 function createOrderNum() {
			const date = new Date();
			const year = date.getFullYear().toString().slice(-2); 
			const month = String(date.getMonth() + 1).padStart(2, "0"); 
			const day = String(date.getDate()).padStart(2, "0"); 
			
			ware_code = ware_code.substr(0.3);
			
			const orderNum = year+"SP"+month+day+ware_code; 
			return orderNum;
		}
	 
	 function createHistoryNum(){
		 const date = new Date();
			const year = date.getFullYear().toString();
			const month = String(date.getMonth() + 1).padStart(2, "0"); 
			const day = String(date.getDate()).padStart(2, "0"); 
			
			const historyNum = "OUT"+year+month+day;
			return historyNum;
	 }
	 
	 
	 document.querySelector('form').addEventListener('submit', function(event) {
		    event.preventDefault();
		    
		    var date = document.getElementById('date').value; 
			var reqsdate = document.getElementById('reqsdate').value; 
			
			if(date<reqsdate){
				var returnDateElement = $('#returndate');
			    if (returnDateElement.find('span').length === 0) {
			        returnDateElement.append('<span style="color : red; font-size : 12px"> * 납품예정일은 수주일자 이후여야 합니다 </span>');
			    }
			    document.getElementById('date').focus();
			    return;
			}
			
		    const orderNum = createOrderNum();
		    const historyNum = createHistoryNum();
		    
		    document.querySelector('input[name="code"]').value = orderNum;
		    document.querySelector('input[name="wareHistory_code"]').value = historyNum;
		 
		    this.submit();
		});
	 </script>
	
	<!-- 팝업 -->
	<script type="text/javascript">
	$(document).ready(function(){
		 $(".readonly").on('keydown paste', function(e){
		        if(e.keyCode != 9) 
		            e.preventDefault();
		    });
	
		$("#reqs_code").click(function() {
			window.open("/shipment/searchRequest", "Request Search", "width=600,height=600,left=200,top=200");
		});
	
	
	});//끝
	
	
	</script>

</body>
</html>