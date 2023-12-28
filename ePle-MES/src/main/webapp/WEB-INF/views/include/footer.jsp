<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<script src="${pageContext.request.contextPath}/resources/vendors/scripts/script.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendors/scripts/process.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendors/scripts/layout-settings.js"></script>

<script src="${pageContext.request.contextPath}/resources/src/plugins/apexcharts/apexcharts.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendors/scripts/dashboard.js"></script>
<!-- Google Tag Manager (noscript) -->
<noscript>
	<iframe src="https://www.googletagmanager.com/ns.html?id=GTM-NXZMQSS" height="0" width="0" style="display: none; visibility: hidden"></iframe>
</noscript>
<div class="data" style="display: hidden"></div>
<script type="text/javascript">
	// ex ) /facility/list
	var contextPath = window.location.pathname;

	// 받은 form이 다 비어 있는지 체크
	function ajaxFormCheck(i) {
		$(i).find('input').each(function() {
			var value = $(this).val();
			if (value === "" || value === null || value == "undefined" 
					|| (value != null && typeof value == "object" && !Object.keys(value).length)) {
			}
			else return true; // 비어있지 않음
		});
		$(i).find('select').each(function(){
			var value = $(this).data('option');
			if(value == null || value == "undefined" || value == ""){
				
			}
			else return true;
		})
		return false; // 비어있음
	}
	
	// 폼이 다 차 있는지 체크
	function formCheck(i){
		$(i).find('input').each(function() {
			var value = $(this).val();
			if (value === "" || value === null || value == "undefined" 
					|| (value != null && typeof value == "object" && !Object.keys(value).length)) {
				return false;
			}
		});
		$(i).find('select').each(function(){
			var value = $(this).data('option');
			if(value == null || value == "undefined" || value == ""){
				 return false;
			}
		});
		return true;
	}
	
	
	// 일반 검색 카테고리 input 저장
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
	
	function orderList(i){
		var order = document.getElementById("order" + i);
		if(order.value == "asc") order.value = "desc";
		else order.value = "asc";
		$('#accordion-search').submit();
	}

	// ex ) /facility/getAjax
	var ajaxLink = contextPath.substr(0, contextPath.length - 4) + "json";

	// 데이터 내보내기
	function exportData(i) {
		var rightDate = new Date();
		var leftDate = new Date(rightDate.setMonth(rightDate.getMonth() - 1));
		rightDate = new Date();
		var left = leftDate.toISOString().slice(0, 10);
		var right = rightDate.toISOString().slice(0, 10);
		if (!ajaxFormCheck("#accordion-search")){
			document.getElementById("dateLeft").value = left;
			document.getElementById("dateRight").value = right;
			return;
		}
		
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
			error : function() { alert("데이터 받기 실패!"); }
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
			buttonCategory();
			$(".select2-selection__choice").remove();
		});
	});
</script>
<!-- End Google Tag Manager (noscript) -->