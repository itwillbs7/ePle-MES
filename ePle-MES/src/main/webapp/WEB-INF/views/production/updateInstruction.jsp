<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/head.jsp"%>
<title>작업지시 수정</title>

<!-- CSS -->
<link rel="stylesheet" type="text/css" href="../resources/src/plugins/ion-rangeslider/css/ion.rangeSlider.css" />
</head>
<body>
	<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10">
			<!-- 타이틀 -->
			<div class="login-title">
				<h1 class="text-center text-primary">작업지시 수정</h1>
			</div>
			<!-- 폼 -->
			<form method="post">
				<!-- 카테고리 -->
				<div class="row">
					<div class="col-sm-12 mb-3">
						<div class="form-group">
							<label><b>수주정보</b></label>
							<input class="form-control required" type="text" placeholder="수주정보" name="request" id="request" readonly value="${instruction.request }">
							<button type="button" class="btn btn-success" onclick="">
								<b>수주정보 조회</b>
							</button>
						</div>
						<div class="form-group">
							<label><b>제품</b></label>
							<input class="form-control required" type="text" placeholder="제품" readonly name="product" id="product" value="${instruction.product }">
						</div>
						<div class="form-group">
							<label>수량</label>
							<!-- 슬라이드바 -->
							<div class="pd-20 card-box mb-30">
								<h4 class="h4 pb-10">수량</h4>
								<div class="row">
									<div class="col-md-6 mb-30 mb-md-0">
										<input id="amount" name="amount" class="required" value="${instruction.amount }"/>
									</div>
								</div>
								<input type="number" id="amount_input" class="form-control" value="${instruction.amount }"/>
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
							<select class="custom-select2 form-control required" name="line_code" style="width: 100%; height: 38px" id="line_codeSelect">
								<!-- 공통 코드로 받아오기 -->
								<c:forEach items="${line_codeList }" var="line_code">
									<option value="${line_code }">${line_code }</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label>지시사항</label>
							<textarea class="form-control" name="content">${instruction.content }</textarea>
						</div>
						<!-- 세션에서 받아오기 -->
						<div class="form-group">
							<label>수정자</label>
							<input class="form-control required" type="text" placeholder="수정자 정보가 없습니다" readonly value="${instruction.reg_emp }" name="update_emp">
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
						<input type="button" onclick="asd()" value="asd">
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
	<!-- 수주정보 조회 시작 -->
	<script type="text/javascript">
		
	</script>
	<!-- 수주정보 조회 끝 -->
	<!-- 수주정보 변경 감지 시작 -->
	<script type="text/javascript">
		//수주 정보 변경 시
		$('#request').change(function() {
			//변경된 수주정보에서 물품정보,수량을 받아 갱신
			productUpdate("");//제품정보 갱신
			sliderUpdate(/*amount*/);//수량정보 갱신
		});
	</script>
	<!-- 수주정보 변경 감지 끝 -->
	<!-- 슬라이더바 초기설정 시작 -->
	<script type="text/javascript">
		var from = "<c:out value='${instruction.amount}'/>"
		$("#amount").ionRangeSlider({
			type: "double",
			grid: false,
			min: 0,
			max: 1000,
			from: from,
			to: 1,
			skin: "round",
			type: "single",
		});
	</script>
	<!-- 슬라이더바 초기설정 끝 -->
	<!-- 제품정보 업데이트 시작 -->
	<script type="text/javascript">
		function productUpdate(product) {
			$("#product").val(product).change();
		}
	</script>
	<!-- 제품정보 업데이트 끝 -->
	<!-- 슬라이더바 업데이트 시작 -->
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
	<!-- 슬라이더바 업데이트 끝 -->
	<!-- 슬라이더바 인풋 연동 시작 -->
	<script type="text/javascript">
		//슬라이더바 변경 시 input 연동
		$('#amount').change(function() {
			$('#amount_input').val($('#amount').val());
		});
		//input 변경 시 슬라이더바 연동
		$('#amount_input').change(function() {
			$("#amount").data("ionRangeSlider").update({
                from: $('#amount_input').val()
            });
		});
        // 엔터 키가 눌렸을 때 폼 제출 막기
		$("#amount_input").on("keydown", function(event) {
            if (event.which === 13) {
                event.preventDefault();
            }
        });
	</script>
	<!-- 슬라이더바 인풋 연동 끝 -->
	<!-- 필수입력 체크 시작-->
	<script type="text/javascript">
		function requiredCheck() {
			//등록버튼 활성화
			$('#submit').attr("disabled",false);
			//필수입력 클래스 요소 중 빈 값이 있을 시 다시 등록버튼 비활성화
			$('.required').each(function () {
				if(this.value == ""){
					$('#submit').attr("disabled",true);
				}
			});
		}
	</script>
	<!-- 필수입력 체크 끝-->
	<!-- 필수입력 상시 체크 시작 -->
	<script type="text/javascript">
	//필수입력 클래스 요소 변경시 
	$('.required').on("change",function () {
		requiredCheck();
	});
	</script>
	<!-- 필수입력 상시 체크 끝 -->
	<!-- 필수입력 1회 체크 시작-->
	<script>
		$(document).ready(function() {
			requiredCheck();
		});
	</script>
	<!-- 필수입력 1회 체크 끝-->
	<!-- 라인 선택 1회 시작 -->
	<script type="text/javascript">
		function asd() {
			alert(1);
			var line_code = "<c:out value='${instruction.line_code}'/>"
			alert(line_code);
			$('#line_codeSelect').val(line_code);
			alert($('#line_codeSelect').val());
		};
	</script>
	<!-- 라인 선택 1회 끝 -->
	
</body>
</html>