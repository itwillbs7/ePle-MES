<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/head.jsp"%>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<title>수주 등록</title>
<style>
::-webkit-calendar-picker-indicator{
display : none;
}

</style>
</head>
<body>
	<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10" style="max-width:600px; padding: 20px 15px;">
			<!-- 타이틀 -->
			<div class="login-title" style="margin-bottom: 20px;">
				<h1 class="text-center text-primary">수주 등록</h1>
			</div>
			<!-- 폼 -->
			<form action="" method="post" id="addForm">
				<!-- 비입력 구간 -->
				<input class="form-control" type="hidden" placeholder="수주번호" name="code" id="code" value="" >
				<!-- 입력 구간 -->
				<div class="row">
					<div class="col-sm-4 mb-3">
							<label for="client_code" style="font-weight: bold;">업체코드</label> 
							<input class="readonly form-control" type="text" placeholder="검색하기" autocomplete="off"
							name="client_code" id="client_code" required="required" spellcheck="false">
					</div>
					<div class="col-sm-4 mb-3">
							<label style="font-weight: bold;">업체명</label> 
							<input class="form-control" type="text" readonly id="clientName"
							 required="required">
						</div>
				</div>
				<div class="row">
					<div class="col-sm-4 mb-3">
							<label style="font-weight: bold;" for="date">수주일자</label> 
							<input class="readonly form-control date-picker " name="date" type="text" id="date"
							placeholder="클릭 시 달력이 뜹니다" autocomplete="off" required="required" >
						</div>
						<div class="col-sm-8 mb-3" id="returndate">
							<label style="font-weight: bold;" for="deadline">납품일자</label> 
							<input class="readonly form-control date-picker deadline" name="deadline" type="text" id="deadline"
							 style="max-width: 169.33px;" placeholder="클릭 시 달력이 뜹니다" autocomplete="off" required="required">
						</div>
				</div>
				<div class="row">
					<div class="col-sm-4 mb-3">
							<label style="font-weight: bold;" for="product">품번</label> 
							<input class="readonly form-control" name="product" id="product" spellcheck="false"
							type="text" placeholder="검색하기" required="required" autocomplete="off">
						</div>
					<div class="col-sm-4 mb-3">
							<label style="font-weight: bold;">품명</label> 
							<input class="form-control" type="text" readonly id="productName" required="required">
						</div>
					<div class="col-sm-4 mb-3">
							<label style="font-weight: bold;">단가</label> 
							<input class="form-control" name ="currency" type="text" readonly id="currency" required="required">
						</div>
				</div>
				<div class="row">
					<div class="col-sm-2 mb-3">
							<label style="font-weight: bold;" for="amount">수주량</label> 
							<input class="form-control" name="amount" id="amount"
							type="number" placeholder="필수입력" autocomplete="off" min="1" required="required">
						</div>
					<div class="col-sm-2 mb-3">
							<label style="font-weight: bold;">단위</label> 
							<input class="form-control" name ="unit" type="text" readonly id="unit" required="required">
						</div>
					<div class="col-sm-4 mb-3">
							<label style="font-weight: bold;">재고량</label> 
							<input class="form-control" name ="stock" type="text" readonly id="stock" required="required">
						</div>
					<div class="col-sm-4 mb-3">
							<label style="font-weight: bold;">과부족량</label> 
							<input class="form-control" type="text" readonly value="" id="gwa" required="required">
						</div>
				</div>
				<div class="row">
					<div class="col-sm-4 mb-3">
							<label style="font-weight: bold;" for="manager">담당자코드</label> 
							<input class="readonly form-control" id="manager" spellcheck="false" autocomplete="off"
							name="manager" type="text" placeholder="검색하기" required="required">
						</div>
					<div class="col-sm-4 mb-3">
							<label style="font-weight: bold;">담당자명</label> 
							<input class="form-control" type="text" readonly id="managerName" required="required">
						</div>
				</div>

				<!-- 버튼 -->
				<div class="row">
					<div class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
						<button type="button" class="btn btn-secondary" onclick="window.close();">
							<b>취소</b>
						</button>
						<input type="submit" class="btn btn-success" value="등록"  id="sa-custom-position">
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
	    $(".readonly").on('keydown paste', function(e){
	        if(e.keyCode != 9) 
	            e.preventDefault();
	    });

	 document.querySelector('input[name="amount"]').addEventListener('input', calculateDifference);
	 document.querySelector('input[name="stock"]').addEventListener('input', calculateDifference);

	 function calculateDifference() {
	     var amount = document.querySelector('input[name="amount"]').value;
	     var stock = document.querySelector('input[name="stock"]').value;
	     var difference = stock - amount;
	     var gwaField = document.querySelector('#gwa');

	     if (!isNaN(difference)) {
	    	 if(difference > 0){
	        	 document.querySelector('#gwa').value = "+"+difference;
	       	 	 gwaField.style.color = 'green'; 
	       	 	 return;
	    	 }
	    	 if(difference <0 ){
	    		 gwaField.value = difference; 
	             gwaField.style.color = 'red'; 
	    		 return;
	    	 }
	    	 document.querySelector('#gwa').value = difference;
	     }
	 }
	 
	 let client;
	 let product;
	 
	 document.querySelector('input[name="client_code"]').addEventListener('input', function() {
		 client = this.value; 
		});
	 document.querySelector('input[name="product"]').addEventListener('input', function() {
		 product = this.value; 
		});
	 
	 function createOrderNum() {
			const date = new Date();
			const year = date.getFullYear().toString().slice(-2); 
			const month = String(date.getMonth() + 1).padStart(2, "0"); 
			const day = String(date.getDate()).padStart(2, "0"); 
			
			client = client.substr(0, 3);
			product = product.substr(0, 3);
			
			const orderNum = year+"RQ"+client+month+day+product; 
			return orderNum;
		}
	 
	 document.querySelector('form').addEventListener('submit', function(event) {
		    event.preventDefault();
	 
		var date = document.getElementById('date').value;
		var deadline = document.getElementById('deadline').value;
		
		if (deadline < date) {
		    var returnDateElement = $('#returndate');
		    if (returnDateElement.find('span').length === 0) {
		        returnDateElement.append('<span style="color : red; font-size : 12px"> * 납품예정일은 수주일자 이후여야 합니다 </span>');
		    }
		    document.getElementById('deadline').focus();
		    return;
		}
		    
		    const orderNum = createOrderNum();
		    
		    document.querySelector('input[name="code"]').value = orderNum;
		    
		    this.submit();
		});
	 </script>
	<script type="text/javascript">
	$(document).ready(function(){
	
		$("#client_code").click(function() {
			window.open("/request/searchClient", "Client Search", "width=500,height=600,left=200,top=200");
		});
	
		$("#manager").click(function() {
			window.open("/request/searchManager", "Manager Search", "width=500,height=600,left=200,top=200");
		});
	
		$("#product").click(function() {
			window.open("/request/searchProduct", "Product Search", "width=500,height=600,left=200,top=200");
		});

	});
	
	
	</script>

</body>
</html>