<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/head.jsp"%>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<title>거래처 상세</title>
</head>
<body>
<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10">
			<!-- 타이틀 -->
			<div class="login-title">
				<h1 class="text-center text-primary">거래처 상세</h1>
			</div>
			<!-- 폼 -->
			<form action="/product/productInfo" method="get">
				<!-- 비입력 구간 -->
				<!-- 입력 구간 -->
				<div class="row">
					<div class="col-sm-12 mb-3">
						<!-- 필수입력내역 -->
						
								<div class="form-group">
									<label>거래처 코드</label> 
									<input class="form-control" type="text" name="code"  readonly value="${infoClient.code}">
								</div>
								<div class="form-group">
									<label>거래처명</label> 
									<input class="form-control" type="text" name="name"  readonly value="${infoClient.name}">
								</div>
								<div class="form-group">
									<label>거래처 구분</label> 
									<input class="form-control" type="text" name="type"  readonly value="${infoClient.type}">
								</div>
								<div class="form-group">
									<label>업태</label> 
									<input class="form-control" type="text" name="conditions"  readonly value="${infoClient.conditions}">
								</div>
								<div class="form-group">
									<label>종목</label> 
									<input class="form-control" type="text" name="items"  readonly value="${infoClient.items}">
								</div>
								<div class="form-group">
									<label>대표자</label> 
									<input class="form-control" type="text" name="ceo"  readonly value="${infoClient.ceo}">
								</div>
								<div class="form-group">
									<label>담당자</label> 
									<input class="form-control" type="text" name="manager"  readonly value="${infoClient.manager}">
								</div>
								<div class="form-group">
									<label>주소</label> 
									<input class="form-control" type="text" name="address"  readonly value="${infoClient.address}">
								</div>
								<div class="form-group">
									<label>상세주소</label> 
									<input class="form-control" type="text" name="address2"  readonly value="${infoClient.address2}">
								</div>
								<div class="form-group">
									<label>전화번호</label> 
									<input class="form-control" type="text" name="tel"  readonly value="${infoClient.tel}">
								</div>
								<div class="form-group">
									<label>휴대폰 번호</label> 
									<input class="form-control" type="text" name="phone"  readonly value="${infoClient.phone}">
								</div>
								<div class="form-group">
									<label>팩스 번호</label> 
									<input class="form-control" type="text" name="fax"  readonly value="${infoClient.fax}">
								</div>
								<div class="form-group">
									<label>이메일</label> 
									<input class="form-control" type="text" name="email"  readonly value="${infoClient.email}">
								</div>
								<div class="form-group">
									<label>비고</label> 
									<input class="form-control" type="text" name="note"  readonly value="${infoClient.note}">
								</div>
								<div class="form-group">
									<label>사용 여부</label> 
									<input class="form-control" type="text" name="active"  readonly value="${infoClient.active}">
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