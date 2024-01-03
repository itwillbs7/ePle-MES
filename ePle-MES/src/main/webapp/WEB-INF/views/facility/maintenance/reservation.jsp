<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	String today = dateFormat.format(new Date());
%>
<html>
<head>
<%@ include file="../../include/head.jsp"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/src/plugins/fullcalendar/fullcalendar.css" />
<title>보전 예약</title>
</head>
<body>
	<!-- 공통, css 및 js 추가 시 /include/header, footer에서 삽입 -->
	<%@ include file="../../include/header.jsp"%>
	<%@ include file="../../include/right-side-bar.jsp"%>
	<%@ include file="../../include/left-side-bar.jsp"%>
	<!-- 메인 컨테이너 -->
	<div class="main-container">
		<div class="pd-ltr-20 xs-pd-20-10">
			<div class="min-height-200px">
				<div class="title" style="margin-bottom: 10px;">
					<h1>보전 예약</h1>
				</div>
				<div class="pd-20 card-box mb-30">
					<div class="calendar-wrap">
						<div id="calendar"></div>
					</div>
					<!-- calendar modal -->
					<div id="modal-view-event" class="modal modal-top fade calendar-modal">
						<div class="modal-dialog modal-dialog-centered">
							<div class="modal-content">
								<div class="modal-body">
									<h4 class="h4">
										<span class="event-icon weight-400 mr-3"></span><span class="event-title"></span>
									</h4>
									<div class="event-body"></div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
								</div>
							</div>
						</div>
					</div>

					<div id="modal-view-event-add" class="modal modal-top fade calendar-modal">
						<div class="modal-dialog modal-dialog-centered">
							<div class="modal-content">
								<form id="add-event">
									<div class="modal-body">
										<h4 class="text-blue h4 mb-10">예약 추가 정보</h4>
										<div class="form-group">
											<label>보전 제목</label> <input type="text" class="form-control" name="ename" />
										</div>
										<div class="form-group">
											<label>예약 일자</label> <input type="text" class="datetimepicker form-control" name="edate" />
										</div>
										<div class="form-group">
											<label>예약 내용</label>
											<textarea class="form-control" name="edesc"></textarea>
										</div>
										<div class="form-group">
											<label>색깔</label> <select class="form-control" name="ecolor">
												<option value="fc-bg-default">fc-bg-default</option>
												<option value="fc-bg-blue">fc-bg-blue</option>
												<option value="fc-bg-lightgreen">fc-bg-lightgreen</option>
												<option value="fc-bg-pinkred">fc-bg-pinkred</option>
												<option value="fc-bg-deepskyblue">fc-bg-deepskyblue</option>
											</select>
										</div>
										<div class="form-group">
											<label>아이콘</label> <select class="form-control" name="eicon">
												<option value="circle">circle</option>
												<option value="cog">cog</option>
												<option value="group">group</option>
												<option value="suitcase">suitcase</option>
												<option value="calendar">calendar</option>
											</select>
										</div>
									</div>
									<div class="modal-footer">
										<div class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
											<button type="button" class="btn btn-secondary" data-dismiss="modal">
												<b>취소</b>
											</button>
											<button type="submit" class="btn btn-success">
												<b>등록</b>
											</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<!-- 푸터 -->
				<%@ include file="../../include/github.jsp"%>
				<%@ include file="../../include/footer.jsp"%>
			</div>
		</div>
	</div>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
	<!-- fullcalendar 언어 설정관련 script -->
	<script src="${pageContext.request.contextPath}/resources/vendors/scripts/calendar-setting.js"></script>
	<script src="${pageContext.request.contextPath}/resources/src/plugins/fullcalendar/fullcalendar.js"></script>
</body>
</html>