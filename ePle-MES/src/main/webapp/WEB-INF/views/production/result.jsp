<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<link rel="stylesheet" href="result.css" />
<%@ include file="../include/head.jsp"%>
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
													<label>생산일</label>
													<input class="form-control date-picker" placeholder="Select Date" type="text" id="searchProduction_date" name="searchProduction_date"/>
												</div>
											</div>
											<div class="col-md-2 col-sm-12">
												<div class="form-group">
													<label>라인코드</label> <select class="custom-select2 form-control" multiple="multiple" style="width: 100%" name="searchLine_code">
														<c:forEach items="${line_codeList }" var="line_code">
															<option value="${line_code }">${line_code }</option>
														</c:forEach>
													</select>
												</div>
											</div>
											<div class="col-md-2 col-sm-12">
												<div class="custom-control custom-checkbox mb-5" style="position: absolute; top: 50%; margin-top: -8px;">
													<input type="checkbox" class="custom-control-input" id="isFinished" name="isFinished"/> <label class="custom-control-label" for="isFinished">완료포함</label>
												</div>
											</div>
											<div class="col-md-2 col-sm-12">
												<div class="btn-group pull-right" style="margin-bottom: 10px; position: absolute; top: 50%; margin-top: -22px;">
													<button class="btn btn-primary" type="button" onclick="ajaxSearch()">
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
									<th>제품코드</th>
									<th>제품명</th>
									<th>지시량</th>
									<th>양품량</th>
									<th>부적합량</th>
								</tr>
							</thead>
							<tbody>
								
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
								<div>
									<button type="button" class="btn btn-secondary" id="Save">저장</button>
									<button type="button" class="btn btn-success" id="Start">시작</button>
									<button type="button" class="btn btn-danger" id="Complete">완료</button>
									<button type="button" class="btn btn-warning" id="CompleteCancle">완료취소</button>
									<button type="button" class="btn btn-success" id="addResult">양품추가</button>
									<button type="button" class="btn btn-danger" id="addFailed">불량추가</button>
								</div>
								<form action="" id="resultForm">
									
								</form>
							</div>
							<div class="tab-pane fade" id="failed" role="tabpanel">
								<div>
									<button type="button" class="btn btn-secondary" id="SaveFailed">저장</button>
								</div>
								<form action="" id="failedForm">
									
								</form>
							</div>
							<div class="tab-pane fade" id="input" role="tabpanel">
								<div class="pd-20">input</div>
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
	<!-- 검색 초기 설정 시작 -->
	<script type="text/javascript">
		var today = new Date();
		var todayString = today.getFullYear() + "-" + (today.getMonth() + 1).toString().padStart(2, '0') + "-" + today.getDate().toString().padStart(2, '0');
		$("#searchProduction_date").val(todayString);
		var queryString = $("#accordion-search").serialize();
		$.ajax({
			type : 'post',
			url : '/production/ajaxSearch1',
			data : queryString,
			error: function(){
				alert("error");
			},
			success : function(data){
				//$('tbody').replaceChildren();
				$('tbody .odd').remove();
				$('tbody .result').remove();
				var html = "";
				//지시사항 상세 검색 결과가 초기 지시사항 페이지와 다르게 나온다.개선필요
				$(data).each(function(){
					html += "<tr class='result'>";
					html += "<td>" + this.code + "<input type='hidden' class='hiddenCode' value='" + this.code + "'></td>";
					html += "<td>" + this.vo.production_date + "</td>";
					html += "<td>" + this.vo.line_code + "</td>";
					html += "<td>" + this.status + "</td>";
					html += "<td>제품코드</td>";
					html += "<td>" + this.vo.product + "</td>";
					html += "<td>" + this.vo.amount + "</td>";
					html += "<td>" + this.amount + "</td>";
					html += "<td>부적합량</td>";
					html += "</tr>";
				});
				$("tbody").append(html);
			}
		});
	</script>
	<!-- 검색 초기 설정 시작 -->
	<!-- 테이블 선택 시 시작 -->
	<script type="text/javascript">
		$(".result").click(function(){
			if (!$(this).hasClass('selected')) {
				var code = $(this).find(".hiddenCode").val();
				//실적 정보 편집 추가
				$.ajax({
					url : "/production/ajaxResult",
					method : "POST",
					data : {code : code},
					error : function(){
						alert("error");
					},
					success : function(data) {
						var dataFailedList = data.failedList;
						var dataResult = data.result;
						$('#result').empty();
						var html = "";
						html += "<table border='1px solid black' style='border-spacing: 10px; border-collapse: separate;'>";
						html += "<tr>";
						html += "<td>";
						html += "<span class='infoDF'>실적번호</span>";
						html += "<span class='infoAS'><input type='text' value='" + dataResult.code + "'></span>";
						html += "</td>";
						html += "<td>";
						html += "<span class='infoDF'>제품코드</span>";
						html += "<span class='infoAS'>제품코드1</span>";
						html += "</td>";
						html += "<td>";
						html += "<span class='infoDF'>제품명</span>";
						html += "<span class='infoAS'><input type='text' value='" + dataResult.vo.product + "'></span>";
						html += "</td>";
						html += "<td>";
						html += "<span class='infoDF'>상태</span>";
						html += "<span class='infoAS'>상태1</span>";
						html += "</td>";
						html += "<span class='infoDF'>LOT</span>";
						html += "<span class='infoAS'>LOT1</span>";
						html += "</td>";
						html += "</tr>";
						html += "<tr>";
						html += "<td>";
						html += "<span class='infoDF'>라인</span>";
						html += "<span class='infoAS'><input type='text' value='" + dataResult.vo.line_code + "'></span>";
						html += "</td>";
						html += "<td>";
						html += "<span class='infoDF'>기간</span>";
						html += "<span class='infoAS'>기간1</span>";
						html += "</td>";
						html += "<td>";
						html += "<span class='infoDF'>지시량</span>";
						html += "<span class='infoAS'><input type='text' value='" + dataResult.vo.amount + "'></span>";
						html += "</td>";
						html += "<td>";
						html += "<span class='infoDF'>양품량</span>";
						html += "<span class='infoAS'><input type='text' value='" + dataResult.amount + "'></span>";
						html += "</td>";
						html += "<td>";
						html += "<span class='infoDF'>부적합량</span>";
						html += "<span class='infoAS'>부적합량1</span>";
						html += "</td>";
						html += "</tr>";
						html += "</table>";
						$('#result').append(html);
					}
				});
	        }else{
	        	$('#result').empty();
	        }
		});
		
	</script>
	<!-- 테이블 선택 시 끝 -->
</body>
</html>
