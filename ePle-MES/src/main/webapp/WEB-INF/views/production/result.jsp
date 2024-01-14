<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<%@ include file="../include/head.jsp"%>
<link rel="stylesheet" type="text/css" href="../resources/production/asdasd.css" />
<title>실적 관리</title>
</head>
<body>
	<!-- 공통, css 및 js 추가 시 /include/header, footer에서 삽입 -->
	<%@ include file="../include/header.jsp"%>
	<%@ include file="../include/right-side-bar.jsp"%>
	<%@ include file="../include/left-side-bar.jsp"%>
	<!-- 메인 컨테이너 -->
	<div class="main-container">
		<div class="pd-ltr-20 xs-pd-20-10">
			<div class="title" style="margin-bottom: 10px;">
				<h1>실적 관리</h1>
			</div>
			<br>
			<div class="min-height-200px">
				<!-- 검색 시작 -->
				<div class="faq-wrap">
					<div class="card">
						<div class="card-body" style="padding: 20px;">
							<form id="accordion-search">
								<div class="col-md-12">
									<div class="form-group" style="margin: 0">
										<div class="row">
											<div class="col-md-2 col-sm-12">
												<div class="form-group">
													<label>생산일</label> <input class="form-control date-picker" placeholder="Select Date" type="text" id="searchProduction_date" name="date" value="${date }" />
												</div>
											</div>
											<div class="col-md-2 col-sm-12">
												<div class="form-group">
													<label>라인코드</label> <select class="custom-select2 form-control" multiple="multiple" style="width: 100%" name="line_code">
														<c:forEach items="${line_codeList }" var="line_codes">
															<option value="${line_codes }">${line_codes }</option>
														</c:forEach>
													</select>
												</div>
											</div>
											<div class="col-md-2 col-sm-12">
												<div class="custom-control custom-checkbox mb-5" style="position: absolute; top: 50%; margin-top: -8px;">
													<input type="checkbox" class="custom-control-input" id="isFinished" name="isFinished" ${isFinished } /> <label class="custom-control-label" for="isFinished">입고완료포함</label>
												</div>
											</div>
											<div class="col-md-2 col-sm-12">
												<div class="btn-group pull-right" style="margin-bottom: 10px; position: absolute; top: 50%; margin-top: -22px;">
													<button class="btn btn-primary" type="submit">
														<b>검색</b>
													</button>
													<button type="reset" class="btn btn-secondary" id="reset">
														<b>초기화</b>
													</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
				<!-- 검색 끝 -->
				<!-- 실적 데이터 테이블 시작 -->
				<div class="card-box mb-30">
					<div class="pb-20" style="padding: 20px">
						<table class="data-table table hover select-row nowrap" id="resultTable">
							<thead>
								<tr>
									<th>실적번호</th>
									<th>생산일</th>
									<th>라인</th>
									<th>상태</th>
									<th>제품명</th>
									<th>지시량</th>
									<th>양품량</th>
									<th>부적합량</th>
								</tr>
							</thead>
							<tbody id="resultTableBody">
								<c:forEach items="${rsList }" var="result">
									<tr class="result">
										<td>${result.code }<input type="hidden" value="${result.code }" class="hiddenCode"></td>
										<td>${result.vo.production_date }</td>
										<td>${result.vo.line_code }</td>
										<td>${result.status }</td>
										<td>${result.vo.product_name }</td>
										<td>${result.vo.amount }</td>
										<td>${result.amount }</td>
										<td>${result.failedCount }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<!-- 실적 데이터 테이블 끝 -->
				<!-- 실적 정보 편집 시작 -->
				<div class="pd-20 card-box">
					<div class="tab">
						<ul class="nav nav-tabs" role="tablist">
							<li class="nav-item"><a class="nav-link active text-blue" data-toggle="tab" href="#result" role="tab" aria-selected="true">기본 정보</a></li>
							<li class="nav-item"><a class="nav-link text-blue" data-toggle="tab" href="#failed" role="tab" aria-selected="false">부적합 정보</a></li>
							<li class="nav-item"><a class="nav-link text-blue" data-toggle="tab" href="#input" role="tab" aria-selected="false">투입 내역</a></li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane fade show active" id="result" role="tabpanel">
								<div class='infoBtnGroup' style="display: flex;">
									<button type='button' class='btn btn-success infoBtn' id='inputButton' disabled>재료투입</button>
									<button type='button' class='btn btn-success infoBtn' id='Start' disabled>시작</button>
									<button type='button' class='btn btn-warning infoBtn' id='Complete' disabled>완료</button>
									<div style="display: flex; width: 200px; align-items: center;">
										<input class="form-control required" type="number" placeholder="양품갯수" name="num" min="1" id="resultNum" style="box-sizing: border-box; margin-right: 6px;">
										<button type='button' class='btn btn-secondary infoBtn' id='addResult' style="box-sizing: border-box;" disabled>양품추가</button>
									</div>
									<button type="button" class="btn btn-dark infoBtn" id="addFailed" disabled>불량추가</button>
									<button type="button" class="btn btn-dark infoBtn" id="inAdd" disabled>입고등록</button>
								</div>
								<i class="icon-copy fa fa-info-circle toggleIcon" aria-hidden="true" style="font-size: 30px; width: 100%; text-align: center; ertical-align: middle; line-height: 100px;">&nbsp;실적을 선택해 주세요</i>
								<table class='table table-bordered toggleTable' id='infoTable' style="display: none;">
									<thead>
										<tr>
											<th>
												<div class='input-container'>
													<label for='codeInfo'>실적번호:</label>
													<input type='text' id='codeInfo' name='codeInfo' readonly value=''>
												</div>
											</th>
											<th>
												<div class='input-container'>
													<label for='dateInfo'>생산일:</label>
													<input type='text' id='dateInfo' name='dateInfo' readonly value=''>
												</div>
											</th>
											<th>
												<div class='input-container'>
													<label for='lineInfo'>라인번호:</label>
													<input type='text' id='lineInfo' name='lineInfo' readonly value='"'>
												</div>
											</th>
											<th>
												<div class='input-container'>
													<label for='statusInfo'>상태:</label>
													<input type='text' id='statusInfo' name='statusInfo' readonly value='"'>
												</div>
											</th>
											<th>
												<div class='input-container'>
													<label for='pnameInfo'>제품명:</label>
													<input type='text' id='pnameInfo' name='pnameInfo' readonly value='"'>
												</div>
											</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th>
												<div class='input-container'>
													<label for='instAmoInfo'>지시량:</label>
													<input type='text' id='instAmoInfo' name='instAmoInfo' readonly value='"'>
												</div>
											</th>
											<th>
												<div class='input-container'>
													<label for='amoInfo'>양품량:</label>
													<input type='text' id='amoInfo' name='amoInfo' readonly value='"'>
												</div>
											</th>
											<th>
												<div class='input-container'>
													<label for='failInfo'>부적합량:</label>
													<input type='text' id='failInfo' name='failInfo' readonly value=''>
												</div>
											</th>
											<th colspan='1'>
												<div class='input-container'>
													<label for='requestInfo'>수주번호:</label>
													<input type='text' id='requestInfo' name='requestInfo' readonly value='"'>
												</div>
											</th>
											<th>
												<div class='input-container'>
													<label for='inst_codeInfo'>작업지시 번호:</label>
													<input type='text' id='inst_codeInfo' name='inst_codeInfo' readonly value='"'>
												</div>
											</th>
										</tr>
										<tr>
											<th colspan='5'>
												<div class='form-group'>
													<label><b>지시사항</b></label>
													<textarea class='form-control' id='contentInfo' readonly></textarea>
												</div>
											</th>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="tab-pane fade" id="failed" role="tabpanel">
								<i class="icon-copy fa fa-info-circle toggleIcon" aria-hidden="true" style="font-size: 30px; width: 100%; text-align: center; ertical-align: middle; line-height: 100px;">&nbsp;실적을 선택해 주세요</i>
									<table class='table table-bordered toggleTable' id='failedTable' style="display: none; margin-top: 20px;">
										<thead>
											<tr>
												<th>불량번호</th>
												<th>생산자</th>
												<th>오류분류</th>
												<th>상세내용</th>
												<th>처치사항</th>
												<th>수량</th>
												<th>등록일자</th>
											</tr>
										</thead>
										<tbody>
										</tbody>
									</table>
							</div>
							<div class="tab-pane fade" id="input" role="tabpanel">
								<i class="icon-copy fa fa-info-circle toggleIcon" aria-hidden="true" style="font-size: 30px; width: 100%; text-align: center; ertical-align: middle; line-height: 100px;">&nbsp;실적을 선택해 주세요</i>
									<table class='table table-bordered toggleTable' id='inputTable' style="display: none; margin-top: 20px;">
										<thead>
											<tr>
												<th>투입코드</th>
												<th>재료코드</th>
												<th>재료명</th>
												<th>갯수</th>
											</tr>
										</thead>
										<tbody>
										</tbody>
									</table>
							</div>
						</div>
					</div>
				</div>
				<!-- 실적 정보 편집 끝 -->
				<!-- 푸터 -->
				<div class="footer-wrap pd-20 mb-20 card-box">
					ePle MES made by <a href="https://github.com/dropways" target="_blank">아이티윌 부산 2023년 7월 프로젝트 2차 1조</a>
				</div>
				<%@ include file="../include/footer.jsp"%>
				<%@ include file="../include/datatable.jsp"%>
			</div>
		</div>
	</div>
	<!-- 테이블 선택 시 시작 -->
	<script type="text/javascript">
		$(".result").on("click", function getInfo() {
			if (!$(this).hasClass('selected')) {
				$(".toggleTable").show();
				$(".toggleIcon").hide();
				$(".infoBtn").removeAttr("disabled");
				var code = $(this).find(".hiddenCode").val();
				//실적 정보 편집 추가
				$.ajax({
					url : "/production/ajaxResult",
					method : "POST",
					data : {
						code : code
					},
					error : function() {
						alert("error");
					},
					success : function(data) {
						setInfo(data);
					}
				});
			}else{
				$(".toggleTable").hide();
				$(".toggleIcon").show();
				$(".infoBtn").attr("disabled","disabled");
			}
		});
	</script>
	<!-- 테이블 선택 시 끝 -->
	<!-- 시작 버튼 시작 -->
	<script type="text/javascript">
		$(document).on("click", ".infoBtn", function() {
			var id = $(this).attr("id");
			var status = $("#statusInfo").val();
			if (id == 'Start') {
				if (status == '대기') {
					resultControll(id);
				}else{
					alert('대기 중일 때만 시작할 수 있습니다');
				}
			}
			if (id == 'Complete') {
				if (status == '생산중') {
					resultControll(id);
				}else{
					alert('생산 중일 때만 완료할 수 있습니다');
				}
			}
			if (id == 'addResult') {
				if (status == '생산중') {
					resultControll(id);
				}else{
					alert('생산 중일 때만 추가할 수 있습니다');
				}
			}
		});
	</script>
	<!-- 시작 버튼 끝 -->
	<!-- 실적 제어 시작 -->
	<script type="text/javascript">
		function resultControll(id) {
			var code = $("#codeInfo").val();
			if (id == 'addResult') {
				var num = Number($("#resultNum").val());
				var inst = Number($("#instAmoInfo").val());
				var amo = Number($("#amoInfo").val());
				if (num <= 0 ) {
					alert("수량이 0 보다 작을 수 없습니다");
					return;
				}
				if (num > (inst - amo)) {
					alert("수량이 지시량 보다 클 수 없습니다");
					return;
				}
				$.ajax({
					url : "/production/" + id,
					method : "POST",
					data : {
						code : code,
						num : num
					},
					error : function() {
						
					},
					success : function(data) {
						setInfo(data);
					}
				});
			}else{
				$.ajax({
					url : "/production/" + id,
					method : "POST",
					data : {
						code : code
					},
					error : function() {
						
					},
					success : function(data) {
						setInfo(data);
					}
				});
			}
		}
	</script>
	<!-- 실적 제어 끝 -->
	<!-- setInfo 시작 -->
	<script type="text/javascript">
		function setInfo(data) {
			var dataResult = data.result;
			var failedList = data.failedList;
			var inputList = data.inputList;
			$("#codeInfo").val(dataResult.code);
			$("#dateInfo").val(dataResult.vo.production_date);
			$("#lineInfo").val(dataResult.vo.line_code);
			$("#statusInfo").val(dataResult.status);
			$("#pnameInfo").val(dataResult.vo.product_name);
			$("#instAmoInfo").val(dataResult.vo.amount);
			$("#amoInfo").val(dataResult.amount);
			$("#failInfo").val(dataResult.failedCount);
			$("#requestInfo").val(dataResult.vo.request);
			$("#inst_codeInfo").val(dataResult.inst_code);
			$("#contentInfo").text(dataResult.vo.content);
			var html = "";
			$('#failedTable>tbody>tr').remove();
			for (var i = 0; i < failedList.length; i++) {
				html = "";
				html += "<tr>";
				html += "<th>"+ failedList[i].code +"</th>";
				html += "<th>" + failedList[i].reg_emp + "</th>";
				html += "<th>" + failedList[i].code_name + "</th>";
				html += "<th>" + failedList[i].content + "</th>";
				html += "<th>" + failedList[i].action + "</th>";
				html += "<th>" + failedList[i].amount + "</th>";
				html += "<th>" + failedList[i].reg_date + "</th>";
				html += "</tr>";
				$('#failedTable>tbody').append(html);
			}
			$('#inputTable>tbody>tr').remove();
			for (var i = 0; i < inputList.length; i++) {
				html = "";
				html += "<tr>";
				html += "<th>"+ inputList[i].code +"</th>";
				html += "<th>" + inputList[i].mapd_code + "</th>";
				html += "<th>" + inputList[i].mapd_name + "</th>";
				html += "<th>" + inputList[i].amount + "</th>";
				html += "</tr>";
				$('#inputTable>tbody').append(html);
			}

			//css변경
			if (dataResult.status == '대기') {
				$("#statusInfo").css({
					"background-color" : "yellow",
					"color" : "black"
				});
			}
			if (dataResult.status == '생산중') {
				$("#statusInfo").css({
					"background-color" : "red",
					"color" : "white"
				});
			}
			if (dataResult.status == '완료') {
				$("#statusInfo").css({
					"background-color" : "green",
					"color" : "white"
				});
			}
			//resultTable변경
			$(".selected").children().eq(3).text(dataResult.status);
			$(".selected").children().eq(6).text(dataResult.amount);
			$(".selected").children().eq(7).text(dataResult.failedCount);
		}
	</script>
	<!-- setInfo 끝 -->
	<!-- 긴 문자열 생략 시작 -->
	<script type="text/javascript">
		
	</script>
	<!-- 긴 문자열 생략 시작 -->
	<!-- 불량추가 시작 -->
	<script type="text/javascript">
		$(document) .on( "click", "#addFailed", function() {
			var status = $("#statusInfo").val();
			if (status == '생산중') {
				var popupWidth, popupHeight, popupX, popupY, link;
				var set;
				var code = $("#codeInfo").val();
				var product = $("#pnameInfo").val();
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
					return window.open(i, 'Popup_Window', set);
				}
			
				openPage("/production/insertFailed?code=" + code + "&product=" + product, 500, 600);
			}else{
				alert('생산 중일 때만 불량을 추가 할 수 있습니다.');
			}
		});
	</script>

	<!-- 불량추가 끝 -->
	<!-- 입고등록 시작 -->
	<script type="text/javascript">
		$(document) .on( "click", "#inAdd", function() {
			var status = $("#statusInfo").val();
			if (status == '완료') {
				var popupWidth, popupHeight, popupX, popupY, link;
				var set;
				var code = $("#codeInfo").val();
				var product = $("#pnameInfo").val();
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
					return window.open(i, 'Popup_Window', set);
				}
				
				openPage("/production/inAdd?code=" + code, 500, 600);
			}else{
				alert('완료된 실적만 입고등록을 할 수 있습니다.');
			}
		});
	</script>

	<!-- 입고등록 끝 -->
	<!-- 재료투입 시작 -->
	<script type="text/javascript">
		$(document) .on( "click", "#inputButton", function() {
			var status = $("#statusInfo").val();
			if (status == '대기' || status == '생산중') {
				var popupWidth, popupHeight, popupX, popupY, link;
				var set;
				var code = $("#codeInfo").val();
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
					return window.open(i, 'Popup_Window', set);
				}
				
				openPage("/production/input?code=" + code, 500, 600);
			}else{
				alert('재료투입은 대기,생산중일 때만 가능합니다.');
			}
		});
	</script>

	<!-- 재료투입 끝 -->
	<!-- 수주정보 받기 시작 -->
	<script type="text/javascript">
		window.addEventListener("message", function(event) {
			if (event.data == "refresh"){
				var code = $("#codeInfo").val();
				$.ajax({
					url : "/production/ajaxResult",
					method : "POST",
					data : {
						code : code
					},
					error : function() {
						
					},
					success : function(data) {
						setInfo(data);
					}
				});
			}
		});
	</script>
	<!-- 수주정보 받기 끝 -->

</body>
</html>
