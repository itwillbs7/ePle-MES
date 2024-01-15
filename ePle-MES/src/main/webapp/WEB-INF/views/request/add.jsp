<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/head.jsp"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<link
         href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
         rel="stylesheet"
         integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
         crossorigin="anonymous"
      />
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
		<div class="login-box bg-white box-shadow border-radius-10">
			<!-- 타이틀 -->
			<div class="login-title">
				<h1 class="text-center text-primary">수주 등록</h1>
			</div>
			<!-- 폼 -->
			<form action="" method="post" id="addForm">
				<!-- 비입력 구간 -->
				<input class="form-control" type="hidden" placeholder="수주번호" name="code" id="code" value="" >
				<!-- 입력 구간 -->
				<div class="row">
					<div class="col-sm-12 mb-3">
						<!-- 필수입력내역 -->
						<div class="form-group">
							<label for="client_code">업체코드</label> 
							<input class="form-control" type="text" placeholder="클릭 시 팝업검색창이 뜹니다" 
							name="client_code" id="client_code" readonly required="required">
						</div>
						<div class="form-group">
							<label>업체명</label> 
							<input class="form-control" type="text" readonly id="clientName" required="required">
						</div>
						<div class="form-group">
							<label for="date">수주일자</label> 
							<input class="form-control date-picker " name="date" type="text" id="date"
							placeholder="클릭 시 달력이 뜹니다" autocomplete="off" required="required">
						</div>
						<div class="form-group" id="returndate">
							<label for="deadline">납품일자</label> 
							<input class="form-control date-picker deadline" name="deadline" type="text" id="deadline"
							placeholder="클릭 시 달력이 뜹니다" autocomplete="off" required="required">
						</div>
						<div class="form-group">
							<label for="product">품번</label> <input class="form-control" name="product" id="product" 
							type="text" placeholder="클릭 시 팝업검색창이 뜹니다" readonly required="required">
						</div>
						<div class="form-group">
							<label>품명</label> <input class="form-control" type="text" readonly id="productName" required="required">
						</div>
						<div class="form-group">
							<label>단가</label> <input class="form-control" name ="currency" type="text" readonly id="currency" required="required">
						</div>
						<div class="form-group">
							<label for="amount">수주량</label> <input class="form-control" name="amount" id="amount"
							type="number" placeholder="필수입력" autocomplete="off" min="1" required="required">
						</div>
						<!-- 자동입력내역 -->
						<div class="form-group">
							<label>단위</label> <input class="form-control" name ="unit" type="text" readonly id="unit" required="required">
						</div>
						<div class="form-group">
							<label>재고량</label> <input class="form-control" name ="stock" type="text" readonly id="stock" required="required">
						</div>
						<div class="form-group">
							<label>과부족량</label> <input class="form-control" type="text" readonly value="" id="gwa" required="required">
						</div>
						<div class="form-group">
							<label for="manager">담당자코드</label> <input class="form-control" id="manager" 
							name="manager" type="text" placeholder="클릭 시 팝업검색창이 뜹니다" readonly required="required">
						</div>
						<div class="form-group">
							<label>담당자명</label> <input class="form-control" type="text" readonly id="managerName" required="required">
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

	 
	 // 과부족량 계산
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
	       	 	 gwaField.style.color = 'green'; // 폰트색 초록으로 변경
	       	 	 return;
	    	 }
	    	 if(difference <0 ){
	    		 gwaField.value = difference; 
	             gwaField.style.color = 'red'; // 폰트색 빨강으로 변경
	    		 return;
	    	 }
	    	 document.querySelector('#gwa').value = difference;
	     }
	 }
	 
	 // 수주번호 생성
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
			const year = date.getFullYear().toString().slice(-2); //올해연도 끝 2자리
			const month = String(date.getMonth() + 1).padStart(2, "0"); //이번달
			const day = String(date.getDate()).padStart(2, "0"); //오늘날짜 
			
			client = client.substr(0, 3);
			product = product.substr(0, 3);
			
			const orderNum = year+"RQ"+client+month+day+product; 
			return orderNum;
		}
	 document.querySelector('form').addEventListener('submit', function(event) {
		    // 기본 제출 이벤트를 막음
		    event.preventDefault();
	 
		var date = document.getElementById('date').value;
		var deadline = document.getElementById('deadline').value;
		// 납품일자는 수주일자 이전날짜를 선택할 수 없다
		if(deadline<date){
		$('#returndate').append('<span style="color : red; font-size : 12px"> * 납품예정일은 수주일자 이후여야 합니다 </span>');
		document.getElementById('deadline').focus();
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
	 <!-- 유효성검사 -->
	<script type="text/javascript">
	
	</script>
	<!-- 팝업 -->
	<script type="text/javascript">
	$(document).ready(function(){
	
	// 업체찾기	
		$("#client_code").click(function() {
	// 가로, 세로 설정
			window.open("/request/searchClient", "Client Search", "width=500,height=600,left=200,top=200");
		});

	
	//담당자 찾기
		$("#manager").click(function() {
	// 가로, 세로 설정
			window.open("/request/searchManager", "Manager Search", "width=500,height=600,left=200,top=200");
		});
	
	// 물품정보찾기
		$("#product").click(function() {
	// 가로, 세로 설정s
			window.open("/request/searchProduct", "Product Search", "width=500,height=600,left=200,top=200");
		});
	
	
	
	});//끝
	
	
	</script>

</body>
</html>