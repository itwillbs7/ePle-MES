<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<%@ include file="../../include/head.jsp"%>
<title>설비 보전</title>
<!-- manager : 보전 조회 및 처리 -->
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
				<h1>설비 보전</h1>
			</div>
			<br>
			<div class="min-height-200px">
				<div class="row">
					<div class="col-md-3 mb-20">
						<a href="javascript:insert();" class="card-box d-block mx-auto pd-20 text-secondary text-center">
							<div class="img pb-30 ">
								<img src="${pageContext.request.contextPath}/resources/images/plus.png" alt="">
							</div>
							<div class="content">
								<h3 class="h1">보전 결과 등록</h3>
							</div>
						</a>
					</div>
					<div class="col-md-3 mb-20">
						<a href="javascript:list();" class="card-box d-block mx-auto pd-20 text-secondary text-center">
							<div class="img pb-30">
								<img src="${pageContext.request.contextPath}/resources/images/table.png" alt="">
							</div>
							<div class="content">
								<h3 class="h1">보전 조회</h3>
							</div>
						</a>
					</div>
					<div class="col-md-3 mb-20">
						<a href="javascript:list();" class="card-box d-block mx-auto pd-20 text-secondary text-center">
							<div class="img pb-30">
								<img src="${pageContext.request.contextPath}/resources/images/table.png" alt="">
							</div>
							<div class="content">
								<h3 class="h1">보전 내역</h3>
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
		
		function insert(){
			openPage("/facility/routine/insert", 500, 766);
		}
		
		function list(){
			openPage("/facility/routine/list", 500, 600);
		}
	</script>
</body>
</html>