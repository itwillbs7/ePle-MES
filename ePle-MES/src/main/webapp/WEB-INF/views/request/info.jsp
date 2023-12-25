<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/head.jsp"%>
<title>수주정보</title>
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
							<label>수주번호</label> 
							<input class="form-control" type="text"  name="code" id="code" readonly>
						</div>
						<div class="form-group">
							<label>업체코드</label> 
							<input class="form-control" type="text"  name="client_code" id="client_code" readonly>
						</div>
						<div class="form-group">
							<label>수주일자</label> 
							<input class="form-control date-picker" name="date" type="text" id="date-picker" readonly>
						</div>
						<div class="form-group">
							<label>납품일자</label> 
							<input class="form-control date-picker" name="deadline" type="text"  readonly>
						</div>
						<div class="form-group">
							<label>담당자코드</label> <input class="form-control" name="manager" type="text"  readonly>
						</div>
						<div class="form-group">
							<label>품번</label> <input class="form-control" name="product" type="text" readonly>
						</div>
						<div class="form-group">
							<label>수주량</label> <input class="form-control" name="amount" type="text" readonly>
						</div>
						<!-- 자동입력내역 -->
						<div class="form-group">
							<label>업체명</label> <input class="form-control" type="text" readonly>
						</div>
						<div class="form-group">
							<label>담당자명</label> <input class="form-control" type="text" readonly>
						</div>
						<div class="form-group">
							<label>품명</label> <input class="form-control" type="text" readonly>
						</div>
						<div class="form-group">
							<label>단위</label> <input class="form-control" name ="unit" type="text" readonly>
						</div>
						<div class="form-group">
							<label>재고량</label> <input class="form-control" name ="stock" type="text" readonly>
						</div>
						<div class="form-group">
							<label>과부족량</label> <input class="form-control" type="text" readonly>
						</div>
						<div class="form-group">
							<label>단가</label> <input class="form-control" name ="currency" type="text" readonly>
						</div>


				<!-- 버튼 -->
				<div class="row">
					<div class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
						<button type="button" class="btn btn-secondary" onclick="window.close();">
							<b>취소</b>
						</button>
						<input type="button" class="btn btn-success" onclick="finished()" value="등록">
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
</body>
</html>