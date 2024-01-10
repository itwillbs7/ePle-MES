<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<%@ include file="../../include/head.jsp"%>
<title>공통코드 관리</title>
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
				<h1>공통코드 관리</h1>
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
								
									<form id="accordion-search" method="post" action="/system/common/main">
											<div class="form-group row">
												<div class="col-sm-5 col-md-10">
													<select class="custom-select col-2" name="category">
														<option selected="null">카테고리</option>
														<option value="group_id">그룹ID</option>
														<option value="group_name">그룹명</option>
														<option value="code_id">코드ID</option>
														<option value="code_name">코드명</option>
													</select>
													<input class="form-group" type="text" placeholder="검색어" name="keyword">
													<lable class="btn-group pull-right">
													<button type="submit" class="btn btn-primary" id="search">
														<b>검색</b>
													</button>
													<button type="reset" class="btn btn-secondary" id="reset">
														<b>초기화</b>
													</button>
													</lable>
												</div>
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
								<table class="table table-striped">
									<tr>
										<td style="width: 100px;">
											<div class="custom-control custom-checkbox mb-5">
												<input type="checkbox" class="custom-control-input" id="tableCheckAll"> <label class="custom-control-label" for="tableCheckAll"></label>
											</div>
										</td>
										<th>그룹ID</th>
										<th>그룹명</th>
										<th>코드ID</th>
										<th>코드명</th>
										<th>정렬순서</th>
										<th>사용여부</th>
										<th>옵션</th>
									</tr>
									<form role="form"><c:forEach var="cvo" items="${CommonVO }">
										<tr>
											<!-- 리스트 표, 1페이지에 몇개 조회 가능하게 할 지는 정해도 될 거 같음 -->
											<td>
												<div class="custom-control custom-checkbox mb-5">
													<!-- id에 뒤에 el식으로 테이블 인덱스나, 번호 추가, value에 primary 붙이기  -->
													<input type="checkbox" class="custom-control-input" id="${cvo.group_id }${cvo.code_id }" name="tableCheck" value="${cvo.group_id }_${cvo.code_id }"> <label class="custom-control-label" for="${cvo.group_id }${cvo.code_id }"></label>
												</div>
											</td>
											<th>${cvo.group_id }</th>
											<!-- 상세 정보 이동! -->
											<th><a href="#"><b class="text-blue" id="tableTitle1">${cvo.group_name }</b></a></th>
											<th>${cvo.code_id }</th>
											<th>${cvo.code_name }</th>
											<th>${cvo.sortorder }</th>
											<th>${cvo.active }</th>
											<td style="">
											<!-- 옵션 -->
												<div class="dropdown">
													<a class="btn btn-link font-24 p-0 line-height-1 no-arrow dropdown-toggle" href="#" role="button" data-toggle="dropdown"> <i class="dw dw-more"></i>
													</a>
													<div class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list">
														<!-- 링크 설정 -->
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
									<div class="btn-toolbar justify-content-center mb-15">
										<c:if test="${pageVO.totalCount > 1}">
											<div class="btn-group">
												<c:if test="${pageVO.prev}">
													<a href="javascript:pageMove(${pageVO.startPage - 1})" class="btn btn-outline-primary prev"> <i class="fa fa-angle-double-left"></i>
													</a>
												</c:if>
												<c:forEach begin="${pageVO.startPage}" end="${pageVO.endPage}" var="i">
													<c:if test="${pageVO.cri.page == i}">
														<span class="btn btn-primary current">${i}</span>
													</c:if>
													<c:if test="${pageVO.cri.page != i}">
														<a href="javascript:pageMove(${i})" class="btn btn-outline-primary">${i}</a>
													</c:if>
												</c:forEach>
												<c:if test="${pageVO.next}">
													<a href="javascript:pageMove(${pageVO.endPage + 1})" class="btn btn-outline-primary next"> <i class="fa fa-angle-double-right"></i>
													</a>
												</c:if>
											</div>
										</c:if>
									</div>
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
				}
				alert(index);
				
				// 가로, 세로 설정
				openPage("/system/common/update?index="+index, 400, 700);
			});

			// 삭제
			$("#delete").click(function() {
				
				// 체크된 체크박스의 갯수
				var n = $( "input[type=checkbox]:checked" ).length;
				var index = $( "input[type=checkbox]:checked" ).val();
				
				if (n > 1) {
					alert('삭제는 한 번에 1개씩만 가능합니다!');
					return;
				}
				if (n == 0) {
					alert('n : ' + n);
					alert('삭제를 원하는 행을 선택해주세요!');
				}
				alert(index);
				
				var userConfirm = confirm('삭제하시겠습니까?');
				if (userConfirm) {
					// 가로, 세로 설정
					openPage("/system/common/delete?index="+index, 400, 700);
				}
				
			});
			
			
		});
	</script>
</body>
</html>
