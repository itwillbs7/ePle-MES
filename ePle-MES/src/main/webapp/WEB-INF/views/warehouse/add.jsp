<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/head.jsp"%>
<title>수주 등록</title>
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
			<form action="" method="post">
				<!-- 비입력 구간 -->
				<input class="form-control" type="hidden" placeholder="수주번호" name="code" id="code" value="" >
				<!-- 입력 구간 -->
				<div class="row">
					<div class="col-sm-12 mb-3">
						<!-- 필수입력내역 -->
						<div class="form-group">
							<label>업체코드</label> 
							<input class="form-control" type="text" placeholder="클릭 시 팝업검색창이 뜹니다" name="client_code">
						</div>
						<div class="form-group">
							<label>수주일자</label> 
							<input class="form-control date-picker" name="date" type="text" placeholder="클릭 시 달력이 뜹니다" id="date-picker">
						</div>
						<div class="form-group">
							<label>납품일자</label> 
							<input class="form-control date-picker" name="deadline" type="text" placeholder="클릭 시 달력이 뜹니다">
						</div>
						<div class="form-group">
							<label>담당자코드</label> <input class="form-control" name="manager" type="text" placeholder="클릭 시 팝업검색창이 뜹니다">
						</div>
						<div class="form-group">
							<label>품번</label> <input class="form-control" name="product" type="text" placeholder="클릭 시 팝업검색창이 뜹니다">
						</div>
						<div class="form-group">
							<label>수주량</label> <input class="form-control" name="amount" type="text" placeholder="필수입력">
						</div>
						<!-- 자동입력내역 -->
						<div class="form-group">
							<label>업체명</label> <input class="form-control" type="text" placeholder="Johnny Brown">
						</div>
						<div class="form-group">
							<label>담당자명</label> <input class="form-control" type="text" placeholder="Johnny Brown">
						</div>
						<div class="form-group">
							<label>품명</label> <input class="form-control" type="text" placeholder="Johnny Brown">
						</div>
						<div class="form-group">
							<label>단위</label> <input class="form-control" name ="unit" type="text" placeholder="Johnny Brown">
						</div>
						<div class="form-group">
							<label>재고량</label> <input class="form-control" name ="stock" type="text" placeholder="Johnny Brown">
						</div>
						<div class="form-group">
							<label>과부족량</label> <input class="form-control" type="text" placeholder="Johnny Brown">
						</div>
						<div class="form-group">
							<label>단가</label> <input class="form-control" name ="currency" type="text" placeholder="Johnny Brown">
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