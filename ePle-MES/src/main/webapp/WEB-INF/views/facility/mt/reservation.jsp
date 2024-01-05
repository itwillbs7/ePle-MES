<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
									<h3 class="h3">
										<span class="event-title"></span> (<span class="event-index"></span>) <span class="btn-group pull-right">
											<button type="button" class="btn btn-sm btn-secondary" onclick="javascript:editReservation();">
												<b>수정</b>
											</button>
											<button type="button" class="btn btn-sm btn-danger" onclick="javascript:deleteReservation();">
												<b>삭제</b>
											</button>
										</span>
									</h3>
									<dl class="row">
										<dt class="col-sm-3">사유</dt>
										<dd class="event-description col-sm-9"></dd>

										<dt class="col-sm-3">라인 정보</dt>
										<dd class="event-line col-sm-9 "></dd>
										
										<dt class="col-sm-3">예약 시간</dt>
										<dd class="event-time col-sm-9"></dd>
									</dl>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>
								</div>
							</div>
						</div>
					</div>

					<div id="modal-view-event-add" class="modal modal-top fade calendar-modal">
						<div class="modal-dialog modal-dialog-centered">
							<div class="modal-content">
								<form id="add-event" method="post">
									<div class="modal-body">
										<h3 class="text-blue h3 mb-10">예약 추가</h3>
										<div class="form-group">
											<label><b>보전 제목</b></label> <input type="text" class="form-control" name="mt_subject" />
										</div>
										<div class="form-group">
											<label><b>라인 정보</b></label> <select class="form-control" name="line_code">
												<option>선택</option>
												<c:forEach items="${line}" var="i">
													<option value="${i.code}">${i.name}</option>
												</c:forEach>
											</select>
										</div>
										<div class="form-group">
											<label><b>예약 일정</b></label> <input class="form-control datetimepicker" name="reservation" placeholder="예약 시간 입력" type="text" />
										</div>
										<div class="form-group">
											<label><b>내용</b></label>
											<textarea class="form-control" name="mt_content"></textarea>
										</div>
										<input type="hidden" name="ecolor" value="fc-bg-default"> <input type="hidden" name="eicon" value="cog">
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

					<div id="modal-view-event-edit" class="modal modal-top fade calendar-modal">
						<div class="modal-dialog modal-dialog-centered">
							<div class="modal-content">
								<form id="edit-event" method="post">
									<div class="modal-body">
										<h3 class="text-blue h3 mb-10">예약 편집</h3>
										<input type="hidden" name="index" id="edit-event-index">
										<div class="form-group">
											<label><b>보전 제목</b></label> <input type="text" class="form-control" name="mt_subject" id="edit-event-title"/>
										</div>
										<div class="form-group">
											<label><b>라인 정보</b></label> <select class="form-control" name="line_code">
												<option>선택</option>
												<c:forEach items="${line}" var="i">
													<option value="${i.code}">${i.name}</option>
												</c:forEach>
											</select>
										</div>
										<div class="form-group">
											<label><b>예약 일정</b></label> <input class="form-control datetimepicker" id="edit-event-time" name="reservation" placeholder="예약 시간 입력" type="text" />
										</div>
										<div class="form-group">
											<label><b>내용</b></label>
											<textarea class="form-control" name="edesc"></textarea>
										</div>
										<input type="hidden" name="ecolor" value="fc-bg-default"> <input type="hidden" name="eicon" value="cog">
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
					
					<div id="modal-view-event-delete" class="modal modal-top fade calendar-modal">
						<div class="modal-dialog modal-dialog-centered">
							<div class="modal-content">
								<form id="delete-event" method="post">
									<div class="modal-body">
										<h3 class="text-blue h3 mb-10">예약 삭제</h3>
										<h5>삭제 하시겠습니까?</h5>
										<input type="hidden" id="delete-event-index" name="index">
									</div>
									<div class="modal-footer">
										<div class="col-sm-12 mb-3 btn-toolbar btn-group">
											<button type="button" class="btn btn-secondary" data-dismiss="modal">
												<b>취소</b>
											</button>
											<button type="submit" class="btn btn-danger">
												<b>삭제</b>
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
	<script src="${pageContext.request.contextPath}/resources/src/plugins/fullcalendar/fullcalendar.js"></script>
	<script type="text/javascript">
	$(document).ready(function () {
		$("#add-event").submit(function () {
			var formData = $(this).serialize();
			$.ajax({
				cache : false,
				type : 'POST', // post 방식으로 전송
				url : "/facility/maintenance/reservation/insert",// 링크
				data : formData,
				success : function() {
					alert("데이터 전송 성공!");
				},
				error : function() {
					alert("데이터 받기 실패!");
				},
				complete : function(){
					window.location.href=window.location.href;
				}
			});
			return false;
		});
		
		$("#edit-event").submit(function () {
			var formData = $(this).serialize();
			$.ajax({
				cache : false,
				type : 'POST', // post 방식으로 전송
				url : "/facility/maintenance/reservation/update",// 링크
				data : formData,
				success : function() {
					alert("데이터 전송 성공!");
				},
				error : function() {
					alert("데이터 받기 실패!");
				},
				complete : function(){
					window.location.href=window.location.href;
				}
			});
			return false;
		});
		
		$("#delete-event").submit(function () {
			var formData = $(this).serialize();
			$.ajax({
				cache : false,
				type : 'POST', // post 방식으로 전송
				url : "/facility/maintenance/reservation/delete",// 링크
				data : formData,
				success : function() {
					alert("데이터 전송 성공!");
				},
				error : function() {
					alert("데이터 받기 실패!");
				},
				complete : function(){
					window.location.href=window.location.href;
				}
			});
			return false;
		});
	});

	(function () {
		"use strict";
		// ------------------------------------------------------- //
		// Calendar
		// ------------------------------------------------------ //
		jQuery(function () {
			// page is ready
			$("#calendar").fullCalendar({
				timeZone:"KST",
				themeSystem: "bootstrap4",
				defaultView: "month",
				// emphasizes business hours
				businessHours: false,
				// event dragging & resizing
				editable: true,
				// header
				selectable : true, // 달력 일자 드래그 설정가능
				droppable : true,
				nowIndicator: true, // 현재 시간 마크,
	            header: {
	                left: "today",
	                center: "prev, title, next",
	                right: ""
	            },
	            timeFormat: 'H(:mm)', // uppercase H for 24-hour clock
	            events: [
					{
						code: '1',
						title: "정보",
						description:
							"내용",
						start : "2024-01-05 14:30:00",
						line_code : 'test1',
						line_name : 'a',
						allDay:false,
					}
				],
	            // 국경일, 기념일, 공휴일 가져오기
	            // 공공 데이터 포털에서 가능(API 신청 완료)
				dayClick: function () {
					jQuery("#modal-view-event-add").modal();
				},
				eventClick: function (event, jsEvent, view) {
					$(".event-title").html(event.title);
					$(".event-index").html(event.code);
					$(".event-description").html(event.description);
					$(".event-line").html(event.line_name+"(" + event.line_code +")");
					$(".event-time").html(new Date(event.start - (9 * 60 * 60 * 1000)).toLocaleString('kst').toString());
					$(".eventUrl").attr("href", event.url);
					$("#modal-view-event").modal();
				},
				eventDrop: function (event) {
			        alert(event.title + ' : ' + new Date(event.start - (9 * 60 * 60 * 1000)).toLocaleString('kst') + ', ' + new Date(event.end - (9 * 60 * 60 * 1000)).toLocaleString('kst'));
					$.ajax({
						cache : false,
						type : 'POST', // post 방식으로 전송
						url : "/facility/maintenance/reservation/updateTime",// 링크
						data : {
							"code" : event.code,
							"reservation" : new Date(event.reservation - (9 * 60 * 60 * 1000)).toLocaleString('kst')
						},
						success : function() {
							alert("데이터 전송 성공!");
						},
						error : function() {
							alert("데이터 받기 실패!");
						},
						complete : function(){
							window.location.href=window.location.href;
						}
					});
				},
			});
		});
	})(jQuery);
		
		function editReservation(){
			$("#edit-event-index").attr("value", $(".event-index").html());
			$("#edit-event-title").attr("value", $(".event-title").html());
			$("#edit-event-time").attr("value", $(".event-time").html());
			$("#modal-view-event-edit").modal();
		}
		
		function deleteReservation(){
			$("#delete-event-index").attr("value", event.index);
			$("#modal-view-event-delete").modal();
		}
	</script>
</body>
</html>