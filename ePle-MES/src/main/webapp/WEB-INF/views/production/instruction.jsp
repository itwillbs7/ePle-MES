<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<%@ include file="../include/head.jsp"%>
<title>생산 관리</title>
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
				<h1>생산 관리</h1>
			</div>
			<div class="min-height-200px">
				<ul class="nav nav-pills">
					<li class="nav-item">
						<a class="nav-link text-blue active" href="/production/instruction">지시사항 목록</a>
					</li>
					<li class="nav-item">
						<a class="nav-link text-blue" href="/maintenance/resultList">보전 결과</a>
					</li>
				</ul>
				<br>
				<!-- 아코디언 시작 -->
				<div class="faq-wrap">
					<div id="accordion">
						<div class="card">
							<div class="card-header">
								<button class="btn btn-block collapsed" data-toggle="collapse" data-target="#faq1" aria-expanded="false">
									<b>작업지시 검색</b>
								</button>
							</div>
							<div id="faq1" class="collapse" data-parent="#accordion" style="">
								<div class="card-body">
									<form id="accordion-search">
										<div class="col-md-12">
											<div class="form-group">
												<div class="row">
													<h4 class="text-blue h4">작업지시 검색</h4>
													<div class="col-md-5 col-sm-12 btn-group" style="margin-left: auto;">
														<div class="btn-group dropdown">
															<button type="button" id="searchCategoryButton" class="btn btn-primary dropdown-toggle waves-effect" data-toggle="dropdown" aria-expanded="false">
																카테고리 <span class="caret"></span>
															</button>
															<div class="dropdown-menu" style="">
																<a class="dropdown-item" href="javascript:buttonCategory();">선택</a>
																<a class="dropdown-item" href="javascript:buttonCategory('A');">A</a>
																<a class="dropdown-item" href="javascript:buttonCategory('B');">B</a>
																<a class="dropdown-item" href="javascript:buttonCategory('C');">C</a>
															</div>
														</div>
														<input type="hidden" id="searchCategory" name="searchCategory">
														<input type="text" name="searchKeyword" class="form-control" style="width: 100%;" placeholder="검색어 입력">
													</div>
												</div>
												<hr>
												<div class="row">
													<h4 class="text-blue h4">상세 검색</h4>
												</div>
												<div class="row">
													<div class="col-md-2 col-sm-12">
														<div class="form-group">
															<label>품번</label>
															<select class="custom-select2 form-control" multiple="multiple" style="width: 100%" name="product">
																<c:forEach items="${productList }" var="product">
																	<option value="${product }">${product }</option>
																</c:forEach>
															</select>
														</div>
													</div>
													<div class="col-md-2 col-sm-12">
														<div class="form-group">
															<label>라인코드</label>
															<select class="custom-select2 form-control" multiple="multiple" style="width: 100%" name="line_code">
																<c:forEach items="${line_codeList }" var="line_code">
																	<option value="${line_code }">${line_code }</option>
																</c:forEach>
															</select>
														</div>
													</div>
													<div class="col-md-2 col-sm-12">
														<div class="form-group">
															<label>수주번호</label>
															<select class="custom-select2 form-control" multiple="multiple" style="width: 100%" name="request">
																<c:forEach items="${requestList }" var="request">
																	<option value="${request }">${request }</option>
																</c:forEach>
															</select>
														</div>
													</div>
													<div class="col-md-2 col-sm-12">
														<div class="form-group">
															<label>기간</label>
															<input class="form-control datetimepicker-range" placeholder="Select Month" type="text" name="datetime">
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="btn-group pull-right" style="margin-bottom: 10px">
											<button class="btn btn-primary" type="button" onclick="ajaxSearch()">
												<b>검색</b>
											</button>
											<button type="reset" class="btn btn-secondary" id="reset">
												<b>초기화</b>
											</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 아코디언 끝 -->
				<!-- 데이터 테이블 시작 -->
				<div class="card-box mb-30">
					<div class="pd-20">
						<div class="btn-group pull-right" style="margin-bottom: 10px">
							<button type="button" class="btn btn-success" id="add">
								<b>추가</b>
							</button>
							<button type="button" class="btn btn-warning" id="update">
								<b>수정</b>
							</button>
							<button type="button" class="btn btn-danger" id="delete">
								<b>삭제</b>
							</button>
						</div>
					</div>
					<div class="pb-20">
						<div class="col-sm-30">
							<form class="table" id="table">
								<table class="table table-striped">
									<tr>
										<td style="width: 100px;">
											<div class="custom-control custom-checkbox mb-5">
												<input type="checkbox" class="custom-control-input" id="tableCheckAll">
												<label class="custom-control-label" for="tableCheckAll"></label>
											</div>
										</td>
										<th>#</th>
										<th>품번</th>
										<th>수량</th>
										<th>라인코드</th>
										<th>지시사항</th>
										<th>수주번호</th>
										<th>등록자</th>
										<th>등록일</th>
										<th>수정자</th>
										<th>최종수정일</th>
									</tr>
									<c:forEach items="${instructionVOList }" var="vo">
										<tr class="instructionVO">
											<!-- 리스트 표, 1페이지에 몇개 조회 가능하게 할 지는 정해도 될 거 같음 -->
											<td>
												<div class="custom-control custom-checkbox mb-5">
													<!-- id에 뒤에 el식으로 테이블 인덱스나, 번호 추가, value에 primary 붙이기  -->
													<input type="checkbox" class="custom-control-input" id="checkTable1" name="tableCheck" value="1">
													<label class="custom-control-label" for="checkTable1"></label>
												</div>
											</td>
											<th>${vo.index }</th>
											<!-- 상세 정보 이동! -->
											<th><a href="#"><b class="text-blue" id="tableTitle1">${vo.product }</b></a></th>
											<th>${vo.amount }</th>
											<th>${vo.line_code }</th>
											<th>${vo.content }</th>
											<th>${vo.request }</th>
											<th>${vo.reg_emp }</th>
											<th>${vo.reg_date }</th>
											<th>${vo.update_emp }</th>
											<th>${vo.update_date }</th>
											<td style="">
											<!-- 옵션 -->
												<div class="dropdown">
													<a class="btn btn-link font-24 p-0 line-height-1 no-arrow dropdown-toggle" href="#" role="button" data-toggle="dropdown">
														<i class="dw dw-more"></i>
													</a>
													<div class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list">
														<!-- 링크 설정 -->
														<!-- 상세 보기 -->
														<a class="dropdown-item" href="#">
															<i class="dw dw-eye"></i> 상세 보기
														</a>
														<!-- 수정 -->
														<a class="dropdown-item" href="javascript:openPage('/maintenance/update?index=1', 400, 600)">
															<i class="dw dw-edit2"></i> 수정
														</a>
														<!-- 삭제 -->
														<a class="dropdown-item" href="javascript:openPage('/maintenance/delete?index=1', 400, 600)">
															<i class="dw dw-delete-3"></i> 삭제
														</a>
													</div>
												</div>
											</td>
										</tr>
									</c:forEach>
								</table>
							</form>
							<div class="row">
								<div class="col-sm-12 col-md-5">
									<div class="dataTables_info" id="DataTables_Table_0_info" role="status" aria-live="polite">&nbsp;&nbsp;(${instructionVOList.size() }) 중 (${instructionVOList.size() }) 개</div>
								</div>
							</div>
							<div class="btn-toolbar justify-content-center mb-15">
								<div class="btn-group">
									<a href="#" class="btn btn-outline-primary prev">
										<i class="fa fa-angle-double-left"></i>
									</a>
									<a href="#" class="btn btn-outline-primary">1</a>
									<a href="#" class="btn btn-outline-primary">2</a>
									<span class="btn btn-primary current">3</span>
									<a href="#" class="btn btn-outline-primary">4</a>
									<a href="#" class="btn btn-outline-primary">5</a>
									<a href="#" class="btn btn-outline-primary next">
										<i class="fa fa-angle-double-right"></i>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 데이터 테이블 끝 -->
				<!-- 푸터 -->
				<div class="footer-wrap pd-20 mb-20 card-box">
					ePle MES made by <a href="https://github.com/dropways" target="_blank">아이티윌 부산 2023년 7월 프로젝트 2차 1조</a>
				</div>
				<%@ include file="../include/footer.jsp"%>
				<%@ include file="../include/datatable.jsp"%>
			</div>
		</div>
	</div>

	<!-- 추가, 수정, 삭제 팝업 -->
	<script type="text/javascript">
		var popupWidth, popupHeight, popupX, popupY, link;
		var set;

		function retPopupSetting(width, height){
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

		$(document).ready(function() {
			// 추가
			$("#add").click(function() {
				// 가로, 세로 설정
				openPage("/production/instructionAdd", 500, 600);
			});

			// 수정
			$("#update").click(function() {
				// 가로, 세로 설정
				openPage("/production/instructionUpdate", 400, 700);
			});

			// 삭제
			$("#delete").click(function() {
				// 가로, 세로 설정
				openPage("/production/instructionDelete", 400, 700);
			});
		});
	</script>
	<!-- ajax검색 -->
	<script type="text/javascript">
		function ajaxSearch() {
			var queryString = $('#accordion-search').serialize();
			$.ajax({
				type : 'post',
				url : '/production/ajaxSearch',
				data : queryString,
				error: function(){
					alert("error");
				},
				success : function(data){
					$('.instructionVO').remove();
					var html = "";
					$(data).each(function(){
						html += "<tr class='instructionVO'>";
						html += "<td>";
						html += "<div class='custom-control custom-checkbox mb-5'>";
						html += "<input type='checkbox' class='custom-control-input' id='checkTable1' name='tableCheck' value='1'>";
						html += "<label class='custom-control-label' for='checkTable1'></label>";
						html += "</div>";
						html += "</td>";
						html += "<th>" + this.index +"</th>";
						html += "<th><a href='#'><b class='text-blue' id='tableTitle1'>" + this.product +"</b></a></th>";
						html += "<th>" + this.amount +"</th>";
						html += "<th>" + this.line_code +"</th>";
						html += "<th>" + this.content +"</th>";
						html += "<th>" + this.request +"</th>";
						html += "<th>" + this.reg_emp +"</th>";
						html += "<th>" + this.reg_date +"</th>";
						html += "<th>" + this.update_emp +"</th>";
						html += "<th>" + this.update_date +"</th>";
						html += "<td style=''>";
						html += "<div class='dropdown'>";
						html += "<a class='btn btn-link font-24 p-0 line-height-1 no-arrow dropdown-toggle' href='#' role='button' data-toggle='dropdown'>";
						html += "<i class='dw dw-more'></i>";
						html += "</a>";
						html += "<div class='dropdown-menu dropdown-menu-right dropdown-menu-icon-list'>";
						html += "<a class='dropdown-item' href='#'>";
						html += "<i class='dw dw-eye'></i> 상세 보기";
						html += "</a>";
						html += "<a class='dropdown-item' href='javascript:openPage('/maintenance/update?index=1', 400, 600)'>";
						html += "<i class='dw dw-edit2'></i> 수정";
						html += "</a>";
						html += "<a class='dropdown-item' href='javascript:openPage('/maintenance/delete?index=1', 400, 600)'>";
						html += "<i class='dw dw-delete-3'></i> 삭제";
						html += "</a>";
						html += "</div>";
						html += "</div>";
						html += "</td>";
						html += "</tr>";
					});
					$("table").append(html);
				}
			});
		}
	</script>
</body>
</html>
