<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/head.jsp"%>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<title>라인 상세</title>
</head>
<body>
<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10">
			<!-- 타이틀 -->
			<div class="login-title">
				<h1 class="text-center text-primary">라인 상세</h1>
			</div>
			<!-- 폼 -->
			<form action="/line/lineInfo" method="get">
				<!-- 비입력 구간 -->
				<!-- 입력 구간 -->
				<div class="row">
					<div class="col-sm-12 mb-3">
						<!-- 필수입력내역 -->
						
								<div class="form-group">
									<label>라인 코드</label> 
									<input class="form-control" type="text" name="code"  readonly value="${infoLine.code}">
								</div>
								<div class="form-group">
									<label>라인명</label> 
									<input class="form-control" type="text" name="name"  readonly value="${infoLine.name}">
								</div>
								<div class="form-group">
									<label>공정</label> 
									<input class="form-control" type="text" name="process"  readonly value="${infoLine.process}">
								</div>
								<div class="form-group">
									<label>작업장</label> 
									<input class="form-control" type="text" name="place"  readonly value="${infoLine.place}">
								</div>
								<div class="form-group">
									<label>설비상태</label> 
									<input class="form-control" type="text" name="status"  readonly value="${infoLine.status}">
								</div>
								<div class="form-group">
									<label>비고</label> 
									<textarea class="form-control" name="note" rows="2" readonly>${infoLine.note}</textarea>
								</div>
								<div class="form-group">
									<label>사용여부</label> 
									<input class="form-control" type="text" name="active"  readonly value="${infoLine.active}">
								</div>
  
				<!-- 버튼 -->
				<div class="row">
					<div class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
						<button type="button" class="btn btn-secondary" onclick="window.close();"><b>닫기</b></button>
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

	
	</script>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>