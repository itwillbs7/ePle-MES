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
<div class="data" style="display: hidden">

</div>
<script type="text/javascript">
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

	function exportData(i) {
		// 전체 데이터 받아오기
		var input = "";
		var isEmpty = true;
		$('#accordion-search').find('input').each(function() {
			if ($(this).val() != null) {
				isEmpty = false;
				input += $(this).attr("name") + "=" + $(this).val(); + "&";
			}
		});
		if(isEmpty == true){
			
		}
		var sendData = input.substr(0, input.length - 1);
		
		// 본인의 링크
		var link = ${requestScope['javax.servlet.forward.request_uri']};
		$.ajax({
			type : 'post', // post 방식으로 전송
			url : link, // 데이터를 주고받을 파일 주소
			data : sendData, // 위의 변수에 담긴 데이터를 전송해준다.
			datatype: "JSON", // json 파일 형식으로 값을 담아온다.
			success : function(data) { // 파일 주고받기가 성공했을 경우. data 변수 안에 값을 담아온다.
				$('.data').html(data); // 영역 안에 data안에 담긴 html 코드를 넣어준다. 
			}
		});
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
		var link = $
		{
			requestScope['javax.servlet.forward.request_uri']
		}
		+"?page=" + i;
		if (isEmpty) {
			location.href = link;
		} else {
			$('#accordion-search').attr("action", link);
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
		var link = $
		{
			requestScope['javax.servlet.forward.request_uri']
		}
		+"?page=1&pageSize=" + i;
		if (isEmpty) {
			location.href = link;
		} else {
			$('#accordion-search').attr("action", link);
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