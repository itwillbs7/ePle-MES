jQuery(document).ready(function () {
	jQuery("#add-event").submit(function () {
		var formData = $(this).serialize();
		$.ajax({
			cache : false,
			type : 'POST', // post 방식으로 전송
			url : "/facility/maintenance/reservation",// 링크
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
			height: '50%', 	// calendar 높이 설정
            expandRows: true, // 화면에 맞게 높이 재설정
			themeSystem: "bootstrap4",
			defaultView: "month",
			// emphasizes business hours
			businessHours: false,
			// event dragging & resizing
			editable: false,
			// header
			selectable : false, // 달력 일자 드래그 설정가능
			droppable : false,
			nowIndicator: true, // 현재 시간 마크,
            header: {
                left: "prev, title, next",
                right: "today"
            },
            titleFormat : 'YYYY년 MM월',
            // 국경일, 기념일, 공휴일 가져오기
            // 공공 데이터 포털에서 가능(API 신청 완료)
            eventSources: [
                {
                  googleCalendarApiKey: 'AIzaSyDQQE0ve8CxGNFJ6Kztq8pAW05oxkdR5eY',
                  googleCalendarId: 'klop12111@gmail.com', 
                  className: '윤수민'
                },
                {
                  googleCalendarApiKey: 'AIzaSyDQQE0ve8CxGNFJ6Kztq8pAW05oxkdR5eY',
                  googleCalendarId: 'ko.south_korea#holiday@group.v.calendar.google.com',
                  className: '공휴일'
                }
            ], 
          	events: [ // 일정 수동 기입
                {
                	title: '라인2 비가동',
                	start: '2024-01-16',
                },
                {
                	title: '라인3 비가동',
                	start: '2024-01-19',
                },
                {
                	title: '라인4 비가동',
                	start: '2024-01-22',
                }
          	],
            viewRender: function(view) {
                var title = view.title;
                var t = title.split(" ");
                $(".fc-left h2").html(t[3] + " " + t[4]);
             }
		});
	});
})(jQuery);
