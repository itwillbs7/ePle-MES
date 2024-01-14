<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/head.jsp"%>
<title>작업지시 추가</title>
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
				<h1 class="text-center text-primary">작업지시 추가</h1>
			</div>
			<!-- 폼 -->
			<form method="post" id="insertForm">
				<!-- 카테고리 -->
				<div class="row">
					<div class="col-sm-12 mb-3">
						<div class="form-group">
							<label><b>* 수주정보</b></label>
							<div style="display: flex;">
								<input class="form-control required" type="text" placeholder="수주정보" name="request" id="request" readonly style="width: 65%; box-sizing: border-box;">
								<button type="button" class="btn btn-success" id="chooseRequest" style="width: 35%; box-sizing: border-box;"><b>수주정보 조회</b></button>
							</div>
								
						</div>
						<div class="form-group">
							<label><b>* 제품번호</b></label> <input class="form-control required" type="text" placeholder="제품번호" readonly name="product" id="product">
						</div>
						<div class="form-group">
							<label><b>* 제품명</b></label> <input class="form-control required" type="text" placeholder="제품명" readonly name="product_name" id="product_name">
						</div>
						<div class="form-group">
							<!-- 슬라이드바 -->
							<div class="pd-20 card-box mb-30">
								<h4 class="h4 pb-10">*수량</h4>
								<div class="row">
									<div class="col-md-6 mb-30 mb-md-0">
										<input id="amount" class="required" name="amount" />
									</div>
								</div>
								<input type="number" id="amount_input" class="form-control required" min="1" max="100" />
								<br>
								<div class="table-responsive">
									<table id="materials" class="table table-striped">
										<thead>
											<tr>
												<th scope="col">#</th>
												<th>재료명</th>
												<th>소요량</th>
												<th>총합</th>
											</tr>
										</thead>
										<tbody>
										</tbody>
									</table>
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
							<label><b>* 라인코드</b></label> <select class="custom-select2 form-control required" name="line_code" style="width: 100%; height: 38px">
								<!-- 공통 코드로 받아오기 -->
								<c:forEach items="${line_codeList }" var="line_code">
									<option value="${line_code }">${line_code }</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label><b>* 생산일</b></label>
							<input class="form-control date-picker required" placeholder="Select Date" type="text" name="production_date" autocomplete='off'/>
						</div>
						<div class="form-group">
							<label><b>지시사항</b></label>
							<textarea class="form-control" name="content"></textarea>
						</div>
						<!-- 세션에서 받아오기 -->
						<div class="form-group">
							<label><b>* 등록자</b></label>
							<input class="form-control required" type="text" placeholder="등록자 정보가 없습니다" readonly value="${sessionScope.name }">
							<input class="form-control required" type="hidden" placeholder="등록자 정보가 없습니다" readonly value="${sessionScope.code }" name="reg_emp">
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
	<!-- 슬라이더바 초기설정 시작 -->
	<script type="text/javascript">
		$("#amount").ionRangeSlider({
			type : "double",
			grid : false,
			min : 0,
			max : 100,
			from : 0,
			to : 1,
			skin : "round",
			type : "single",
		});
	</script>
	<!-- 슬라이더바 초기설정 끝 -->
	<!-- 슬라이더바 업데이트 시작 -->
	<script type="text/javascript">
		function sliderUpdate(amount) {
			$("#amount").data("ionRangeSlider").update({
				min : 0,
				max : amount,
				from : 0,
				to : 1
			});
			$("#amount_input").attr("max", amount);
		}
	</script>
	<!-- 슬라이더바 업데이트 끝 -->
	<!-- 슬라이더바 인풋 연동 시작 -->
	<script type="text/javascript">
		//슬라이더바 변경 시 input 연동
		$('#amount').change(function() {
			$('#amount_input').val($('#amount').val());
			var tr = $("table tr");
			for(i = 1; i<tr.length; i++){
				var td = tr.eq(i).children("td");
				td.eq(3).text(td.eq(2).text() * $('#amount_input').val());
			}
		});
		//input 변경 시 슬라이더바 연동
		$('#amount_input').change(function() {
			$("#amount").data("ionRangeSlider").update({
				from : $('#amount_input').val()
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
	<!-- 수주정보 조회 시작 -->
	<script type="text/javascript">
		var popupWidth, popupHeight, popupX, popupY, link;
		var set;

		function retPopupSetting(width, height) {
			// 만들 팝업창 width 크기의 1/2 만큼 보정값으로 빼주기
			popupX = Math.ceil((window.screen.width - width) / 2);
			// 만들 팝업창 height 크기의 1/2 만큼 보정값으로 빼주기
			popupY = Math.ceil((window.screen.height - height) / 2);

			var setting = "";
			setting += "toolbar=0,";
			setting += "scrollbars=0,";
			setting += "statusbar=0,";
			setting += "menubar=0,";
			setting += "resizeable=0,";
			setting += "width=" + width + ",";
			setting += "height=" + height + ",";
			setting += "top=" + popupY + ",";
			setting += "left=" + popupX;
			return setting;
		}

		function openPage(i, width, height) {
			set = retPopupSetting(width, height);
			return window.open(i, 'chooseRequest', set);
		}

		$(document).ready(function() {
			// 추가
			$("#chooseRequest").click(function() {
				// 가로, 세로 설정
				openPage("/production/chooseRequest", 1200, 600);
			});

		});
	</script>
	<!-- 수주정보 조회 끝 -->
	<!-- 수주정보 받기 시작 -->
	<script type="text/javascript">
		window.addEventListener('message', function(event) {
			if (event.data.conditionMet) {
				var code = event.data.code;
				$.ajax({
					url : "/production/ajaxRequest",
					type : "POST",
					data : {
						code : code
					},
					error : function() {
						alert("error");
					},
					success : function(data) {
						var requestVO = data;
						$("#request").val(requestVO.code).change();
						$("#product").val(requestVO.product).change();
						$("#product_name").val(requestVO.product_name).change();
						sliderUpdate(data.amount);
						getBOM(data.product);
						if (data.amount == 0) {
							alert("이미 모든 수주량이 등록되었습니다.");
							$("#amount_input").attr("disabled","disabled");
							$("select.required").attr("disabled","disabled");
							$(".required[name='production_date']").attr("disabled","disabled");
							$("textarea[name='content']").attr("disabled","disabled");
						}else{
							$("#amount_input").removeAttr("disabled");
							$("select.required").removeAttr("disabled");
							$(".required[name='production_date']").removeAttr("disabled");
							$("textarea[name='content']").removeAttr("disabled");
						}
					}
				});
			}
		});
	</script>
	<!-- 수주정보 받기 끝 -->
	<!-- BOM업데이트 시작 -->
	<script type="text/javascript">
		function getBOM(product) {
			$("#materials>tbody").empty();
			$.ajax({
				url : "/production/getBOM",
				type : "POST",
				data : {
					mapd_code : product
				},
				error : function() {
					alert("error");
				},
				success : function(data) {
					console.log(data);
					var html = "";
					for (var i = 0; i < data.length; i++) {
						html = "";
						html += "<tr>";
						html += "<td>" + data[i].bno + "</td>";
						html += "<td>" + data[i].material + "</td>";
						html += "<td>" + data[i].amount + "</td>";
						html += "<td>" + data[i].amount + "</td>";
						html += "</tr>";
						$("#materials>tbody").append(html);
					}
				}
			});
		}
	</script>
	<!-- BOM업데이트 끝 -->
	<!-- submit시 시작 -->
	<script type="text/javascript">
		$("#insertForm").submit(function(e) {
			e.preventDefault();
			$.ajax({
				type : "POST",
				url : "/production/insertInstruction",
				data : $(this).serialize(),
				success : function() {
					window.opener.postMessage("refresh", "*");
					window.close();
				},
				error : function() {
					alert("error");
				}
			});
		});
		
	</script>
	<!-- submit시 끝 -->
</body>
</html>