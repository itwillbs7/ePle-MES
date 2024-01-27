<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/head.jsp"%>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<title>출하 관리</title>
</head>
<body>
<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10" style="max-width:600px; padding: 20px 15px;">
			<!-- 타이틀 -->
			<div class="login-title" style="margin-bottom: 20px;">
				<h1 class="text-center text-primary">출하명령 상세보기 </h1>
			</div>
			<!-- 폼 -->
			<form action="/shipment/update" method="get" id="addForm">
				<!-- 입력 구간 -->
				<div class="row">
					<div class="col-sm-6 mb-3">
							<label style="font-weight: bold;" for="client_code">출하번호</label> 
							<input class="form-control" type="text"  
							name="code" id="code" readonly required="required" value="${vo.code }">
						</div>
					<div class="col-sm-6 mb-3">
							<label style="font-weight: bold;" for="client_code">수주번호</label> 
							<input class="form-control" type="text"  
							name="reqs_code" id="reqs_code" readonly required="required" value="${vo.reqs_code}">
						</div>
				</div>
				<div class="row">
					<div class="col-sm-4 mb-3">
							<label style="font-weight: bold;">업체명</label> 
							<input class="form-control" type="text" readonly id="clientName" required="required"
							readonly value="${rvo.clientName }" name="clientName">
						</div>
					<div class="col-sm-4 mb-3">
							<label style="font-weight: bold;">품번</label> 
							<input class="form-control" name = "product" type="text" readonly id="product" required="required"
							value="${rvo.product}" >
						</div>
					<div class="col-sm-4 mb-3">
							<label style="font-weight: bold;">단위</label> 
							<input class="form-control" name ="unit" type="text" readonly id="unit" 
							required="required" value="${rvo.unit }">
						</div>
				</div>
				<div class="row">
					<div class="col-sm-4 mb-3">
							<label style="font-weight: bold;" for="date">수주일자</label> 
							<input class="form-control " name="reqsdate" type="text" id="reqsdate"
							 autocomplete="off" required="required" readonly value="${rvo.date }">
						</div>
					<div class="col-sm-4 mb-3">
							<label style="font-weight: bold;" for="deadline">출하일자</label> 
							<input class="form-control " name="date" type="date" id="date"
							autocomplete="off" required="required" readonly value="${vo.date }">
						</div>
					<div class="col-sm-4 mb-3">
							<label style="font-weight: bold;" for="date">납품예정일</label> 
							<input class="form-control " name="deadlineDate" type="text" id="deadlineDate"
							 autocomplete="off" required="required" readonly value="${rvo.deadline}">
						</div>
				</div>
				<div class="row">
					<div class="col-sm-4 mb-3">
							<label style="font-weight: bold;" for="amount">수주량</label> 
							<input class="form-control" name="reqsamount" id="reqsamount"
							type="number" autocomplete="off" min="1" required="required" readonly value="${rvo.amount }">
						</div>
					<div class="col-sm-4 mb-3">
							<label style="font-weight: bold;">재고량</label> 
							<input class="form-control" name ="stock" type="text" readonly id="stock" 
							required="required" value="${vo.stock }">
						</div>
					<div class="col-sm-4 mb-3">
							<label style="font-weight: bold;" for="amount">출하량</label> 
							<input class="form-control" name="amount" id="amount" readonly 
							type="number" readonly autocomplete="off" min="1" required="required" value="${vo.amount }">
						</div>
				</div>
				<div class="row">
					<div class="col-sm-4 mb-3">
							<label style="font-weight: bold;">창고코드</label> 
							<input class="form-control" name ="ware_code" type="text" readonly id="ware_code" 
							required="required" value="${vo.ware_code }">
						</div>
					<div class="col-sm-4 mb-3">
							<label style="font-weight: bold;">출하상태</label> 
							<input class="form-control" name ="status" type="text" readonly id="status" 
							required="required" value="${vo.status }">
						</div>
				</div>
				<hr>
				<div class="row" style="margin-bottom: 20px;">
					<div class="col-sm-3 mb-3">
						<label style="font-weight: bold;">작성일자</label> 
						<input class="form-control" type="text" readonly value="${vo.reg_date }" id="reg_date">
					</div>
					<div class="col-sm-3 mb-3">
						<label style="font-weight: bold;">작성자 아이디</label> 
						<input class="form-control" type="text" readonly value="${vo.reg_emp }">
					</div>
					<div class="col-sm-3 mb-3">
						<label style="font-weight: bold;">수정일자</label> 
						<input class="form-control" type="text" readonly value="${vo.update_date }" id="update_date">
					</div>
					<div class="col-sm-3 mb-3">
						<label style="font-weight: bold;">수정자 아이디</label> 
						<input class="form-control" type="text" readonly value="${vo.update_emp }">
					</div>
				</div>

				<!-- 버튼 -->
						<div class="row">
							<div class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
								<button type="button" class="btn btn-secondary" onclick="window.close();">
									<b>취소</b>
								</button>
								<input type="submit" class="btn btn-success" value="수정"  id="update">
								<c:if test="${vo.status.equals('출하완료') }">
								<input type="button" class="btn btn-danger" value="반품등록"  id="returns">
								</c:if>
							</div>
						</div>
						
							

				<!-- 버튼 -->
			</form>
			<!-- 폼 -->
		</div>
	</div>
	<!-- 콘텐츠 끝> -->
	<script type="text/javascript">
	var reg_date = "${vo.reg_date}";
	var date = reg_date.split(" ")[0];
	document.getElementById("reg_date").value = date;
	
	var update_date ="${vo.update_date}";
	var update = update_date.split(" ")[0];
	document.getElementById("update_date").value = update;
	
	$(document).ready(function(){
		
		 var code = document.getElementById('code').value;

		$("#returns").click(function() {
					location.href="/returns/add?code="+code;
				});
		
		
	});
	
	</script>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>