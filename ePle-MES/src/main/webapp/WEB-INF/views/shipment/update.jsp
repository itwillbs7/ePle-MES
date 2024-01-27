<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/head.jsp"%>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<title>출하 수정</title>
</head>
<body>
	<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10" style="max-width:600px; padding: 20px 15px;">
			<!-- 타이틀 -->
			<div class="login-title" style="margin-bottom: 20px;">
				<h1 class="text-center text-primary">출하명령 수정</h1>
			</div>
			<!-- 폼 -->
			<form action="/shipment/update" method="post" id="addForm">
				<!-- 입력 구간 -->
				<div class="row">
					<div class="col-sm-6 mb-3">
							<label style="font-weight: bold;" for="client_code">출하번호</label> 
							<input class="form-control" type="text"  
							name="code" id="code" readonly required="required" value="${List.code }">
						</div>
					<div class="col-sm-6 mb-3">
							<label style="font-weight: bold;" for="client_code">수주번호</label> 
							<input class="readonly form-control" type="text" autocomplete="off" spellcheck="false"
							name="reqs_code" id="reqs_code" required="required" value="${List.reqs_code}">
						</div>
				</div>
				<div class="row">
					<div class="col-sm-4 mb-3">
							<label style="font-weight: bold;">업체명</label> 
							<input class="form-control" type="text" readonly id="clientName" required="required"
							readonly value="${List.clientName }">
						</div>
					<div class="col-sm-4 mb-3">
							<label style="font-weight: bold;">품번</label> 
							<input class="form-control" type="text" readonly id="product" required="required"
							value="${List.product}" >
						</div>
					<div class="col-sm-4 mb-3">
							<label style="font-weight: bold;">단위</label> 
							<input class="form-control" name ="unit" type="text" readonly id="unit" 
							required="required" value="${List.unit }">
						</div>
				</div>
				<div class="row">
					<div class="col-sm-4 mb-3">
							<label style="font-weight: bold;" for="date">수주일자</label> 
							<input class="form-control " name="reqsdate" type="text" id="reqsdate"
							 autocomplete="off" required="required" readonly value="${List.reqsdate }">
						</div>
					<div class="col-sm-4 mb-3" id="returndate">
							<label style="font-weight: bold;" for="deadline" >출하일자</label> 
							<input class="readonly form-control date-picker" name="date" type="text" id="date"
							autocomplete="off" required="required"  value="${List.date }">
						</div>
					<div class="col-sm-4 mb-3">
							<label style="font-weight: bold;" for="date">납품예정일</label> 
							<input class="form-control " name="reqsdate" type="text" id="deadlineDate"
							 autocomplete="off" readonly required="required" value="${List.deadlineDate}">
						</div>
				</div>
				<div class="row">
					<div class="col-sm-4 mb-3">
							<label style="font-weight: bold;" for="amount">수주량</label> 
							<input class="form-control" name="reqsamount" id="reqsamount"
							type="number" autocomplete="off" min="1" required="required" readonly value="${List.amount }">
						</div>
					<div class="col-sm-4 mb-3" id="shipamount">
							<label style="font-weight: bold;" for="amount">출하량</label> 
							<input class="form-control" name="amount" id="amount"
							type="number" autocomplete="off" min="1" required="required" value="${List.amount }">
							<span id="message"></span>			
						</div>
					<div class="col-sm-4 mb-3">
							<label style="font-weight: bold;">재고량</label> 
							<input class="form-control" name ="stock" type="text" readonly id="stock" 
							required="required" value="${List.stock }">
						</div>
				</div>
				<div class="row" style="margin-bottom: 20px;">
					<div class="col-sm-4 mb-3">
							<label style="font-weight: bold;">창고코드</label> 
							<input class="form-control" name ="ware_code" type="text" readonly id="ware_code" 
							required="required" value="${List.ware_code }" readonly>
						</div>
					<div class="col-sm-4 mb-3">
							<label style="font-weight: bold;" for="status">수주상태</label>
								<select name="status" id="status" class="custom-select col-12" required="required">
									<option value="출하대기" <c:if test="${List.status eq '출하대기'}">selected</c:if>>출하대기</option>
									<option value="출하완료" <c:if test="${List.status eq '출하완료'}">selected</c:if>>출하완료</option>		
								</select>
						</div>
				</div>
						<input type="hidden" name="reg_date" value="${List.reg_date }">
						<input type="hidden" name="reg_emp" value="${List.reg_emp }">


				<div class="row">
					<div class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
						<button type="button" class="btn btn-secondary" onclick="window.close();">
							<b>취소</b>
						</button>
						<input type="submit" class="btn btn-success" value="등록" >
					</div>
				</div>
				<!-- 버튼 -->
			</form>
			<!-- 폼 -->
		</div>
	</div>
	<!-- 콘텐츠 끝> -->
	<%@ include file="../include/footer.jsp"%>
	

	 <script type="text/javascript">
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
			
			
		    this.submit();
		});
	 
	$(document).ready(function(){
	    $(".readonly").on('keydown paste', function(e){
	        if(e.keyCode != 9) 
	            e.preventDefault();
	    });
	    
		$("#reqs_code").click(function() {
			window.open("/shipment/searchRequest", "Request Search", "width=600,height=600,left=200,top=200");
		});
	
	});
	
	</script> 
</body>
</html>