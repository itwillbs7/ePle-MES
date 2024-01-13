<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<%@ include file="include/head.jsp"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/src/plugins/fullcalendar/fullcalendar.css" />
<title>메인</title>
</head>
<body>
	<%@ include file="include/header.jsp"%>
	<%@ include file="include/right-side-bar.jsp"%>
	<%@ include file="include/left-side-bar.jsp"%>
	<!-- 메인 컨테이너 -->
	<div class="main-container">
		<div class="pd-ltr-20 xs-pd-20-10">
			<div class="min-height-200px">
				<div class="col-lg-6 col-md-12 col-sm-12 mb-30 card-box">
					<div class="pd-20">
						<div class="mb-10 text-center">
							<h2>일정</h2>
						</div>
						<div class="calendar-wrap">
							<div id="calendar"></div>
						</div>
					</div>
				</div>
				<!-- 푸터 -->
				<%@ include file="include/github.jsp"%>
				<%@ include file="include/footer.jsp"%>
			</div>
		</div>
	</div>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
	<!-- fullcalendar 언어 설정관련 script -->
	<script src="${pageContext.request.contextPath}/resources/vendors/scripts/calendar-setting.js"></script>
	<script src="${pageContext.request.contextPath}/resources/src/plugins/fullcalendar/fullcalendar.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$(".fc-right").addClass("pull-right");
		$(".fc-left").addClass("text-center");
		$(".fc-clear").remove();
		$(".fc-center").remove();
	});
</script>
</body>
</html>