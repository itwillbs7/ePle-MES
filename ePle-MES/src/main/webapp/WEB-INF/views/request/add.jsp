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
				<input class="form-control" type="hidden" value="test" placeholder="수주번호" name="code">
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
						<button type="submit" class="btn btn-success">
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
		
	$("#add").click(function() {
		// 가로, 세로 설정
		openPage("/request/add", 500, 600);
	});
	
	
	// 수주번호 생성하기
	// 당해 YY + OD(Order Detail)+ 수주업체코드 + MMDD+ 물품코드 +인덱스 3자리(001부터)
	function makeCode(){
		const year = date.getFullYear().toString().slice(-2);
		const month = String(date.getMonth() + 1).padStart(2, "0");
		const day = String(date.getDate()).padStart(2, "0");
		
		const corpCode;
		const prodCode;
		
		const result = ${year}+"RQ"+${month}+${day}+"01";
		return result;
	}
	
	// 수주번호
	const sujuCode = makeCode();
	document.getElementById("sujuCode").value = sujuCode;

	// 날자형식
	$('#date-picker input').datepicker({
	    format: "yy/dd/mm",
	    language: "ko"
	});
	
	});
	</script>
</body>
</html>