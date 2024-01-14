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
  .back {
  background-color: white !important;
}
#whCode{
margin-left:100px;
margin-right:50px;
}
#selectF{
margin-left:20px;
margin-right:20px;
}
</style>
<title>입고 관리</title>
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
		<a href="${pageContext.request.contextPath}/material/inList"><h1>입고 관리</h1></a>
	</div>
		<div class="min-height-200px">
			
	    <ul class="nav nav-pills">
			<li class="nav-item"><a class="nav-link text-blue active" href="/material/inList">입고 현황</a></li>
			<li class="nav-item"><a class="nav-link text-blue" href="/material/outList">출고 현황</a></li>
		</ul> 
		
	<br>
				
				
	<!------------------------------ 입고 검색 시작 ----------------------------->
	<div class="faq-wrap">
		<div id="accordion">
			<div class="card">
						
				<div class="card-header">
					<button class="btn btn-block collapsed" data-toggle="collapse" data-target="#faq1" aria-expanded="false"><b>입고 검색</b></button>
				</div>
							
				<div id="faq1" class="collapse" data-parent="#accordion" style="">
					<div class="card-body">
								
								<div class="form-inline">
											<div class="col-md-12 col-sm-12 btn-group" >
											<input type="text" name="searchCode" id="whCode" class="form-control back" placeholder="입고코드" autocomplete="off" >
											<label>품목</label> 
											<input type="text" name="searchName" id="selectF" class="form-control back" placeholder="품목코드" autocomplete="off" readonly>
											<input type="text" id="selectG" class="form-control back" placeholder="품명" autocomplete="off" readonly>
											</div>
								</div>
							
							<div class="btn-group pull-right" style="margin-bottom: 10px">
								<button type="submit" class="btn btn-primary" id="search" onclick="doSearch()"> <b>검색</b> </button>
								<button type="reset"  class="btn btn-secondary" id="reset" onclick="resetSearch()"> <b>초기화</b> </button>
							</div>
									
					</div>
				</div>
							
			</div>
		</div>
	</div>
				
				
	<!------------------------- 추가 / 수정 / 삭제 버튼 ------------------------->
	<div class="card-box mb-30">
		<div class="pd-20">
			<div class="btn-group pull-right" style="margin-bottom: 10px">
				<button type="button" class="btn btn-success" id="add"><b>입고등록</b></button>
				<button type="button" class="btn btn-warning" id="update"><b>수정</b></button>
			</div>
		</div>



	<!----------------------------- 입고 리스트 출력 ---------------------------->
		<div class="pb-20">
			<div class="col-sm-30">
				<form class="table" id="table">
					<table class="table table-striped">
					<!-- 체크박스 / 입고코드 / 발주수주코드 / 창고코드 / 구분 / 품명 / 수량+단위 / 담당자 / 입고일자 / 입고상태 -->
						<tr>
							<td style="width: 100px;">
								<div class="custom-control custom-checkbox mb-5">
									<input type="checkbox" class="custom-control-input" id="tableCheckAll"> 
									<label class="custom-control-label" for="tableCheckAll"></label>
								</div>
							</td>
							<th>입고코드</th>
							<th>발주/수주코드</th>
							<th>품명</th>
							<th style="text-align:left;">수량</th>
							<th>창고</th>
							<th>구분</th>
							<th>입고일자</th>
							<th>담당자</th>
						</tr>

						<c:forEach items="${inList }" var="vo">
						<tr>
							<td>
								<div class="custom-control custom-checkbox mb-5">
									<input type="checkbox" class="custom-control-input checkCode" id="${vo.code }" name="tableCheck" value="${vo.code }"> 
									<label class="custom-control-label" for="${vo.code }"></label>
								</div>
							</td>
							<th class="inInfo${vo.code}" style="color: #FF1493; cursor:pointer;">${vo.code }</th>
							<th>${vo.order_num }</th>
							<th>${vo.mapdName }</th>
							<th style="color: blue; text-align:left">+ ${vo.amount }</th>
							<th>${vo.warehouse_code }</th>
							<th>${vo.category }</th>
							<th><fmt:formatDate value="${vo.date }" dateStyle="short" pattern="yyyy-MM-dd"/></th>
							<th>${vo.empName }</th>


						</tr>
						</c:forEach>
							
					</table>
				</form>

				<!-------------------------------- 입고 갯수 -------------------------------->
		<!-- 		<div class="row">
					<div class="col-sm-12 col-md-5">
						<div class="dataTables_info" id="DataTables_Table_0_info" role="status" aria-live="polite"> &nbsp;&nbsp; (전체 수) 중 (검색 결과) 개</div>
					</div>
				</div> -->


				<!--------------------------------- 페이징 ---------------------------------->
				<div class="btn-toolbar justify-content-center mb-15">
					<div class="btn-group">
						<c:if test="${pageVO.prev}">
							<a href="/material/inList?page=${pageVO.startPage - 1}" class="btn btn-outline-primary prev"> <i class="fa fa-angle-double-left"> </i> </a>
						</c:if>
						<c:forEach begin="${pageVO.startPage}" end="${pageVO.endPage}" var="i">
							<a href="/material/inList?page=${i}" class="btn btn-outline-primary ${pageVO.cri.page == i ? 'active' : ''}"> ${i} </a>
						</c:forEach>
						<c:if test="${pageVO.next}">
							<a href="/material/inList?page=${pageVO.endPage + 1}" class="btn btn-outline-primary next"> <i class="fa fa-angle-double-right"> </i> </a>
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
			setting += "resizeable=0,";
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
				openPage("/material/inAdd", 400, 700);
			});

		 	// 수정 O
			$("#update").click(function() {
			    var check = $("input:checkbox[name=tableCheck]:checked");
			    if (check.length === 0 || check.length > 1) {
			        alert("수정할 항목을 하나만 선택하세요!");
			    } else {
			        var code = check.val();
			        openPage("/material/inEdit?code=" + code, 400, 700);
			    }
			});


		 	// 출고등록 O
			$("#delete").click(function() {
			    var check = $("input:checkbox[name=tableCheck]:checked");
			    if (check.length === 0 || check.length > 1) {
			        alert("출고할 항목을 하나만 선택하세요!");
			    } else {
			        var code = check.val();
			        openPage("/material/outAdd?code=" + code, 400, 700);
			    }
			});
		 	
		 	
		 	
		 	
		 	
		 	// 상세보기 O
			$('body').on('click', '[class^="inInfo"]', function(){
        		var code = $(this).text().trim();
      		  openPage("${pageContext.request.contextPath}/material/inInfo?code=" + code, 400, 700); });
			
			
			// 검색 - 사원 리스트 
			$("#selectF,#selectG").click(function() {
				// 가로, 세로 설정
				openPage("/material/searchMAPD", 400,700);
			});

			
			
		});
		


 		// 검색하기
  		function doSearch() {
		        var query = {"searchCode" : $("#whCode").val(), "searchName" : $("#selectF").val()};
		        
		        console.log("searchCode:", query.searchCode);
		        console.log("searchName:", query.searchName);
		        
		        $.ajax({
		            url : "${pageContext.request.contextPath}/material/inList",
		            type : "get",
		            data : query,
		            dataType : "text",
		            success : function(data){
		                 if (query.searchCode == "" && query.searchName == "") {
		                    location.href = "${pageContext.request.contextPath}/material/inList";
		                } else {
		                    location.href = "${pageContext.request.contextPath}/material/inList?searchCode=" + $("#whCode").val() + "&searchName=" + $("#selectF").val();
		                } 
		                 
		          /*       if (data) {
		                    alert("완료");
		                } else {
		                    alert("전송된 값 없음");
		                } */
		                
		            },
		            
		            error: function() {
		                alert("에러 발생");
		            }

		        });
		} 
		

		// 검색 초기화 , placeholder 재지정 
		function resetSearch() {
			$("#whCode").val("");
			$("#selectF").val("");
			$("#selectG").val("");
		    $("#whCode").attr("placeholder", "입고코드");
		    $("#selectF").attr("placeholder", "품목코드");
		    $("#selectG").attr("placeholder", "품명");
		}

		
	</script>
</body>
</html>
