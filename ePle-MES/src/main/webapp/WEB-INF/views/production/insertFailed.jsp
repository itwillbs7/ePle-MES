<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/head.jsp"%>
<title>불량정보 추가</title>
<link rel="stylesheet" href="../resources/src/plugins/air-datepicker/dist/css/datepicker.css">
<script src="../resources/src/plugins/air-datepicker/dist/js/datepicker.js"></script>
<script src="../resources/src/plugins/air-datepicker/dist/js/i18n/datepicker.ko.js"></script>
<!-- CSS -->
<link rel="stylesheet" type="text/css" href="../resources/src/plugins/ion-rangeslider/css/ion.rangeSlider.css" />
</head>
<body>
	<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10">
			<!-- 타이틀 -->
			<div class="login-title">
				<h1 class="text-center text-primary">불량정보 추가</h1>
			</div>
			<!-- 폼 -->
			<form method="post" id="insertForm">
				<!-- 카테고리 -->
				<div class="row">
					<div class="col-sm-12 mb-3">
						<div class="form-group">
							<label><b>실적 정보</b></label>
							<input class="form-control required" type="text" placeholder="실적 정보" name="result_code" id="result_code" value="${code }" readonly>
						</div>
						<div class="form-group">
							<label><b>제품</b></label>
							<input class="form-control" type="text" placeholder="제품" readonly id="product" value="${product }">
						</div>
						<div class="form-group">
								<label><b>수량</b></label>
								<input type="number" id="amount_input" class="form-control required" min="1" name="amount" autocomplete="off"/>
						</div>
					</div>
				</div>
				<!-- 입력 구간 -->
				<div class="row">
					<div class="col-sm-12 mb-3">
						<!-- examples -->
						<div class="form-group">
							<label><b>오류분류</b></label>
							<select class="custom-select2 form-control required" name="code_id" style="width: 100%; height: 38px">
								<!-- 공통 코드로 받아오기 -->
								<c:forEach items="${code_idList }" var="code_id">
									<option value="${code_id }">${code_id }</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label><b>상세내용</b></label>
							<textarea class="form-control" name="content"></textarea>
						</div>
						<div class="form-group">
							<label><b>처치사항</b></label>
							<textarea class="form-control" name="action"></textarea>
						</div>
						<!-- 세션에서 받아오기 -->
						<div class="form-group">
							<label><b>등록자</b></label>
							<input class="form-control required" type="text" placeholder="등록자 정보가 없습니다" readonly value="관리자1" name="reg_emp">
						</div>
						<!-- 세션에서 받아오기 -->
						<!-- examples end -->
					</div>
				</div>
				<!-- 입력 구간 -->

				<!-- 버튼 -->
				<div class="row">
					<div class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
						<button type="button" class="btn btn-secondary" onclick="window.close();">
							<b>취소</b>
						</button>
						<button type="submit" class="btn btn-success" id="submit" disabled>
							<b>등록</b>
						</button>
					</div>
				</div>
				<!-- 버튼 -->
			</form>
			<!-- 폼 -->
		</div>
	</div>
	<!-- 콘텐츠 끝> -->
	<%@ include file="../include/footer.jsp"%>
	<!-- js -->
	<script src="../resources/src/plugins/ion-rangeslider/js/ion.rangeSlider.min.js"></script>
	<script src="../resources/vendors/scripts/range-slider-setting.js"></script>
	<!-- 필수입력 체크 시작-->
	<script type="text/javascript">
	//필수입력 클래스 요소 변경시 
	$('.required').on("change",function () {
		//등록버튼 활성화
		$('#submit').attr("disabled",false);
		//필수입력 클래스 요소 중 빈 값이 있을 시 다시 등록버튼 비활성화
		$('.required').each(function () {
			if(this.value == ""){
				$('#submit').attr("disabled",true);
			}
		});
	});
	</script>
	<!-- 필수입력 체크 끝-->
	<!-- submit시 시작 -->
	<script type="text/javascript">
		$("#insertForm").submit(function(e) {
			e.preventDefault();
			$.ajax({
			    type: "POST",
			    url: "/production/insertFailed",
			    data: $(this).serialize(),
			    success: function() {
			    	window.opener.postMessage("refresh", "*");
			        window.close();
			    },
			    error: function() {
			    	alert("error");
			    }
			});
		});
	</script>
	<!-- submit시 끝 -->
</body>
</html>