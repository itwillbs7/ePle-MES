<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/head.jsp"%>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<title>창고 수정</title>
</head>
<body>
<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10">
			<!-- 타이틀 -->
			<div class="login-title">
				<h1 class="text-center text-primary">창고 수정</h1>
			</div>
			<!-- 폼 -->
			<form action="/stock/warehouseEdit" method="post" id="editForm">
				<!-- 비입력 구간 -->
				<!-- 입력 구간 -->
				<div class="row">
					<div class="col-sm-12 mb-3">
						<!-- 필수입력내역 -->
						
								<div class="form-group">
									<label>창고코드</label> 
								<input class="form-control" type="text" name="code" id="code" readonly value="${List.code }">
								</div>
								
								<div class="form-group">
									<label>창고 정보</label> 
									<input class="form-control" type="text" name="category"  readonly value="${List.category}">
								</div>
								<div class="form-group">
									<input class="form-control" type="text" name="wh_name"  readonly value="${List.wh_name}">
								</div>
								<div class="form-group">
									<input class="form-control" type="text" name="location"  readonly value="${List.location}">
								</div>

								<div class="form-group">
									<label>관리자 정보</label> 
									<input class="form-control" type="hidden" id="selectA" name="manager">
									<input class="form-control" type="text" id="selectB" readonly value="${List.name}">
								</div>
								<div class="form-group">
									<input class="form-control" type="text" id="selectC" name="mng_phone" readonly value="${List.phone}">
								</div>


				<!-- 버튼 -->
				<div class="row">
					<div class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
						<button type="button" class="btn btn-secondary" onclick="window.close();"><b>취소</b></button>
						<input type="submit" class="btn btn-success" value="수정" id="update">
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
	function openPopup(url) {
	    var width = 550;
	    var height = 550;
	    var left = (screen.width - width) / 2;
	    var top = (screen.height - height) / 2;
	    var popupWindow = window.open(url, '_blank', "width=" + width + ", height=" + height + ", left=" + left + ", top=" + top);
	    popupWindow.focus();
	}
	$(document).ready(function() {
		// 등록 - 사원 리스트 (자재부)
	    $("#selectB,#selectC").click(function() {
	        var url = '${pageContext.request.contextPath}/stock/searchEmployees';
	        openPopup(url);
	    });
	 
	});
	
	</script>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>