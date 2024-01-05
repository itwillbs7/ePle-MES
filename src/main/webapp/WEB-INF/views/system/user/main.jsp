<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<%@ include file="../../include/head.jsp"%>
<title>사용자(사원) 관리</title>
</head>
<body>
	<!-- 공통, css 및 js 추가 시 /include/header, footer에서 삽입 -->
	<%@ include file="../../include/header.jsp"%>
	<%@ include file="../../include/right-side-bar.jsp"%>
	<%@ include file="../../include/left-side-bar.jsp"%>
	<!-- 메인 컨테이너 -->
	<div class="main-container">
		<div class="pd-ltr-20 xs-pd-20-10">
			<div class="title" style="margin-bottom: 10px;">
				<h1>사용자(사원) 관리</h1>
			</div>
			<div class="min-height-200px">
				<!-- 아코디언 시작 -->
				<div class="faq-wrap">
					<div id="accordion">
						<div class="card">
							<div class="card-header">
								<button class="btn btn-block collapsed" data-toggle="collapse" data-target="#faq1" aria-expanded="false">
									<b>검색</b>
								</button>
							</div>
							<div id="faq1" class="collapse" data-parent="#accordion" style="">
								<div class="card-body">
									<form id="accordion-search" method="GET" action="#">
										<div class="col-md-12">
											<div class="form-group">
												<div class="row">
													<h4 class="text-blue h4">기본 검색</h4>
													<div class="col-md-5 col-sm-12 btn-group" style="margin-left: auto;">
														<div class="btn-group dropdown">
															<button type="button" id="searchCategoryButton" class="btn btn-primary dropdown-toggle waves-effect" data-toggle="dropdown" aria-expanded="false">
																카테고리 <span class="caret"></span>
															</button>
															<div class="dropdown-menu" style="">
																<a class="dropdown-item" href="javascript:buttonCategory();">선택</a> <a class="dropdown-item" href="javascript:buttonCategory('A');">A</a> <a class="dropdown-item" href="javascript:buttonCategory('B');">B</a> <a class="dropdown-item" href="javascript:buttonCategory('C');">C</a>
															</div>
														</div>
														<input type="hidden" id="searchCategory" name="searchCategory"> <input type="text" name="searchKeyword" class="form-control" style="width: 100%;" placeholder="검색어 입력">
													</div>
												</div>
												<hr>
												<div class="row">
													<h4 class="text-blue h4">상세 검색</h4>
												</div>
												<div class="row">
													<div class="col-md-1 col-sm-12">
														<label class="weight-600">체크 박스</label>
														<div class="custom-control custom-checkbox mb-5">
															<input type="checkbox" class="custom-control-input" id="formCheckAll"> <label class="custom-control-label" for="formCheckAll"><b>전체</b></label>
														</div>
														<div class="custom-control custom-checkbox mb-5">
															<input type="checkbox" class="custom-control-input" id="formCheck1" name="formCheck"> <label class="custom-control-label" for="formCheck1">A</label>
														</div>
														<div class="custom-control custom-checkbox mb-5">
															<input type="checkbox" class="custom-control-input" id="formCheck2" name="formCheck"> <label class="custom-control-label" for="formCheck2">B</label>
														</div>
														<div class="custom-control custom-checkbox mb-5">
															<input type="checkbox" class="custom-control-input" id="formCheck3" name="formCheck"> <label class="custom-control-label" for="formCheck3">C</label>
														</div>
														<div class="custom-control custom-checkbox mb-5">
															<input type="checkbox" class="custom-control-input" id="formCheck4" name="formCheck"> <label class="custom-control-label" for="formCheck4">D</label>
														</div>
													</div>
													<div class="col-md-1 col-sm-12" style="margin-top: auto;">
														<div class="custom-control custom-checkbox mb-5">
															<input type="checkbox" class="custom-control-input" id="formCheck5" name="formCheck"> <label class="custom-control-label" for="formCheck5">E</label>
														</div>
														<div class="custom-control custom-checkbox mb-5">
															<input type="checkbox" class="custom-control-input" id="formCheck6" name="formCheck"> <label class="custom-control-label" for="formCheck6">F</label>
														</div>
														<div class="custom-control custom-checkbox mb-5">
															<input type="checkbox" class="custom-control-input" id="formCheck7" name="formCheck"> <label class="custom-control-label" for="formCheck7">G</label>
														</div>
														<div class="custom-control custom-checkbox mb-5">
															<input type="checkbox" class="custom-control-input" id="formCheck8" name="formCheck"> <label class="custom-control-label" for="formCheck8">H</label>
														</div>
													</div>
													<div class="col-md-2 col-sm-12">
														<label class="weight-600">라디오</label>
														<div class="custom-control custom-radio mb-5">
															<input type="radio" id="formRadio1" name="formRadio" class="custom-control-input"> <label class="custom-control-label" for="formRadio1">가</label>
														</div>
														<div class="custom-control custom-radio mb-5">
															<input type="radio" id="formRadio2" name="formRadio" class="custom-control-input"> <label class="custom-control-label" for="formRadio2">나</label>
														</div>
														<div class="custom-control custom-radio mb-5">
															<input type="radio" id="formRadio3" name="formRadio" class="custom-control-input"> <label class="custom-control-label" for="formRadio3">다</label>
														</div>
														<div class="custom-control custom-radio mb-5">
															<input type="radio" id="formRadio4" name="formRadio" class="custom-control-input"> <label class="custom-control-label" for="formRadio4">라</label>
														</div>
													</div>
													<div class="col-md-2 col-sm-12">
														<div class="form-group">
															<label>기간</label> <input class="form-control datetimepicker-range" placeholder="Select Month" type="text" name="datetime">
														</div>
													</div>
													<div class="col-md-2 col-sm-12">
														<div class="form-group">
															<label>물품 종류</label> <select class="custom-select2 form-control" multiple="multiple" style="width: 100%" name="category">
																<optgroup label="Alaskan/Hawaiian Time Zone">
																	<option value="AK">Alaska</option>
																	<option value="HI">Hawaii</option>
																</optgroup>
																<optgroup label="Pacific Time Zone">
																	<option value="CA">California</option>
																	<option value="NV">Nevada</option>
																	<option value="OR">Oregon</option>
																	<option value="WA">Washington</option>
																</optgroup>
																<optgroup label="Mountain Time Zone">
																	<option value="AZ">Arizona</option>
																	<option value="CO">Colorado</option>
																	<option value="ID">Idaho</option>
																	<option value="MT">Montana</option>
																	<option value="NE">Nebraska</option>
																	<option value="NM">New Mexico</option>
																	<option value="ND">North Dakota</option>
																	<option value="UT">Utah</option>
																	<option value="WY">Wyoming</option>
																</optgroup>
															</select>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="btn-group pull-right" style="margin-bottom: 10px">
											<button type="submit" class="btn btn-primary" id="search">
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
				<!-- Checkbox select Datatable start -->
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
								<table class="table table-striped" style="text-align: center;">
									<tr>
										<td style="width: 100px;">
											<div class="custom-control custom-checkbox mb-5">
												<input type="checkbox" class="custom-control-input" id="tableCheckAll"> <label class="custom-control-label" for="tableCheckAll"></label>
											</div>
										</td>
										<th>사원코드</th>
										<th>이름</th>
										<th>권한</th>
										<th>아이디</th>
										<th>부서</th>
										<th>직책</th>
										<th>휴대전화번호</th>
										<th>사용여부</th>
										<th></th>
									</tr>
									<form role="form"><c:forEach var="vo" items="${UserVO }">
										<tr>
											<!-- 리스트 표, 1페이지에 몇개 조회 가능하게 할 지는 정해도 될 거 같음 -->
											<td>
												<div class="custom-control custom-checkbox mb-5">
													<!-- id에 뒤에 el식으로 테이블 인덱스나, 번호 추가, value에 primary 붙이기  -->
													<input type="checkbox" class="custom-control-input" id="${vo.code }" name="tableCheck" value="${vo.code }"> <label class="custom-control-label" for="${vo.code }"></label>
												</div>
											</td>
																						<!-- 상세 정보 이동! -->
											<td><a href="#" onclick="openPage('/system/user/detail?index=${vo.code}', 400, 700);"><b class="text-blue" id="tableTitle1">${vo.code }</b></a></td>
											<td>${vo.name }</td>
											<td>${vo.auth }</td>
											<td>${vo.id }</td>
											<td>${vo.dep_group }</td>
											<td>${vo.pos_group }</td>
											<td>${vo.phone }</td>
											<td>${vo.active }</td>
											<td style="">
											<!-- 옵션 -->
												<div class="dropdown">
													<a class="btn btn-link font-24 p-0 line-height-1 no-arrow dropdown-toggle" href="#" role="button" data-toggle="dropdown"> <i class="dw dw-more"></i>
													</a>
													<div class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list">
														<!-- 링크 설정 -->
														<!-- 상세 보기 -->
														<a class="dropdown-item" href="#"><i class="dw dw-eye"></i> 상세 보기</a>
														<!-- 수정 -->
														<a class="dropdown-item" href="javascript:openPage('/system/common/update?index=${cvo.group_id }_${cvo.code_id }', 400, 700)"><i class="dw dw-edit2"></i> 수정</a>
														<!-- 삭제 -->
														<a class="dropdown-item" href="javascript:openPage('/system/common/delete?index=${cvo.group_id }_${cvo.code_id }', 400, 700)"><i class="dw dw-delete-3"></i> 삭제</a>
													</div>
												</div>
											</td>
										</tr>
									</c:forEach></form>
								</table>
							</form>
							<div class="row">
								<div class="col-sm-12 col-md-5">
									<div class="dataTables_info" id="DataTables_Table_0_info" role="status" aria-live="polite">&nbsp;&nbsp;(전체 수) 중 (검색 결과) 개</div>
								</div>
							</div>
							<div class="btn-toolbar justify-content-center mb-15">
								<div class="btn-group">
									<a href="#" class="btn btn-outline-primary prev"><i class="fa fa-angle-double-left"></i></a> <a href="#" class="btn btn-outline-primary">1</a> <a href="#" class="btn btn-outline-primary">2</a> <span class="btn btn-primary current">3</span> <a href="#" class="btn btn-outline-primary">4</a> <a href="#" class="btn btn-outline-primary">5</a> <a href="#" class="btn btn-outline-primary next"><i class="fa fa-angle-double-right"></i></a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Checkbox select Datatable End -->
				<!-- 푸터 -->
				<div class="footer-wrap pd-20 mb-20 card-box">
					ePle MES made by <a href="https://github.com/dropways" target="_blank">아이티윌 부산 2023년 7월 프로젝트 2차 1조</a>
				</div>
				<%@ include file="../../include/footer.jsp"%>
				<%@ include file="../../include/datatable.jsp"%>
			</div>
		</div>
	</div>

	<script type="text/javascript">

	
	
	<!-- 추가, 수정, 삭제 -->
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
			
			// 옵션 - 삭제
			
			function optionDelete() {
				
				console.log('함수실행');
				
				var userConfirm = confirm('삭제하시겠습니까?');
				
				if(userConfirm) {
					
					openPage("/system/common/delete?index="+index,400, 700);
				}
				
			}
				
			// 추가
			$("#add").click(function() {
				// 가로, 세로 설정
				openPage("/system/common/add", 500, 600);
			});

			// 수정
			$("#update").click(function() {
				
				// 체크된 체크박스의 갯수
				var n = $( "input[type=checkbox]:checked" ).length;
				var index = $( "input[type=checkbox]:checked" ).val();
				
				if (n > 1) {
					alert('수정은 한 번에 1개씩만 가능합니다!');
					return;
				}
				if (n == 0) {
					alert('수정을 원하는 행을 선택해주세요!');
					return;
				}
				
				// 가로, 세로 설정
				openPage("/system/user/update?index="+index, 400, 700);
			});

			// 삭제
			$("#delete").click(function() {
				
			    // 체크박스 값 저장 배열
			    var selectedIndexes = [];

			    // 선택된 체크박스
			    $("input[type=checkbox]:checked").each(function() {
			        selectedIndexes.push($(this).val());
			    });

			    // 체크된 체크박스의 갯수 확인
			    if (selectedIndexes.length > 0) {
			        // 인덱스 문자열 컨트롤러로 전달
			        var indexes = selectedIndexes.join(",");
		            // 선택된 인덱스를 컨트롤러로 전달
		            openPage("/system/user/delete?indexes=" + indexes, 400, 700);
			        
			    } else {
			        alert('삭제를 원하는 행을 선택해주세요!');
			    }
			    
				
			});
			
			
		});
	</script>
</body>
</html>
