<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
      /><title>수주 수정</title>
</head>
<body>
	<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10">
			<!-- 타이틀 -->
			<div class="login-title">
				<h1 class="text-center text-primary">수주 수정</h1>
			</div>
			<!-- 폼 -->
			<form action="" method="post" id="addForm">
				<!-- 입력 구간 -->
				<div class="row">
					<div class="col-sm-12 mb-3">
						<div class="form-group">
							<label>수주번호</label> 
							<input class="form-control" type="text"  name="code" id="code" readonly 
							value="${List.code }" required="required">
						</div>
						<!-- 필수입력내역 -->
						<div class="form-group">
							<label>업체코드</label> 
							<input class="form-control" type="text" placeholder="클릭 시 팝업검색창이 뜹니다" 
							name="client_code"  readonly required="required" value="${List.client_code}">
						</div>
						<div class="form-group">
							<label>수주일자</label> 
							<input class="form-control" name="date" type="date" value="${List.date }"
							placeholder="클릭 시 달력이 뜹니다" id="date" autocomplete="off" required="required"> 
						</div>
						<div class="form-group">
							<label>납품일자</label> 
							<input class="form-control" name="deadline" type="date" value="${List.deadline }"
							placeholder="클릭 시 달력이 뜹니다" autocomplete="off" required="required">
						</div>
						<div class="form-group">
							<label>담당자코드</label> <input class="form-control" id="manager" value="${List.manager }"
							name="manager" type="text" placeholder="클릭 시 팝업검색창이 뜹니다" readonly required="required">
						</div>
						<div class="form-group">
							<label>품번</label> <input class="form-control" name="product" value="${List.product }"
							id="product" type="text" placeholder="클릭 시 팝업검색창이 뜹니다" readonly required="required">
						</div>
						<div class="form-group">
							<label>수주량</label> <input class="form-control" name="amount" value="${List.amount }"
							type="number" placeholder="필수입력" autocomplete="off" min="1" required="required">
						</div>
						<!-- 자동입력내역 -->
						<div class="form-group">
							<label>업체명</label> <input class="form-control" type="text" value="${List.clientName }"
							readonly id="clientName" required="required">
						</div>
						<div class="form-group">
							<label>담당자명</label> <input class="form-control" type="text" value="${List.managerName }"
							readonly id="managerName" required="required">
						</div>
						<div class="form-group">
							<label>품명</label> <input class="form-control" type="text" value="${List.productName }"
							readonly id="productName" required="required">
						</div>
						<div class="form-group">
							<label>단위</label> <input class="form-control" name ="unit" value="${List.unit }"
							type="text" readonly id="unit" required="required">
						</div>
						<div class="form-group">
							<label>재고량</label> <input class="form-control" name ="stock" value="${List.stock }"
							type="text" readonly id="stock" required="required">
						</div>
						<div class="form-group">
							<label>과부족량</label> <input class="form-control" type="text" value="${List.stock - List.amount }"
							readonly value="" id="gwa">
						</div>
						<div class="form-group">
							<label>단가</label> <input class="form-control" name ="currency" value="${List.currency }"
							type="text" readonly id="currency" required="required">
						</div>
						<div class="form-group">
							<label for="status">수주상태</label>
								<select name="status" id="status" class="custom-select col-12"  required="required">
									<option value="등록" <c:if test="${List.status eq '등록'}">selected</c:if>>
									등록</option>
									<option value="생산진행" <c:if test="${List.status eq '생산진행'}">selected</c:if>>
									생산진행</option>
									<option value="출하대기" <c:if test="${List.status eq '출하대기'}">selected</c:if>>출하대기</option>
									<option value="출하완료" <c:if test="${List.status eq '출하완료'}">selected</c:if>>출하완료</option>
									<option value="수령" <c:if test="${List.status eq '수령'}">selected</c:if>>수령</option>
									<option value="반품" <c:if test="${List.status eq '반품'}">selected</c:if>>반품</option>
								</select>
						</div>
						<input type="hidden" name="reg_date" value="${vo.reg_date }">
						<input type="hidden" name="reg_emp" value="${vo.reg_emp }">


				<!-- 버튼 -->
				<div class="row">
					<div class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
						<button type="button" class="btn btn-secondary" onclick="window.close();">
							<b>취소</b>
						</button>
						<input type="button" class="btn btn-success" value="등록" onclick="finished();">
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
	
	 <script type="text/javascript" class="id">  

	 
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
	 
</script>


<script type="text/javascript">
// 	 // Submit ajax
function formCheck(i){
		$(i).find('input').each(function() {
			var value = $(this).val();
			if (value === "" || value === null || value == "undefined" 
					|| (value != null && typeof value == "object" && !Object.keys(value).length)) {
				return false;
			}
		});
		
		$(i).find('select').each(function(){
			var value = $(this).data('option');
			if(value == null || value == "undefined" || value == ""){
				 return false;
			}
		});
		return true;
	}
	
	 function finished(){
	
		// 미입력 찾기
		 var form = document.getElementById('addForm');
		 if (!form.checkValidity()) {
			    var inputs = form.getElementsByTagName('input');
			    for (var i = 0; i < inputs.length; i++) {
			        if (!inputs[i].validity.valid) {
			            var label = form.querySelector('label[for="' + inputs[i].id + '"]');
			            if (label) {
			                label.innerHTML += '<span style="color: red; font-size: 12px;"> * 내용을 입력해주세요 </span>';
			            }
			            inputs[i].focus();
			            break;
			        }
			    }
			    return;
			}
		 
			
			var formdata = $("#addForm").serialize();

		 $.ajax({
			    url: '/request/update',
			    type: 'POST',
			    data:  formdata,
			    success: function(data) {
			    	Swal.fire({
			            icon: 'success',
			            title: '수주 수정 완료',
			            text: '수주내용을 수정하셨습니다',
			        }).then((result) => {
			            // SweetAlert이 닫힌 후에 수행됩니다.
			            localStorage.setItem('updateDone', 'true');
			            opener.location.reload();
			            self.close(); // 창을 닫습니다.
			        });
			    	}, // function(data) 끝
		        error: function(data){
		        	alert('실패');
		        }     
			    
			});
		 
	 }
	 
	 
	 </script>
	 <script type="text/javascript">
	$(document).ready(function(){
		
	// 업체찾기	
		$("#client_code").click(function() {
	// 가로, 세로 설정
			window.open("/request/searchClient", "Client Search", "width=500,height=600");
		});

	
	//담당자 찾기
		$("#manager").click(function() {
	// 가로, 세로 설정
			window.open("/request/searchManager", "Manager Search", "width=500,height=600");
		});
	
	// 물품정보찾기
		$("#product").click(function() {
	// 가로, 세로 설정s
			window.open("/request/searchProduct", "Product Search", "width=500,height=600");
		});
	
	
	
	});//끝
	
	
	</script> 
</body>
</html>