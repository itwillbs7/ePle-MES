<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<%@ include file="include/head.jsp"%>
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.10/index.global.min.js'></script>
<script>

      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
        	height: '50%', 	// calendar 높이 설정
            expandRows: true, // 화면에 맞게 높이 재설정
         	initialView: 'dayGridMonth', 
          	headerToolbar: {
              left: 'prevYear,prev,next,nextYear today',
              center: 'title',
              right: 'dayGridMonth,timeGridWeek,timeGridDay'
         	},
          	nowIndicator: true, // 현재 시간 마크
          	dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇개로 표현)
          	locale: 'ko', // 한국어 설정 
          	buttonText: {
                today : "오늘",
                month : "월별",
                week : "주별",
                day : "일별",
              },
          	eventSources: [
                {
                  googleCalendarApiKey: 'AIzaSyDSkZ5Xvf5Qk5mfavVv-S5GXm1NXhCewJ4',
                  googleCalendarId: 'klop1211@gmail.com', 
                  className: '윤수민'
                },
                {
                  googleCalendarApiKey: 'AIzaSyDSkZ5Xvf5Qk5mfavVv-S5GXm1NXhCewJ4',
                  googleCalendarId: 'ko.south_korea#holiday@group.v.calendar.google.com',
                  className: '공휴일'
                }
            ], 
          	events: [ // 일정 수동 기입
                {
                title: '라인1 비가동',
                start: '2024-01-15'
                }
          	], 
          
        });
        calendar.render();
      });

</script>
<title>메인</title>
</head>
<body>
	<%@ include file="include/header.jsp"%>
	<%@ include file="include/right-side-bar.jsp"%>
	<%@ include file="include/left-side-bar.jsp"%>
	<div class="main-container">
	
		<div class="pd-ltr-20">
			
			<div>
			
				<div class="col-md-10 mb-20">
					<div id='calendar'>
					</div>
				</div>
				<div class="col-md-10 mb-20">
					<div>
						123123
					</div>
				</div>
				
			</div>
			
		</div>
		
	</div>
			<%@ include file="include/github.jsp"%>
			<%@ include file="include/footer.jsp"%>
</body>
</html>
