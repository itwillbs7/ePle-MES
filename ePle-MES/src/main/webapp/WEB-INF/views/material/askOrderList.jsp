<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<html>
<head>
<%@ include file="../include/head.jsp"%>
<style>
  .table th,
  .table td {
    text-align: center;
  }
</style>
<title>요청 목록</title>
</head>
<body>
	<!----------------- 공통, css 및 js 추가 시 /include/header, footer에서 삽입 ----------------->
	<%@ include file="../include/header.jsp"%>
	<%@ include file="../include/right-side-bar.jsp"%>
	<%@ include file="../include/left-side-bar.jsp"%>
	
	<!------------------------------ 메인 컨테이너 ------------------------------>
	<div class="main-container">
	<div class="pd-ltr-20 xs-pd-20-10">
	<div class="title" style="margin-bottom: 10px;">
		<a href="${pageContext.request.contextPath}/material/askOrderList"><h1>요청 목록</h1></a>
	</div>
		<div class="min-height-200px">
			
	    <ul class="nav nav-pills">
			<li class="nav-item"><a class="nav-link text-blue" href="/material/orderList">발주 관리</a></li>
			<li class="nav-item"><a class="nav-link text-blue active" href="/material/askOrderList">발주 요청 목록</a></li>
		</ul> 
		
	<br>
				
				
				
	<!------------------------- 추가 / 수정 / 삭제 버튼 ------------------------->
	<div class="card-box mb-30">
		<div class="pd-20">
			<div class="btn-group pull-right" style="margin-bottom: 10px; margin-left: 10px;">
				<button type="button" class="btn btn-danger" id="delete"><b>요청 취소</b></button>
			</div>
			<div class="btn-group pull-right" style="margin-bottom: 10px; margin-left: 10px;">
				<button type="button" class="btn btn-warning" id="update"><b>수정</b></button>
			</div>
			<div class="btn-group pull-right" style="margin-bottom: 10px;">
				<button type="button" class="btn btn-success" id="add"><b>요청서 작성</b></button>
			</div>
		</div>

	<!----------------------------- 요청 리스트 출력 ---------------------------->
		<div class="pb-20">
			<div class="col-sm-30">
				<form class="table" id="table">
					<table class="table table-striped">
					<!-- 체크박스 / 발주코드 / 품목코드 / 구분 / 품명 / 요청량+단위 / 신청일 / 발주상태 -->
						<tr>
							<td style="width: 100px;">
								<div class="custom-control custom-checkbox mb-5">
									<input type="checkbox" class="custom-control-input" id="tableCheckAll"> 
									<label class="custom-control-label" for="tableCheckAll"></label>
								</div>
							</td>
							<th>발주코드</th>
							<th>품목코드</th>
							<th>구분</th>
							<th>품명</th>
							<th>발주량</th>
							<th>요청날짜</th>
							<th>요청자</th>
							<th>발주상태</th>
						</tr>

						<c:forEach items="${askOrderList }" var="vo">
						<tr>
							<td>
								<div class="custom-control custom-checkbox mb-5">
									<input type="checkbox" class="custom-control-input checkCode" id="${vo.code }" name="tableCheck" value="${vo.code }"> 
									<label class="custom-control-label" for="${vo.code }"></label>
								</div>
							</td>
							<th class="inInfo${vo.code}" style="color: #FF1493; cursor:pointer;">${vo.code }</th>
							<th>${vo.material }</th>
							<th>${vo.group_id }</th>
							<th>${vo.name }</th>
							<th>${vo.amount } ${vo.unit }</th>
							<th><fmt:formatDate value="${vo.date }" dateStyle="short" pattern="yyyy-MM-dd"/></th>
							<th>${vo.empName }</th>
							<th style="color: red;">${vo.status }</th>
						</tr>
						</c:forEach>
							
					</table>
				</form>

				<!-------------------------------- 입고 갯수 -------------------------------->
				<!-- <div class="row">
					<div class="col-sm-12 col-md-5">
						<div class="dataTables_info" id="DataTables_Table_0_info" role="status" aria-live="polite"> &nbsp;&nbsp; (전체 수) 중 (검색 결과) 개</div>
					</div>
				</div> -->


				<!--------------------------------- 페이징 ---------------------------------->
				<div class="btn-toolbar justify-content-center mb-15">
					<div class="btn-group">
						<c:if test="${pageVO.prev}">
							<a href="/material/askOrderList?page=${pageVO.startPage - 1}" class="btn btn-outline-primary prev"> <i class="fa fa-angle-double-left"> </i> </a>
						</c:if>
						<c:forEach begin="${pageVO.startPage}" end="${pageVO.endPage}" var="i">
							<a href="/material/askOrderList?page=${i}" class="btn btn-outline-primary ${pageVO.cri.page == i ? 'active' : ''}"> ${i} </a>
						</c:forEach>
						<c:if test="${pageVO.next}">
							<a href="/material/askOrderList?page=${pageVO.endPage + 1}" class="btn btn-outline-primary next"> <i class="fa fa-angle-double-right"> </i> </a>
						</c:if>
					</div>
				</div>


			</div>
		</div>
	</div>

				<!---------------------------------- 푸터 ----------------------------------->
				<div class="footer-wrap pd-20 mb-20 card-box"> ePle MES made by 
					<a href="https://github.com/dropways" target="_blank">아이티윌 부산 2023년 7월 프로젝트 2차 1조</a>
				</div>
				<%@ include file="../include/footer.jsp"%>
				<%@ include file="../include/datatable.jsp"%>
				
				
			</div>
		</div>
	</div>
	<!-- 메인 컨테이너 끝 -->





	<!-- 모달 창 -->
	<div class="modal fade" id="warning-modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm modal-dialog-centered">
			<div class="modal-content bg-warning">
				<div class="modal-body text-center">
					<h3 class="mb-15">
						<i class="fa fa-exclamation-triangle"></i> 주의
					</h3>
					<p><b>선택된 데이터</b>가 없습니다!</p>
					<button type="button" class="btn btn-dark" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 모달 창 -->
	
	

	<!-- 추가, 수정, 삭제, 상세보기 -->
	<script type="text/javascript">
	
	var result ="${result}"
		if(result == "AddDone"){
			$("#success").css("display","block")
		}else if(result =="UpdateDone"){
			alert("글 수정 완료");
		}else if(result == "DeleteDone"){
			alert("글 삭제 완료");
		}
	
	
		var popupWidth, popupHeight, popupX, popupY, link;
		var set;

		function retPopupSetting(width, height){
			// 만들 팝업창 width 크기의 1/2 만큼 보정값으로 빼주기
			popupX = Math.ceil((window.screen.width - width) / 2);
			// 만들 팝업창 height 크기의 1/2 만큼 보정값으로 빼주기
			popupY = Math.ceil((window.screen.height - height) / 2);

			var setting = "";
			setting += "toolbar=0,";
			setting += "scrollbars=0,";
			setting += "statusbar=0,";
			setting += "menubar=0,";
			setting += "resizable=0,";
			setting += "width=" + width + ",";
			setting += "height=" + height + ",";
			setting += "top=" + popupY + ",";
			setting += "left=" + popupX;
			return setting;
		}

		function openPage(i, width, height) {
			set = retPopupSetting(width, height);
			return window.open(i, 'Popup_Window', set);
		}

		$(document).ready(function() {
			// 추가 O
			$("#add").click(function() {
				openPage("/material/askOrderAdd", 400, 700);
			});

		 	// 수정 O
			$("#update").click(function() {
			    var check = $("input:checkbox[name=tableCheck]:checked");
			    if (check.length === 0 || check.length > 1) {
			        alert("수정할 항목을 하나만 선택하세요!");
			    } else {
			        var code = check.val();
			        openPage("/material/askOrderEdit?code=" + code, 400, 700);
			    }
			});

			// 삭제 O
 			$("#delete,#optDelete").click(function() {
				var codes = [];
			    $("input:checkbox[name=tableCheck]:checked").each(function() {
			    	codes.push($(this).val());
			    });
			    
			    if (codes.length > 0) { 
			        openPage("/material/askOrderDel?codes=" + codes.join(','), 700, 600);
			    } else {
			    	alert("선택된 항목이 없습니다!"); 
			    }
			}); 
			
			// 상세보기 O
			$('body').on('click', '[class^="inInfo"]', function(){
        		var code = $(this).text().trim();
      		  openPage("${pageContext.request.contextPath}/material/askOrderInfo?code=" + code, 400, 700); });
			
			
		});
		



		
	</script>
</body>
</html>
