<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 푸터, 스크립트 전용 -->
<!-- js -->
<script src="${pageContext.request.contextPath}/resources/vendors/scripts/core.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendors/scripts/script.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendors/scripts/process.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendors/scripts/layout-settings.js"></script>
<script src="${pageContext.request.contextPath}/resources/src/plugins/apexcharts/apexcharts.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/src/plugins/datatables/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/src/plugins/datatables/js/dataTables.bootstrap4.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/src/plugins/datatables/js/dataTables.responsive.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/src/plugins/datatables/js/responsive.bootstrap4.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendors/scripts/dashboard.js"></script>
<!-- Google Tag Manager (noscript) -->
<noscript>
	<iframe src="https://www.googletagmanager.com/ns.html?id=GTM-NXZMQSS" height="0" width="0" style="display: none; visibility: hidden"></iframe>
</noscript>
<script type="text/javascript">
	function buttonCategory(i) {
		var x = document.getElementById("searchCategoryButton");
		var y = document.getElementById("searchCategory");
		if (i == null) {
			x.innerText = "카테고리";
			y.value = null;
		} else {
			x.innerText = i;
			y.value = i;
		}
	}
	
	function exportData(i) {
		switch (i) {
		case 1:
			// 복사

			break;
		case 2:
			// PDF

			break;
		case 3:
			// CSV

			break;
		case 4:
			// 인쇄

			break;
		}
	}
	
	// 페이징 처리
	function paging() {
		totalPage = (rowCount - (rowCount % rowsInPage)) / rowsInPage;
		totalPage += rowCount % rowsInPage == 0 ? 0 : 1;
		if (totalPage == 1)
			buttonDiv.style.display = "none";
		else {
			buttonDiv.style.display = "flex";
		}
		changeDisplayRow('');
	}

	// 페이지당 보여질 행 개수 지정
	function rowsDisplay(i) {

		if (i == 'all') {
			// 페이지 1개 내에 전체 다 보이기
			rowsInPage = rowCount;
		} else {
			// 페이지당 조회 수 변경
			rowsInPage = i;
		}
		paging();
	}

	$(document).ready(function() {
		// 테이블 페이징 처리
		rowsDisplay(10);

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