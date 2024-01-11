<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 푸터, 스크립트 전용 -->
<!-- js -->

<!-- jQuery -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

<!-- switchery js -->
<script src="${pageContext.request.contextPath}/resources/src/plugins/switchery/switchery.min.js"></script>
<!-- bootstrap-tagsinput js -->
<script src="${pageContext.request.contextPath}/resources/src/plugins/bootstrap-tagsinput/bootstrap-tagsinput.js"></script>
<!-- bootstrap-touchspin js -->
<script src="${pageContext.request.contextPath}/resources/src/plugins/bootstrap-touchspin/jquery.bootstrap-touchspin.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendors/scripts/advanced-components.js"></script>

<script src="${pageContext.request.contextPath}/resources/vendors/scripts/core.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendors/scripts/script.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendors/scripts/process.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendors/scripts/layout-settings.js"></script>

<script src="${pageContext.request.contextPath}/resources/src/plugins/datatables/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/src/plugins/datatables/js/dataTables.bootstrap4.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/src/plugins/datatables/js/dataTables.responsive.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/src/plugins/datatables/js/responsive.bootstrap4.min.js"></script>

<script src="${pageContext.request.contextPath}/resources/src/plugins/apexcharts/apexcharts.min.js"></script>
<%-- <script src="${pageContext.request.contextPath}/resources/vendors/scripts/dashboard.js"></script> --%>
<!-- Google Tag Manager (noscript) -->
<noscript>
	<iframe src="https://www.googletagmanager.com/ns.html?id=GTM-NXZMQSS" height="0" width="0" style="display: none; visibility: hidden"></iframe>
</noscript>
<div class="data" style="display: hidden"></div>
<script type="text/javascript">
	//팝업 설정
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
	
	function closePopup(){
		console.log('함수실행');
		opener.location.reload();
		window.close();
	}
	

	// 창 열기
	function openPage(i, width, height) {
		set = retPopupSetting(width, height);
		return window.open(i, 'Popup_Window', set);
	}
	
	function closePopup(){
		opener.location.reload();
		window.close();
	}
	
	// ex ) /facility/list
	var contextPath = window.location.pathname;

	// 폼이 다 차 있는지 체크
	function formCheck(i) {
		$(i)
				.find('input')
				.each(
						function() {
							var value = $(this).val();
							if (value === ""
									|| value === null
									|| value == "undefined"
									|| (value != null
											&& typeof value == "object" && !Object
											.keys(value).length)) {
								return false;
							}
						});
		$(i).find('select').each(function() {
			var value = $(this).data('option');
			if (value == null || value == "undefined" || value == "") {
				return false;
			}
		});
		return true;
	}

	function orderList(i) {
		var a = document.getElementById("sortCategory");
		var b = document.getElementById("sortValue");
		if (a.value == i) {
			if (b.value == "asc")
				b.value = "desc";
			else
				b.value = "asc";
		} else {
			a.value = i;
			b.value = "asc";
		}
		$('#accordion-search').submit();
	}

	// ex ) /facility/getAjax
	var ajaxLink = contextPath.substr(0, contextPath.length - 4) + "json";

	// 데이터 내보내기
	// 다음주에 추가 구현
	function exportData(i) {
		var rightDate = new Date();
		var leftDate = new Date(rightDate.setMonth(rightDate.getMonth() - 1));
		rightDate = new Date();
		var left = leftDate.toISOString().slice(0, 10);
		var right = rightDate.toISOString().slice(0, 10);
		var formData = $("#accordion-search").serialize();

		$.ajax({
			cache : false,
			type : 'POST', // post 방식으로 전송
			url : ajaxLink,// 링크
			data : formData,
			datatype : "json", // json 파일 형식으로 값을 담아온다.	
			success : function(data) {
				// 데이터가 생길 때 구현
				switch (i) {
				case 1:
					// PDF
					downloadPDF(data);
					break;
				case 2:
					// CSV
					downloadCSV(data);
					break;
				case 3:
					// 인쇄
					printResult(data);
					break;
				}
			},
			error : function() {
				alert("데이터 받기 실패!");
			}
		});
	}

	// 페이지 이동, 상세 검색 정보 유지
	function pageMove(i) {
		document.getElementById("page").value = i;
		$('#accordion-search').submit();
	}

	// 페이지 이동, 상세 검색 정보 유지
	function changePageSize(i) {
		document.getElementById("pageSize").value = i;
		$('#accordion-search').submit();
	}
	
	function closePopup(){
		opener.location.reload();
		window.close();
	}
	
	// 페이지 이동, 상세 검색 정보 유지
	function pageMove(i) {
		document.getElementById("page").value = i;
		$('#accordion-search').submit();
	}

	// 페이지 이동, 상세 검색 정보 유지
	function changePageSize(i) {
		document.getElementById("pageSize").value = i;
		$('#accordion-search').submit();
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
			//buttonCategory(null);
			var today = new Date();
			var todayString = today.getFullYear() + "-" + (today.getMonth() + 1).toString().padStart(2, '0') + "-" + today.getDate().toString().padStart(2, '0');
			$("#searchProduction_date").text(todayString);
			$(".select2-selection__choice").remove();
			$("#isFinished").removeAttr("checked");
		});
	});
</script>
<!-- End Google Tag Manager (noscript) -->