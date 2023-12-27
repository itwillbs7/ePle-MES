<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<%@ include file="../../include/head.jsp"%>
<title>일상 보전</title>
<!-- admin : 일상보전 모니터링 -->
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
				<h1>일상 보전 모니터링</h1>
			</div>
			<div class="min-height-200px">
				<!-- Checkbox select Datatable start -->
				<div class="card-box mb-30">
					<div class="pd-20">
						<div class="btn-group pull-left" style="margin-bottom: 15px">
							<div class="dropdown">
								<button type="button" id="searchCategoryButton" class="btn btn-secondary dropdown-toggle waves-effect" data-toggle="dropdown" aria-expanded="false">
									행 개수 <span class="caret"></span>
								</button>
								<div class="dropdown-menu" style="">
									<a class="dropdown-item" href="javascript:changePageSize(10);">10</a> <a class="dropdown-item" href="javascript:changePageSize(25);">25</a> <a class="dropdown-item" href="javascript:changePageSize(50);">50</a> <a class="dropdown-item" href="javascript:rowsDisplay(100);">100</a>
								</div>
							</div>
							&nbsp;
						</div>
					</div>
					<div class="pb-20">
						<div class="col-sm-30">
							<table id="datatable" class="table table-striped">
								<tr>
									<th>사번</th><!-- 직원 사번 -->
									<th>이름</th><!-- 직원 이름 -->
									<th>설비 정보</th><!-- 설비 정보 -->
									<th>일상 보전 회수</th>
									<th>최근 보전 시간</th><!-- 최근 보전 시간 -->
									<th>최근 보전 정보</th>
								</tr>
								<c:if test="${empty list or list.size == 0}">
									<tr>
										<th colspan="6" style="text-align: center;">데이터가 없습니다.</th>
									</tr>
								</c:if>
								<c:if test="${! empty list }">
									<c:forEach items="${list}" var="i">
										<tr>
											<th>1</th>
											<!-- 상세 정보 이동! -->
											<th>ㅁ</th>
											<th><a href="#"><b class="text-blue">설비 정보</b></a></th>
											<th>ㅁ</th>
											<th>ㅁ</th>
											<th><a href="#"><b class="text-blue">최근 보전 정보</b></a></th>										
										</tr>
									</c:forEach>
								</c:if>
							</table>
							<div class="row">
								<div class="col-sm-12 col-md-5">
									<div class="dataTable_info" id="dataTable_info" role="status" aria-live="polite"></div>
								</div>
							</div>
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
				<!-- Checkbox select Datatable End -->
				<!-- 푸터 -->
				<%@ include file="../../include/github.jsp"%>
				<%@ include file="../../include/footer.jsp"%>
			</div>
		</div>
	</div>

	<!-- 추가, 수정, 삭제 -->
	<script type="text/javascript">
		// 팝업 설정
		var popupWidth, popupHeight, popupX, popupY, link;
		var set;

		// 팝업 세팅 return
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

		// 창 열기
		function openPage(i, width, height) {
			set = retPopupSetting(width, height);
			return window.open(i, 'Popup_Window', set);
		}

		$(document).ready(function() {
			// 추가
			$("#add").click(function() {
				// 가로, 세로 설정
				openPage("/facility/info/insert", 500, 600);
			});

			// 수정
			$("#update").click(function() {
				// 가로, 세로 설정
				openPage("/facility/info/update", 400, 700);
			});

			// 삭제
			$("#delete").click(function() {
				var ch = $("input:checkbox[name=tableCheck]:checked").length;
				if (ch > 0) {
					// 가로, 세로 설정
					openPage("/facility/info/delete", 400, 700);
				} else {
					$(this).attr("data-toggle", "modal");
					$(this).attr("data-target", "#warning-modal");
					$($(this).data("target")).show();
				}
			});
		});
	</script>
</body>
</html>