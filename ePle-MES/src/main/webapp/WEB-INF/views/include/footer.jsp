<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 푸터, 스크립트 전용 -->
<!-- js -->
<script
	src="${pageContext.request.contextPath}/resources/vendors/scripts/core.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/vendors/scripts/script.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/vendors/scripts/process.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/vendors/scripts/layout-settings.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/src/plugins/apexcharts/apexcharts.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/src/plugins/datatables/js/jquery.dataTables.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/src/plugins/datatables/js/dataTables.bootstrap4.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/src/plugins/datatables/js/dataTables.responsive.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/src/plugins/datatables/js/responsive.bootstrap4.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/vendors/scripts/dashboard.js"></script>
<!-- Google Tag Manager (noscript) -->
<noscript>
	<iframe src="https://www.googletagmanager.com/ns.html?id=GTM-NXZMQSS"
		height="0" width="0" style="display: none; visibility: hidden"></iframe>
</noscript>
<div class="data" style="display: hidden"></div>
<script type="text/javascript">
	// ex ) /facility/list
	var contextPath = window.location.pathname;

	// ex ) /facility/getAjax
	var ajaxLink = contextPath.substr(0, contextPath.length - 4) + "getAjax";
	function buttonCategory(a) {
		var buttonText = document.getElementById("searchCategoryButton");
		var category = document.getElementById("searchCategory");
		switch (a) {
		case 'code':
			buttonText.innerText = "코드";
			break;
		case 'model':
			buttonText.innerText = "모델";
			break;
		case 'name':
			buttonText.innerText = "이름";
			break;
		case 'location':
			buttonText.innerText = "위치";
			break;
		}
		category.value = a;
	}

	// 데이터 내보내기
	/* var sendOption = {
			type : 'post', // post 방식으로 전송
			url : ajaxLink, // 데이터를 주고받을 파일 주소
			data : sendData, // 위의 변수에 담긴 데이터를 전송해준다.
			datatype: "html", // json 파일 형식으로 값을 담아온다.
			success : function(data) { // 파일 주고받기가 성공했을 경우. data 변수 안에 값을 담아온다.
				$('.data').html(data); // 영역 안에 data안에 담긴 html 코드를 넣어준다. 
			}; */

	function exportData(i) {
		// 전체 데이터 받아오기
		var rightDate = new Date();
		var leftDate = new Date(rightDate.setMonth(rightDate.getMonth() - 1));
		rightDate = new Date();
		if ($("#dateLeft") != null && $("#dateRight") != null) {
			if ($("#dateLeft").attr("val") == null
					&& $("#dateRight").attr("val") == null) {
				// 000 between 000
				$("#dataLeft")
						.attr("val", leftDate.toISOString().substr(0, 11));
				$("#dataRight").attr("val",
						rightDate.toISOString().substr(0, 11));
			} else if ($("#dataLeft").attr("val") == null) {
				// 000 between dataRight

			} else if ($("#dataRight").attr("val") == null) {
				// dataLeft between 000
				$("#dataRight").attr("val",
						rightDate.toISOString().substr(0, 11));
			}
		}
		var option = {
			type : 'post', // post 방식으로 전송
			data : sendData, // 위의 변수에 담긴 데이터를 전송해준다.
			datatype : "html", // json 파일 형식으로 값을 담아온다.
			success : function(data) { // 파일 주고받기가 성공했을 경우. data 변수 안에 값을 담아온다.
				$('.data').html(data); // 영역 안에 data안에 담긴 html 코드를 넣어준다. 
			}
		}
		// 검색 폼을 ajax 링크로 변경하고 받음
		$('#accordion-search').attr("action", ajaxLink);
		$('#accordion-search').attr("method", "POST");
		
		$('#accordion-search').submit(function(){
			$(this).ajaxSubmit(option);
			return false;
		});
		
		$('#accordion-search').attr("action", contextPath);
		$('#accordion-search').attr("method", "GET");
		switch (i) {
		case 1:
			// PDF

			break;
		case 2:
			// CSV

			break;
		case 3:
			// 인쇄

			break;
		}
	}

	// 페이지 이동, 상세 검색 정보 유지
	function movePage(i) {
		var isEmpty = true;
		$('#accordion-search').find('input').each(function() {
			if ($(this).val() != null) {
				isEmpty = false;
			}
		});
		alert(link);
		if (isEmpty) {
			location.href = contextPath + "?page=" + i;
		} else {
			$('#accordion-search').attr("action", contextPath + "?page=" + i);
			$('#accordion-search').submit();
		}
	}

	// 페이지 이동, 상세 검색 정보 유지
	function changePageSize(i) {
		var isEmpty = true;
		$('#accordion-search').find('input').each(function() {
			if ($(this).val() != null) {
				isEmpty = false;
			}
		});
		if (isEmpty) {
			location.href = contextPath + "?page=1&pageSize=" + i;
		} else {
			$('#accordion-search').attr("action",
					contextPath + "?page=1&pageSize=" + i);
			$('#accordion-search').submit();
		}
	}

	$(document).ready(function() {
		// 테이블 체크 박스 클릭 시 전체선택
		$("#tableCheckAll").click(function() {
			if ($("#tableCheckAll").is(":checked"))
				$("input[name=tableCheck]").prop("checked", true);
			else
				$("input[name=tableCheck]").prop("checked", false);
		});

		$("#formCheckAll").click(function() {
			if ($("#formCheckAll").is(":checked"))
				$("input[name=formCheck]").prop("checked", true);
			else
				$("input[name=formCheck]").prop("checked", false);
		});

		// 상세검색 초기화
		$("#reset").click(function() {
			buttonCategory(null);
			$(".select2-selection__choice").remove();
		});
	});
</script>
<!-- End Google Tag Manager (noscript) -->