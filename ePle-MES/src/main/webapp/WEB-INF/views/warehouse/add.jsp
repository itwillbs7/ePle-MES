<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/head.jsp"%>
<title>창고 등록</title>
</head>
<body>
	<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10">
			<!-- 타이틀 -->
			<div class="login-title">
				<h1 class="text-center text-primary">창고 등록</h1>
			</div>
			<!-- 폼 -->
			<form action="" method="post">
				<!-- 비입력 구간 -->
				<input class="form-control" type="hidden" placeholder="창고코드" name="code" id="code" value="" >
				<!-- 입력 구간   -->
				<div class="row">
					<div class="col-sm-12 mb-3">

						<div class="form-group">
							<label>주소지</label> 
							<input class="form-control" name="location" type="text" placeholder="" required>
						</div>
						<div class="form-group">
							<label>창고유형</label> 
							<select class="form-control" name="group_id" required>
							<option value="" disabled selected></option>
							<option value="" disabled selected></option>
							</select>
						</div>
						<div class="form-group">
							<label>창고명</label> 
							<input class="form-control" name ="group_name" type="text" placeholder="" required>
						</div>
						<div class="form-group">
							<label>담당자</label> 
							<input class="form-control" name="manager" type="text" placeholder="" required>
						</div>
						<div class="form-group">
							<label>연락처</label> 
							<input class="form-control" name="mng_phone" type="text" placeholder="" required>
						</div>
						<div class="form-group">
							<label>사용여부</label> 
							<select class="form-control" name="active" required>
							<option value="" disabled selected></option>
							<option value="" disabled selected></option>
							</select>
						</div>

				<!-- 버튼 -->
				<div class="row">
					<div class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
						<button type="button" class="btn btn-secondary" onclick="window.close();">
							<b>취소</b>
						</button>
						<button type="submit" class="btn btn-success" onclick="window.close();">
							<b>등록</b>
						</button>
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
	
	<script type="text/javascript">
	$(document).ready(function(){
		
	$("#").click(function() {
		// 가로, 세로 설정
		openPage("", 500, 600);
	});
	
	$("#").click(function() {
		// 가로, 세로 설정
		openPage("", 400, 700);
	});
	
	
		// 상품번호 생성
	function createOrderNum() {
		  const year = date.getFullYear();
		  const month = String(date.getMonth() + 1).padStart(2, "0");
		  const day = String(date.getDate()).padStart(2, "0");

		return "code1234"; // 총 8자리 숫자
	}
	
	// 상품번호(merchant_uid)
	const code = createOrderNum();
	document.getElementById('code').value = code;
	

	
	});
	</script>
</body>
</html>