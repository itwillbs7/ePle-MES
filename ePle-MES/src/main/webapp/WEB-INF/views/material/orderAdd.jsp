<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/head.jsp"%>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<title>발주서 등록</title>
<style type="text/css">
.back {
  background-color: white !important;
}
label {
font-weight: bold;
}
</style>
</head>
<body>
<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10">
			<!-- 타이틀 -->
			<div class="login-title">
				<h1 class="text-center" style="color: #7CB342;">발주서 등록</h1>
			</div>
			<!-- 폼 -->
			<form action="/material/orderAdd" method="post" id="editForm" onsubmit="return validateForm()">
				<!-- 비입력 구간 -->
				<!-- 입력 구간 -->
				<div class="row">
					<div class="col-sm-12 mb-3">
						<!-- 필수입력내역 -->
						
									<label>발주 코드</label> 
								<div class="form-group">
									<input class="form-control" type="text" name="code" id="code" value="${List.code }" readonly>
								</div>
								
									<label>품목 정보</label> 
								<div class="form-group">
									<input class="form-control" type="text" id="mapdCode" name="material" value="${List.material}" required readonly>
								</div>
								<div class="form-group">
									<input class="form-control" type="text" id="mapdName" value="${List.name }" required readonly>
								</div>
									<input class="form-control" type="hidden" id="inprice" value="${List.inprice }" required readonly>
								
									<label>발주량</label> 
								<div class="form-group">
									<input class="form-control" type="number" id="amount" name="amount" required min="1" max="2000" value="${List.amount }">
								</div>

									<label>총 발주 금액</label> 
								<div class="form-group">
									<!-- <input class="form-control back" type="text" name="price" required maxlength="100000000" onkeyup="inputNumberFormat(this);"> -->
									<input class="form-control" type="text" name="price" readonly required>
								</div>
								
									<label>거래처 정보</label> 
								<div class="form-group">
									<input class="form-control back" type="text" id="selectD" name="client_code" placeholder="거래처 코드" required readonly>
								</div>
								
								<div class="form-group">
									<input class="form-control back" type="text" id="selectE" placeholder="거래처 이름" required readonly>
								</div>

									<label>등록 일시</label> 
								<div class="form-group">
									<input class="form-control back" type="text" id="reg_date" name="reg_date" placeholder="등록 일시" readonly required>
								</div>

									<label>납기 일자</label> 
								<div class="form-group">
									<input class="form-control back date" type="date" id="order_date" name="order_date" placeholder="납기 일자" required>
								</div>
								
									<label>담당자</label> 
								<div class="form-group">
									<input class="form-control" type="text" readonly value="${sessionScope.name }">
								</div>
								<div class="form-group">
									<input class="form-control" type="hidden" readonly value="${sessionScope.code }" name="reg_emp">
								</div>


				<!-- 버튼 -->
				<div class="row">
					<div class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
						<button type="button" class="btn btn-secondary" onclick="window.close();"><b>취소</b></button>
						<input type="submit" class="btn btn-success" value="등록" id="update">
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
	window.resizeTo(outerWidth - innerWidth + 450, outerHeight - innerHeight + $(".login-box").outerHeight() + 13); 
	
	var width = 400; 
	var height = $(".login-box").outerHeight() + 13; 

	var left = (window.screen.width - width) / 2;
	var top = (window.screen.height - height) / 2;

	window.moveTo(left, top);

	
	
	function openPopup(url) {
	    var width = 410;
	    var height = 550;
	    var left = (screen.width - width) / 2;
	    var top = (screen.height - height) / 2;
	    var popupWindow = window.open(url, '_blank', "width=" + width + ", height=" + height + ", left=" + left + ", top=" + top);
	    popupWindow.focus();
	}

	$(document).ready(function() {
		// 등록 - 거래처 리스트 
	    $("#selectD,#selectE").click(function() {
	        var url = '${pageContext.request.contextPath}/material/searchClient';
	        openPopup(url);
	    });
		
	 // 등록 - 사원 리스트 
	    $("#selectA,#selectB").click(function() {
	        var url = '${pageContext.request.contextPath}/stock/searchEmployees';
	        openPopup(url);
	    });
		
	});
		
	
   
