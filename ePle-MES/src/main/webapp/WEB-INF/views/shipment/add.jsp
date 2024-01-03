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
<title>출하 등록</title>
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
				<input class="form-control" type="hidden" placeholder="출하번호" name="code" id="code" value="" >
				<!-- 입력 구간 -->
				<div class="row">
					<div class="col-sm-12 mb-3">
						<!-- 필수입력내역 -->
						<div class="form-group">
							<label for="client_code">수주번호</label> 
							<input class="form-control" type="text" placeholder="클릭 시 팝업검색창이 뜹니다" 
							name="reqs_code" id="reqs_code" readonly required="required">
						</div>
						<div class="form-group">
							<label for="deadline">출하일자</label> 
							<input class="form-control " name="date" type="date" id="date"
							placeholder="클릭 시 달력이 뜹니다" autocomplete="off" required="required">
						</div>
						<div class="form-group">
							<label for="amount">출하량</label> <input class="form-control" name="amount" id="amount"
							type="number" placeholder="출하량을 입력해주세요" autocomplete="off" min="1" required="required">
						</div>
						<!-- 자동입력내역 -->
						<div class="form-group">
							<label for="amount">수주량</label> 
							<input class="form-control" name="reqsamount" id="reqsamount"
							type="number" autocomplete="off" min="1" required="required" readonly>
						</div>
						<div class="form-group">
							<label for="date">수주일자</label> 
							<input class="form-control " name="reqsdate" type="text" id="reqsdate"
							 autocomplete="off" required="required" readonly>
						</div>
						<div class="form-group">
							<label>업체명</label> 
							<input class="form-control" type="text" readonly id="clientName" required="required"
							readonly>
						</div>
						<div class="form-group">
							<label>품번</label> 
							<input class="form-control" type="text" readonly id="product" required="required">
						</div>
						<div class="form-group">
							<label>단위</label> 
							<input class="form-control" name ="unit" type="text" readonly id="unit" required="required">
						</div>
						<div class="form-group">
							<label>재고량</label> 
							<input class="form-control" name ="stock" type="text" readonly id="stock" required="required">
							<input class="form-control" name ="ware_code" type="hidden" readonly id="ware_code" required="required">
							<input class="form-control" name ="stock_code" type="hidden" readonly id="stock_code" required="required">
						</div>


				<!-- 버튼 -->
				<div class="row">
					<div class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
						<button type="button" class="btn btn-secondary" onclick="window.close();">
							<b>취소</b>
						</button>
						<input type="button" class="btn btn-success" value="등록" onclick="finished()" id="sa-custom-position">
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

	 // 출하일자 min 설정
	 document.getElementById('reqsdate').addEventListener('change', function() {
  		document.getElementById('date').min = this.value;
	});
	 
 
	 // 출하번호 생성 당해연도 YY+OT(Out)+MMDD+출고창고코드+출하인덱스 3자리(001부터)
	 // 24OT0101a23001
	 let ware_code;
	 
	 document.querySelector('input[name="ware_code"]').addEventListener('input', function() {
		 ware_code = this.value; 
		});
	 
	 function createOrderNum() {
			const date = new Date();
			const year = date.getFullYear().toString().slice(-2); //올해연도 끝 2자리
			const month = String(date.getMonth() + 1).padStart(2, "0"); //이번달
			const day = String(date.getDate()).padStart(2, "0"); //오늘날짜 
			
			const orderNum = year+"OT"+month+day+ware_code; 
			return orderNum;
		}
	 </script>
	 <!-- ajax -->
	 <script type="text/javascript" id="ajaxForSubmit">
	 function finished(){
		 
			document.querySelector('#code').value = createOrderNum();
			
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
			    
			$.ajax({
			    type: "POST",
			    url: '/shipment/add', // 폼을 제출할 서버의 URL
			    data: $("#addForm").serialize(), // 'addForm' ID를 가진 폼의 데이터를 직렬화
			    success: function(data) {
			    	Swal.fire({
			            icon: 'success',
			            title: '출하 등록 완료',
			            text: '출하명령을 등록하셨습니다',
			        }).then((result) => {
			            // SweetAlert이 닫힌 후에 수행됩니다.
			            localStorage.setItem('success', 'true');
			            opener.location.reload();
			            self.close(); // 창을 닫습니다.
			        });
			    },
			    error: function(jqXHR, textStatus, errorThrown) {
			        // 폼 제출에 실패하면
			        alert('폼 제출에 실패했습니다: ' + textStatus);
			    }
			});
	 }
	 
	</script> 
	<!-- 팝업 -->
	<script type="text/javascript">
	$(document).ready(function(){
	
	// 수주번호 찾기	
		$("#reqs_code").click(function() {
	// 가로, 세로 설정
			window.open("/shipment/searchRequest", "Request Search", "width=500,height=600");
		});
	
	
	});//끝
	
	
	</script>

</body>
</html>