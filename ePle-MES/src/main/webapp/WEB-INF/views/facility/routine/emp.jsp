<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<%@ include file="../../include/head.jsp"%>
<title>일상 보전</title>
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
				<h1>일상 보전</h1>
			</div>
			<br>
			<div class="min-height-200px">
				<div class="alert alert-success alert-dismissible fade show" role="alert">
					<strong>보전 등록</strong>이 완료되었습니다!
					<button type="button" class="close" data-dismiss="alert" aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="alert alert-info alert-dismissible fade show" role="alert">
					<strong>보전 수정</strong>이 완료되었습니다!
					<button type="button" class="close" data-dismiss="alert" aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="alert alert-warning alert-dismissible fade show" role="alert">
					<strong>보전 삭제</strong>가 완료되지 않았습니다!
					<button type="button" class="close" data-dismiss="alert" aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="row">
					<div class="col-md-6 mb-20">
						<a href="#" class="card-box d-block mx-auto pd-20 text-secondary text-center">
							<div class="img pb-30 ">
								<img src="${pageContext.request.contextPath}/resources/images/plus.png" alt="">
							</div>
							<div class="content">
								<h3 class="h1">보전 등록</h3>
							</div>
						</a>
					</div>
					<div class="col-md-6 mb-20">
						<a href="#" class="card-box d-block mx-auto pd-20 text-secondary text-center">
							<div class="img pb-30">
								<img src="${pageContext.request.contextPath}/resources/images/table.png" alt="">
							</div>
							<div class="content">
								<h3 class="h1">보전 조회</h3>
							</div>
						</a>
					</div>
				</div>
				<!-- Checkbox select Datatable End -->
				<!-- 푸터 -->
				<%@ include file="../../include/github.jsp"%>
				<%@ include file="../../include/footer.jsp"%>
			</div>
		</div>

	</div>
	<!-- 모달 창 -->
	<div class="modal fade" id="warning-modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm modal-dialog-centered">
			<div class="modal-content bg-warning">
				<div class="modal-body text-center">
					<h3 class="mb-15">
						<i class="fa fa-exclamation-triangle"></i> 주의
					</h3>
					<p>
						<b>선택된 데이터</b>가 없습니다!
					</p>
					<button type="button" class="btn btn-dark" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 모달 창 -->

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

		function downloadPDF(data) {
			alert("data : " + data);
		}

		function downloadCSV(data) {
			alert("CSV");
		}

		function printResult(data) {
			alert("PRINT");
		}
	</script>
</body>
</html>