/* 	function comma(str) {
        str = String(str);
        return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
    }

    function uncomma(str) {
        str = String(str);
        return str.replace(/[^\d]+/g, '');
    } 
    
    function inputNumberFormat(obj) {
        obj.value = comma(uncomma(obj.value));
    }
    
    function inputOnlyNumberFormat(obj) {
        obj.value = onlynumber(uncomma(obj.value));
    }
    
    function onlynumber(str) {
	    str = String(str);
	    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g,'$1');
	} */
    
	</script>


	<script>
     document.addEventListener('DOMContentLoaded', function () {
        var todayInput = document.getElementById("reg_date");

        todayInput.addEventListener("click", function () {
            var today = new Date();
            var yyyy = today.getFullYear();
            var mm = String(today.getMonth() + 1).padStart(2, '0');
            var dd = String(today.getDate()).padStart(2, '0');
            var hh = String(today.getHours()).padStart(2, '0');
            var mi = String(today.getMinutes()).padStart(2, '0');
            var ss = String(today.getSeconds()).padStart(2, '0');
            var formattedDate = yyyy + "-" + mm + "-" + dd + " " + hh + ":" + mi + ":" + ss;

            todayInput.value = formattedDate;
            todayInput.readOnly = true;
            todayInput.placeholder = "";


/* 			var threeDaysLater = new Date();
				threeDaysLater.setDate(today.getDate() + 3);

			var orderDateInput = document.getElementById("order_date");

					$(orderDateInput).datepicker({
						minDate : threeDaysLater,
			//          minDate: new Date(),
						dateFormat : "yyyy-mm-dd",
					
					}); */
					
			});
		}); 
    
    
    
	var now_utc = Date.now(); 
	var timeOff = new Date().getTimezoneOffset() * 60000; 
//	var today = new Date(now_utc - timeOff).toISOString().split("T")[0];
	var tomorrow = new Date(now_utc + 24 * 60 * 60 * 1000 - timeOff).toISOString().split("T")[0]; 


	document.querySelectorAll('.date').forEach(function(input) {
		input.setAttribute('min', tomorrow); 
	});
	
	
	</script>

	<script>
	function formatNumberWithCommas(number) {
		return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}

	function calculatePrice() {
		var amount = parseFloat(document.getElementsByName("amount")[0].value);
		var inprice = parseFloat(document.getElementById("inprice").value);

		if (!isNaN(amount) && !isNaN(inprice)) {
			var price = amount * inprice;

			document.getElementsByName("price")[0].value = formatNumberWithCommas(price);
		} else {
			document.getElementsByName("price")[0].value = "";
		}
	}

	document.getElementsByName("amount")[0].addEventListener("input", calculatePrice);
	document.getElementById("inprice").addEventListener("input", calculatePrice);

	document.addEventListener('DOMContentLoaded', function() {
		calculatePrice();

		document.getElementById("editForm").addEventListener("submit",
				function(event) {
					
					var priceInput = document.getElementsByName("price")[0];
					priceInput.value = priceInput.value.replace(/,/g, "");

					return true;
				});
	});
	
	
	
	
	function validateForm() {
	    
	    var reg_date = document.getElementById("reg_date").value;
	    var order_date = document.getElementById("order_date").value;
	    var amount = document.getElementById("amount").value;
	    var selectD = document.getElementById("selectD").value;
	    var selectE = document.getElementById("selectE").value;
	  
	    if (reg_date === "" || order_date === "" || amount === "" || selectD === "" || selectE === "") {
	        alert("모든 내용을 입력해주세요!");
	        return false; 
	    }
	    return true;
	}
	
	
	</script>






	<%@ include file="../include/footer.jsp"%>
</body>
</html>