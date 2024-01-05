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
            // 국경일, 기념일, 공휴일 가져오기
            // 공공 데이터 포털에서 가능(API 신청 완료)
			events: [
				{
					index: '1',
					title: "정보",
					description:
						"내용",
					start: "2024-01-05",
					end: "2024-01-05",
					className: "fc-bg-default",
					icon: "circle",
				},
				{
					index: '1',
					title: "Flight Paris",
					description:
						"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras eu pellentesque nibh. In nisl nulla, convallis ac nulla eget, pellentesque pellentesque magna.",
					start: "2022-08-08T14:00:00",
					end: "2022-08-08T20:00:00",
					className: "fc-bg-deepskyblue",
					icon: "cog",
					allDay: false,
				},
				{
					code: '1',
					title: "Team Meeting",
					description:
						"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras eu pellentesque nibh. In nisl nulla, convallis ac nulla eget, pellentesque pellentesque magna.",
					start: "2022-07-10T13:00:00",
					end: "2022-07-10T16:00:00",
					className: "fc-bg-pinkred",
					icon: "group",
					allDay: false,
				},
				{
					index: '1',
					title: "Meeting",
					description:
						"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras eu pellentesque nibh. In nisl nulla, convallis ac nulla eget, pellentesque pellentesque magna.",
					start: "2022-08-12",
					className: "fc-bg-lightgreen",
					icon: "suitcase",
				},
				{
					index: '1',
					title: "Conference",
					description:
						"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras eu pellentesque nibh. In nisl nulla, convallis ac nulla eget, pellentesque pellentesque magna.",
					start: "2022-08-13",
					end: "2022-08-15",
					className: "fc-bg-blue",
					icon: "calendar",
				},
				{
					index: '1',
					title: "Baby Shower",
					description:
						"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras eu pellentesque nibh. In nisl nulla, convallis ac nulla eget, pellentesque pellentesque magna.",
					start: "2022-07-13",
					end: "2022-07-14",
					className: "fc-bg-default",
					icon: "child",
				},
				{
					index: '1',
					title: "Birthday",
					description:
						"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras eu pellentesque nibh. In nisl nulla, convallis ac nulla eget, pellentesque pellentesque magna.",
					start: "2022-09-13",
					end: "2022-09-14",
					className: "fc-bg-default",
					icon: "birthday-cake",
				},
				{
					index: '1',
					title: "Restaurant",
					description:
						"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras eu pellentesque nibh. In nisl nulla, convallis ac nulla eget, pellentesque pellentesque magna.",
					start: "2022-10-15T09:30:00",
					end: "2022-10-15T11:45:00",
					className: "fc-bg-default",
					icon: "glass",
					allDay: false,
				},
				{
					index: '1',
					title: "Dinner",
					description:
						"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras eu pellentesque nibh. In nisl nulla, convallis ac nulla eget, pellentesque pellentesque magna.",
					start: "2022-11-15T20:00:00",
					end: "2022-11-15T22:30:00",
					className: "fc-bg-default",
					icon: "cutlery",
					allDay: false,
				},
				{
					index: '1',
					title: "Shooting",
					description:
						"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras eu pellentesque nibh. In nisl nulla, convallis ac nulla eget, pellentesque pellentesque magna.",
					start: "2022-08-25",
					end: "2022-08-25",
					className: "fc-bg-blue",
					icon: "camera",
				},
				{
					index: '1',
					title: "Go Space :)",
					description:
						"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras eu pellentesque nibh. In nisl nulla, convallis ac nulla eget, pellentesque pellentesque magna.",
					start: "2022-12-27",
					end: "2022-12-27",
					className: "fc-bg-default",
					icon: "rocket",
				},
				{
					index: '1',
					title: "Dentist",
					description:
						"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras eu pellentesque nibh. In nisl nulla, convallis ac nulla eget, pellentesque pellentesque magna.",
					start: "2022-12-29T11:30:00",
					end: "2022-12-29T012:30:00",
					className: "fc-bg-blue",
					icon: "medkit",
					allDay: false,
				},
			],
			dayClick: function () {
				jQuery("#modal-view-event-add").modal();
			},
			eventClick: function (event, jsEvent, view) {
				jQuery(".event-title").html(event.title);
				jQuery(".event-index").html(" (" + event.index + ")");
				jQuery(".event-description").append(event.description);
				jQuery(".eventUrl").attr("href", event.url);
				jQuery("#modal-view-event").modal();
			},
		});
	});
})(jQuery);
