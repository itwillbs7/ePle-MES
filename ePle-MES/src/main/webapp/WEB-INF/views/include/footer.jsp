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

	// 대상 테이블
	var table = document.getElementById('datatable');

	// table.rows.length - 1 = 헤더를 제외한 row 개수
	// 테이블 행들
	var rowList = table.rows;
	var rowCount = table.rows.length - 1;

	// 버튼 그룹 div
	var buttonDiv = document.getElementById('buttonDiv');

	// 현재 페이지
	var currentPage = 1;

	// 페이지당 행 개수
	var rowsInPage = 10;

	// 총합 페이지
	var totalPage = 0;

	// 페이지당 최대 버튼 개수
	var pageButton = 5;

	// 이전에 선택한 페이지
	var previousPage = 0;

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

	// 페이지 내 row 처리
	function changeDisplayRow(i) {
		previousPage = currentPage;
		switch (i) {
		case 'next':
			currentPage += 1;
			if (currentPage > totalPage)
				currentPage = totalPage;
			break;
		case 'prev':
			currentPage -= 1;
			if (currentPage < 1)
				currentPage = 1;
			break;
		case 'bigNext':
			currentPage += (currentPage % pageButton) + 1;
			break;
		case 'bigPrev':
			currentPage -= pageButton;
			currentPage = currentPage - (currentPage % pageButton) + 1;
			break;
		case '':
			break;
		default:
			currentPage = i;
		}
		$("tr").css("display", "none");
		rowList[0].style.display = "table-row";
		if (totalPage == 1) {
			$("tr").css("display", "table-row");
			$(".dataTable_info").html(
					"&nbsp;&nbsp;" + rowCount + "개 중 " + rowCount + "개");
		} else {
			var startRow = ((currentPage - 1) * rowsInPage) + 1
			var endRow = (currentPage * rowsInPage) > table.rows.length ? table.rows.length
					: (currentPage * rowsInPage);
			for (var j = startRow; j <= endRow; j++) {
				rowList[j].style.display = "table-row";
			}
			$(".dataTable_info").html(
					"&nbsp;&nbsp;" + startRow + " - " + endRow + "(" + rowCount
							+ "개 중 " + rowsInPage + "개)");
		}
		
		$("#page-btn-group").empty();
		var start = currentPage - (currentPage % pageButton) + 1;
		var end = (start + pageButton) > totalPage ? totalPage
				: (start + pageButton);
		if (currentPage > 1) {
			$("#page-btn-group")
					.append(
							'<button type="button" id="pagebtn" class="btn btn-light prev"><i class="fa fa-angle-left"></i></button>');
			$(".prev").attr("onclick", "changeDisplayRow('prev')");
		}
		if (currentPage > pageButton) {
			$("#page-btn-group")
					.append(
							'button type="button" id="pagebtn" class="btn btn-light bigPrev"><i class="fa fa-angle-double-left"></i></button>')
			$(".bigPrev").attr("onclick", "changeDisplayRow('bigPrev')");
		}
		for (var i = start; i <= end; i++) {
			if (i == currentPage)
				$("#page-btn-group")
						.append(
								'<button type="button" id="pagebtn" class="btn btn-primary pagebtn" onclick="changeDisplayRow('
										+ i + ')">' + i + '</button>')
			else
				$("#page-btn-group")
						.append(
								'<button type="button" id="pagebtn" class="btn btn-light pagebtn" onclick="changeDisplayRow('
										+ i + ')">' + i + '</button>')
		}
		if (currentPage < totalPage) {
			$("#page-btn-group")
					.append(
							'<button type="button" id="pagebtn" class="btn btn-light next"><i class="fa fa-angle-right"></i></button>')
			$(".next").attr("onclick", "changeDisplayRow('next')");
		}
		if ((totalPage + (totalPage % pageButton)) - pageButton + 1 > currentPage) {
			$("#page-btn-group")
					.append(
							'<button type="button" id="pagebtn" class="btn btn-light bigNext"><i class="fa fa-angle-double-right"></i></button>')
			$(".bigNext").attr("onclick", "changeDisplayRow('bigNext')");
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