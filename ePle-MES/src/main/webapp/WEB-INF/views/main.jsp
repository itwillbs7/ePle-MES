<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<%@ include file="include/head.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/src/plugins/fullcalendar/fullcalendar.css" />
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.10/index.global.min.js'></script>
<title>메인</title>
</head>
<body>
	<%@ include file="include/header.jsp"%>
	<%@ include file="include/right-side-bar.jsp"%>
	<%@ include file="include/left-side-bar.jsp"%>
	<!-- 메인 컨테이너 -->
	<div class="main-container">
		<div class="pd-ltr-20 xs-pd-20-10">

			<div class="card-box pd-20 height-100 mb-30">
				<div class="row align-items-center">
					<div class="col-md-3">
						<img
							src="${pageContext.request.contextPath}/resources/vendors/images/banner-img.png"
							alt="" />
					</div>
					<div class="col-md-5">
						<h4 class="font-20 weight-500 mb-10 text-capitalize">
							환영합니다,
							<div class="weight-600 font-30 text-blue">${sessionScope.name}
								님!</div>
						</h4>
					</div>
					<div class="col-md-4">
						<p>
						<ul class="list-group list-group-flush mb-5">
							<li class="list-group-item"><b>부서</b>&nbsp;&nbsp;&nbsp;${sessionScope.dep_group}</li>
							<li class="list-group-item"><b>직책</b>&nbsp;&nbsp;&nbsp;${sessionScope.pos_group}</li>
							<li class="list-group-item"><b>최종 로그인 시간</b>&nbsp;&nbsp;${sessionScope.login}</li>
						</ul>
						<button type="button" class="btn btn-info btn-block" onclick="location.href='/logout'">
							<i class="dw dw-logout1"></i> 로그아웃
						</button>
						</p>
					</div>
				</div>
			</div>
			<div class="min-height-200px">
				<div class="row">
					<div class="col-xl-7 mb-30">
						<div class="card-box height-100-p pd-20">
						<h2 class="h4 mb-30" style="margin-bottom: 120px;">생산</h2>
							<div id="chart5"></div>
						</div>
					</div>
					<div class="col-xl-5 mb-30">
						<div class="card-box height-100-p pd-20">
						<h2 class="h4 mb-20">일정</h2>
							<div class="text-center">
									<h2 class="text-blue"></h2>
								</div>
							<div class="calendar-wrap">
								<div id="calendar"></div>
							</div>
						</div>
					</div>
				</div>
				<!-- 푸터 -->
				<%@ include file="include/github.jsp"%>
				<%@ include file="include/footer.jsp"%>
			</div>
		</div>
	</div>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
	<!-- fullcalendar 언어 설정관련 script -->
	<script
		src="${pageContext.request.contextPath}/resources/vendors/scripts/calendar-setting.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/src/plugins/fullcalendar/fullcalendar.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$(".fc-right").addClass("pull-right");
			$(".fc-left").addClass("text-center");
			$(".fc-clear").remove();
			$(".fc-center").remove();
			
			var dateList = [];
			var totalList = [];
			
			<c:forEach var="i" items="${week}">
				dateList.push("${i.date}");
				totalList.push(${i.total});
			</c:forEach>
			
			var options5 = {
					chart: {
						height: 350,
						type: 'bar',
						parentHeightOffset: 0,
						fontFamily: 'Poppins, sans-serif',
						toolbar: {
							show: false,
						},
					},
					colors: ['#1b00ff', '#f56767'],
					grid: {
						borderColor: '#c7d2dd',
						strokeDashArray: 5,
					},
					plotOptions: {
						bar: {
							horizontal: false,
							columnWidth: '25%'
						},
					},
					dataLabels: {
						enabled: false
					},
					stroke: {
						show: true,
						width: 2,
						colors: ['transparent']
					},
					series: [{
						name: '생산량',
						data: totalList
					}],
					xaxis: {
						categories: dateList,
						labels: {
							style: {
								colors: ['#353535'],
								fontSize: '16px',
							},
						},
						axisBorder: {
							color: '#8fa6bc',
						}
					},
					yaxis: {
						title: {
							text: ''
						},
						labels: {
							style: {
								colors: '#353535',
								fontSize: '16px',
							},
						},
						axisBorder: {
							color: '#f00',
						}
					},
					legend: {
						horizontalAlign: 'right',
						position: 'top',
						fontSize: '16px',
						offsetY: 0,
						labels: {
							colors: '#353535',
						},
						markers: {
							width: 10,
							height: 10,
							radius: 15,
						},
						itemMargin: {
							vertical: 0
						},
					},
					fill: {
						opacity: 1

					},
					tooltip: {
						style: {
							fontSize: '15px',
							fontFamily: 'Poppins, sans-serif',
						},
						y: {
							formatter: function (val) {
								return val
							}
						}
					}
				}

			var chart5 = new ApexCharts(document.querySelector("#chart5"), options5);
			chart5.render();

		});
	</script>
</body>
</html>