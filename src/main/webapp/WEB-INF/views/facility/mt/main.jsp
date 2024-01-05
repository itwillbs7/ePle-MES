<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<%@ include file="../../include/head.jsp"%>
<title>일상 보전</title>
</head>
<body>
<!-- 직원의 경우 보전 등록, 자신이 등록한 것만 보도록 함 -->
<!-- 관리자의 경우 보전 등록 및 전체 조회 가능, 보전 작업 실시 -->
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
				<c:choose>
					<c:when test="${empty role}">
						<c:redirect url="/" />
					</c:when>
					<c:when test="${role eq 'emp'}">
						<!-- row -->
						<div class="row">
							<div class="col-md-6 mb-20">
								<a href="javascript:insert();" class="card-box d-block mx-auto pd-20 text-secondary text-center">
									<div class="img pb-30 ">
										<img src="${pageContext.request.contextPath}/resources/images/plus.png" alt="">
									</div>
									<div class="content">
										<h3 class="h1">보전 등록</h3>
									</div>
								</a>
							</div>
							<div class="col-md-6 mb-20">
								<a href="javascript:list();" class="card-box d-block mx-auto pd-20 text-secondary text-center">
									<div class="img pb-30">
										<img src="${pageContext.request.contextPath}/resources/images/table.png" alt="">
									</div>
									<div class="content">
										<h3 class="h1">보전 조회</h3>
									</div>
								</a>
							</div>
						</div>
						<!-- row -->
					</c:when>
					<c:when test="${role eq 'manager'}">
						<c:redirect url="/facility/mt/status" />
					</c:when>
				</c:choose>
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

		function insert() {
			openPage("/facility/mt/insert", 500, 766);
		}

		function list() {
			openPage("/facility/mt/list", 500, 600);
		}
	</script>
</body>
</html>