<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/head.jsp"%>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<title>발주 요청</title>
</head>
<body>
<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10">
			<!-- 타이틀 -->
			<div class="login-title">
				<h1 class="text-center text-primary">발주 요청</h1>
			</div>
			<!-- 폼 -->
			<form action="/material/askOrderEdit" method="post" id="editForm">
				<!-- 비입력 구간 -->
				<!-- 입력 구간 -->
				<div class="row">
					<div class="col-sm-12 mb-3">
						<!-- 필수입력내역 -->
						
								<div class="form-group">
									<label>발주 코드</label> 
								<input class="form-control" type="text" name="code" id="code" value="${List.code }" readonly>
								</div>
								
								<div class="form-group">
									<!-- <label>자재 유형</label>  -->
								</div>

								<div class="form-group">
									<label>품목 정보</label> 
									<input class="form-control" type="text" id="mapdCode" name="material" placeholder="품목코드"  value="${List.material}" readonly>
									<input class="form-control" type="text" id="mapdName" placeholder="품명"  value="${List.name }" readonly>
								</div>
								<div class="form-group">
									<label>요청량</label> 
									<input class="form-control" type="number" name="amount" required min="1" max="100" placeholder="요청량" value="${List.amount }" oninput="{(e:any) ->{if(e.target.value > 0){if(e.target.value > 100) e.target.value = 99;}else{e.target.value = 1;}}}">
								</div>

								<div class="form-group">
									<label>신청 일자</label> 
									<input class="form-control" type="text" id="" placeholder="" value="${List.date}" readonly>
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
		// 등록 - 품목 리스트 (원자재)
	    $("#mapdCode,#mapdName").click(function() {
	        var url = '${pageContext.request.contextPath}/material/searchMAPD';
	        openPopup(url);
	    });
	 
	});
		
	
		
	</script>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>