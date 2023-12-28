<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/head.jsp"%>
<title>작업지시 추가</title>

<!-- CSS -->
<link rel="stylesheet" type="text/css" href="../resources/src/plugins/ion-rangeslider/css/ion.rangeSlider.css" />
</head>
<body>
	<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10">
			<!-- 타이틀 -->
			<div class="login-title">
				<h1 class="text-center text-primary">작업지시 추가</h1>
			</div>
			<!-- 폼 -->
			<form action="/production/insertInstruction" method="post">
				<!-- 카테고리 -->
				<div class="row">
					<div class="col-sm-12 mb-3">
						<div class="form-group">
							<label><b>수주정보</b></label>
							<input class="form-control" type="text" placeholder="수주정보" name="request" id="request" readonly="readonly" required="required">
							<button type="button" class="btn btn-success" onclick="">
								<b>수주정보 조회</b>
							</button>
						</div>
						<div class="form-group">
							<label><b>제품</b></label>
							<input class="form-control" type="text" placeholder="제품" required="required" readonly="" name="product">
						</div>
						<div class="form-group">
							<label>수량</label>
							<!-- 슬라이드바 -->
							<div class="pd-20 card-box mb-30">
								<h4 class="h4 pb-10">수량</h4>
								<div class="row">
									<div class="col-md-6 mb-30 mb-md-0">
										<input id="amount" />
									</div>
								</div>
							</div>
							<!-- 슬라이드바 -->
						</div>
					</div>
				</div>
				<!-- 입력 구간 -->
				<div class="row">
					<div class="col-sm-12 mb-3">
						<!-- examples -->
						<div class="form-group">
							<label><b>라인코드</b></label>
							<select class="custom-select2 form-control" name="line_code" style="width: 100%; height: 38px" required="required">
								<!-- 공통 코드로 받아오기 -->
								<c:forEach items="${line_codeList }" var="line_code">
									<option value="${line_code }">${line_code }</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label>지시사항</label>
							<textarea class="form-control" name="content"></textarea>
						</div>
						<!-- 세션에서 받아오기 -->
						<div class="form-group">
							<label>등록자</label>
							<input class="form-control" type="text" placeholder="등록자 정보가 없습니다" readonly="readonly" value="관리자1" required="required" name="reg_emp">
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
						<button type="submit" class="btn btn-success">
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
	<!-- 수주정보 조회 -->
	<script type="text/javascript">
		
	</script>
	<!-- 수주정보 변경 감지 -->
	<script type="text/javascript">
		$('#request').change(function() {
			alert('수주정보 변경');
			//변경된 수주정보에서 물품정보,수량을 받아 갱신
			
			sliderUpdate(/*amount*/);//수량정보 갱신
		});
	</script>
	<!-- 슬라이더바 초기설정 -->
	<script type="text/javascript">
		$("#amount").ionRangeSlider({
			type: "double",
			grid: false,
			min: 0,
			max: 100,
			from: 0,
			to: 1,
			prefix: "$",
			skin: "round",
			type: "single",
		});
	</script>
	<!-- 슬라이더바 업데이트 -->
	<script type="text/javascript">
		function sliderUpdate(amount) {
		    $("#amount").data("ionRangeSlider").update({
                min: 0,
                max: amount,
                from: 0,
                to: 1
            });
		}
	</script>
</body>
</html>