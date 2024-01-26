<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/head.jsp"%>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<title>수주 수정</title>
</head>
<body>
	<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10" style="max-width:600px; padding: 20px 15px;">
			<!-- 타이틀 -->
			<div class="login-title" style="margin-bottom: 20px;">
				<h1 class="text-center text-primary">수주 수정</h1>
			</div>
			<!-- 폼 -->
			<form action="" method="post" id="addForm">
				<!-- 입력 구간 -->
				<div class="row">
					<div class="col-sm-4 mb-3">
							<label style="font-weight: bold;">수주번호</label> 
							<input class="form-control" type="text" 
								id="code" readonly value="${List.code }" required="required">
					</div>
					<div class="col-sm-4 mb-3">
							<label style="font-weight: bold;">업체코드</label> 
							<input class="readonly form-control" type="text" id="client_code" autocomplete="off"
								placeholder="검색하기" name="client_code" spellcheck="false"
								required="required" value="${List.client_code}" >
					</div>
					<div class="col-sm-4 mb-3">
							<label style="font-weight: bold;">업체명</label> 
							<input class="form-control" type="text"
								value="${List.clientName }" readonly id="clientName"
								required="required">
					</div>
				</div>
				<div class="row">
						<div class="col-sm-4 mb-3">
							<label style="font-weight: bold;">수주일자</label> 
							<input class="readonly form-control date-picker"  
								name="date" type="text" value="${List.date }"
								placeholder="클릭 시 달력이 뜹니다" id="date" autocomplete="off"
								required="required" id="date">
						</div>
						<div class="col-sm-8 mb-3" id="returndate">
							<label style="font-weight: bold;">납품일자</label> 
							<input class="readonly form-control date-picker" name="deadline" 
								type="text" value="${List.deadline }" placeholder="클릭 시 달력이 뜹니다"
								autocomplete="off" required="required" id="deadline"
								style="max-width: 169.33px;">
						</div>
				</div>
				<div class="row">
					<div class="col-sm-4 mb-3">
							<label style="font-weight: bold;">품번</label> 
							<input class="readonly form-control" name="product" spellcheck="false"
								value="${List.product }" id="product" type="text" autocomplete="off"
								placeholder="검색하기" required="required">
						</div>
					<div class="col-sm-4 mb-3">
							<label style="font-weight: bold;">품명</label> 
							<input class="form-control" type="text"
								value="${List.productName }" readonly id="productName"
								required="required">
						</div>
					<div class="col-sm-4 mb-3">
							<label style="font-weight: bold;">단가</label> 
							<input class="form-control" name="currency"
								value="${List.currency }" type="text" readonly id="currency"
								required="required">
						</div>
				</div>
				<div class="row">
					<div class="col-sm-2 mb-3">
							<label style="font-weight: bold;">수주량</label> 
							<input class="form-control" name="amount"
								value="${List.amount }" type="number" placeholder="필수입력"
								autocomplete="off" min="1" required="required">
						</div>
					<div class="col-sm-2 mb-3">
							<label style="font-weight: bold;">단위</label> 
							<input class="form-control" name="unit" readonly
								value="${List.unit }" type="text" readonly id="unit"
								required="required">
						</div>
					<div class="col-sm-4 mb-3">
							<label style="font-weight: bold;">재고량</label> 
							<input class="form-control" name="stock"
								value="${List.stock }" type="text" readonly id="stock"
								required="required">
						</div>
					<div class="col-sm-4 mb-3">
							<label style="font-weight: bold;">과부족량</label> 
							<input class="form-control" type="text"
								value="${List.stock - List.amount }" readonly value="" id="gwa">
						</div>
				</div>
				<div class="row" style="margin-bottom: 20px;">
					<div class="col-sm-4 mb-3">
							<label style="font-weight: bold;">담당자코드</label> 
							<input class="readonly form-control" id="manager" spellcheck="false"
								value="${List.manager }" name="manager" type="text" autocomplete="off"
								placeholder="검색하기" required="required" >
						</div>
					<div class="col-sm-4 mb-3">
							<label style="font-weight: bold;">담당자명</label> 
							<input class="form-control" type="text"
								value="${List.managerName }" readonly id="managerName"
								required="required">
						</div>
					<div class="col-sm-4 mb-3">
							<label style="font-weight: bold;" for="status">수주상태</label> 
							<select name="status"
								id="status" class="custom-select col-12" required="required">
								<option value="등록"
									<c:if test="${List.status eq '등록'}">selected</c:if>>
									등록</option>
								<option value="생산진행"
									<c:if test="${List.status eq '생산진행'}">selected</c:if>>
									생산진행</option>
								<option value="출하대기"
									<c:if test="${List.status eq '출하대기'}">selected</c:if>>출하대기</option>
								<option value="출하완료"
									<c:if test="${List.status eq '출하완료'}">selected</c:if>>출하완료</option>
								<option value="수령"
									<c:if test="${List.status eq '수령'}">selected</c:if>>수령</option>
								<option value="반품"
									<c:if test="${List.status eq '반품'}">selected</c:if>>반품</option>
							</select>
						</div>
					</div>
						<input type="hidden" name="reg_date" value="${vo.reg_date }">
						<input type="hidden" name="reg_emp" value="${vo.reg_emp }">


						<!-- 버튼 -->
						<div class="row">
							<div
								class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
								<button type="button" class="btn btn-secondary"
									onclick="window.close();">
									<b>취소</b>
								</button>
								<input type="submit" class="btn btn-success" value="등록">
							</div>
						</div>
				<!-- 버튼 -->
			</form>
			<!-- 폼 -->
		</div>
	</div>
	<!-- 콘텐츠 끝> -->
	<%@ include file="../include/footer.jsp"%>

	<script type="text/javascript" class="id">
    
		document.querySelector('input[name="amount"]').addEventListener(
				'input', calculateDifference);
		document.querySelector('input[name="stock"]').addEventListener('input',
				calculateDifference);

		function calculateDifference() {
			var amount = document.querySelector('input[name="amount"]').value;
			var stock = document.querySelector('input[name="stock"]').value;
			var difference = stock - amount;
			var gwaField = document.querySelector('#gwa');

			if (!isNaN(difference)) {
				if (difference > 0) {
					document.querySelector('#gwa').value = "+" + difference;
					gwaField.style.color = 'green'; 
					return;
				}
				if (difference < 0) {
					gwaField.value = difference;
					gwaField.style.color = 'red'; 
					return;
				}
				document.querySelector('#gwa').value = difference;
			}
		}
	</script>


	<script type="text/javascript">
		document.querySelector('form').addEventListener('submit',function(event) {
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


							this.submit();
						});
	</script>
	<script type="text/javascript">

		$(document).ready(function() {

    $(".readonly").on('keydown paste', function(e){
        if(e.keyCode != 9) 
            e.preventDefault();
    });
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