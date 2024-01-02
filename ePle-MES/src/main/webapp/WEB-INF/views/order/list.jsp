<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<%@ page session="false"%>
<html>
<head>
<%@ include file="../include/head.jsp"%>
<title>발주 관리</title>
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
		<a href="${pageContext.request.contextPath}/order/list"><h1>발주 목록</h1></a>
	</div>
		<div class="min-height-200px">
			
<!-- 나중에		<ul class="nav nav-pills">
			<li class="nav-item"><a class="nav-link text-blue active" href="/warehouse/list">보전 목록</a></li>
			<li class="nav-item"><a class="nav-link text-blue" href="/warehouse/resultList">보전 결과</a></li>
		</ul> -->
		
	<br>
				
<!-- 나중에		<div class="alert alert-success alert-dismissible fade show" role="alert">
			<strong>창고 등록</strong>이 완료되었습니다!
			<button type="button" class="close" data-dismiss="alert" aria-label="Close">
				<span aria-hidden="true">×</span>
			</button>
		</div>
		<div class="alert alert-info alert-dismissible fade show" role="alert">
			<strong>창고 수정</strong>이 완료되었습니다!
			<button type="button" class="close" data-dismiss="alert" aria-label="Close">
				<span aria-hidden="true">×</span>
			</button>
		</div>
		<div class="alert alert-warning alert-dismissible fade show" role="alert">
			<strong>창고 삭제</strong>가 완료되지 않았습니다!
			<button type="button" class="close" data-dismiss="alert" aria-label="Close">
				<span aria-hidden="true">×</span>
			</button>
		</div> -->
				
				
	<!------------------------------ 발주 검색 아직 ----------------------------->
	<div class="faq-wrap">
		<div id="accordion">
			<div class="card">
						
				<div class="card-header">
					<button class="btn btn-block collapsed" data-toggle="collapse" data-target="#faq1" aria-expanded="false"><b>발주 검색</b></button>
				</div>
							
				<div id="faq1" class="collapse" data-parent="#accordion" style="">
					<div class="card-body">
								
							<div class="col-md-12">
								<div class="form-group">
									<div class="row">
										<div class="col-md-5 col-sm-12 btn-group" >
											<div class="col-md-5 col-sm-12 btn-group" >
											<input type="text" name="searchCode" id="whCode" class="form-control" placeholder="발주코드" autocomplete="off" >
											<label>관리자</label> 
											<input type="text" name="searchName" id="manager" class="form-control" placeholder="품목코드" autocomplete="off" readonly>
											<input type="text" id="managerName" class="form-control" placeholder="품목이름" autocomplete="off" readonly>
											</div>
										</div>
									</div>
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
				<button type="button" class="btn btn-success" id="add"><b>추가</b></button>
				<button type="button" class="btn btn-warning" id="update"><b>수정</b></button>
				<button type="button" class="btn btn-danger" id="delete"><b>삭제</b></button>
			</div>
		</div>
					
					
					
					<div class="pb-20">
						<div class="col-sm-30">
							<form class="table" id="table">
								<table class="table table-striped">
									<tr>
										<td style="width: 100px;">
										<!--- 창고코드 / 주소지 / 창고유형(원자재.완제품) / 창고명 / 담당자 / 연락처 / 사용여부 --->
											<div class="custom-control custom-checkbox mb-5">
												<input type="checkbox" class="custom-control-input" id="tableCheckAll"> <label class="custom-control-label" for="tableCheckAll"></label>
											</div>
										</td>
										<th>발주번호</th>
										<th>품번</th>
										<th>접수일자</th>
										<th>거래처</th>
										<th>주문량</th>
										<th>입고확인</th>
										<th>납품일자</th>
										<th>등록일</th>
										<th>등록자</th>
										<th>변경일</th>
										<th>변경자</th>
										<th>상태</th>
									</tr>
									
									<c:forEach items="${orderList }" var="vo">
										<tr>
											<!-- 리스트 표, 1페이지에 몇개 조회 가능하게 할 지는 정해도 될 거 같음 -->
											<td>
												<div class="custom-control custom-checkbox mb-5">
													<!-- id에 뒤에 el식으로 테이블 인덱스나, 번호 추가, value에 primary 붙이기  -->
													<input type="checkbox" class="custom-control-input" id="checkTable${vo.code }" name="tableCheck" value="${vo.code }">
													<label class="custom-control-label" for="checkTable${vo.code }"></label>
												</div>
											</td>
											<th>${vo.code }</th>
											<th>${vo.material }</th>
											<th>${vo.date }</th>
											<th>${vo.client_code }</th>
											<th>${vo.amount }</th>
											<th>${vo.complete }</th>
											<th>${vo.order_date }</th>
											<th>${vo.reg_date }</th>
											<th>${vo.reg_emp }</th>
											<th>${vo.update_date }</th>
											<th>${vo.update_emp }</th>
											<th>${vo.status }</th>
											<td style="">
										
										
										
										<!----- 옵션 ----->
											<div class="dropdown">
												<a class="btn btn-link font-24 p-0 line-height-1 no-arrow dropdown-toggle" href="#" role="button" data-toggle="dropdown"> <i class="dw dw-more"></i>
												</a>
<%-- 												<div class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list">
													<!-- 링크 설정 -->
													<!-- 상세 보기 -->
													<a class="dropdown-item" href="#"><i class="dw dw-eye"></i> 상세 보기</a>
													<!-- 수정 -->
													<a class="dropdown-item" href="javascript:openPage('/warehouse/update?index=1', 400, 600)"><i class="dw dw-edit2"></i> 수정</a>
													<!-- 삭제 -->
													<a class="dropdown-item" href="javascript:openPage('/warehouse/delete?index=${vo.wh_code }', 400, 600)"><i class="dw dw-delete-3"></i> 삭제</a>
												</div> --%>
											</div>
										</td>
									</tr>
									</c:forEach>
								</table>
							</form>
							
							
				<!-- 			<div class="row">
								<div class="col-sm-12 col-md-5">
									<div class="dataTables_info" id="DataTables_Table_0_info" role="status" aria-live="polite">
									&nbsp;&nbsp; (전체 수) 중 (검색 결과) 개</div>
								</div>
							</div> -->


							<!----- 페이징 시작 ----->
							<div class="btn-toolbar justify-content-center mb-15">
								<div class="btn-group">
									<c:if test="${pageVO.prev}">
										<a href="/order/list?page=${pageVO.startPage - 1}" class="btn btn-outline-primary prev"> 
											<i class="fa fa-angle-double-left"></i>
										</a>
									</c:if>
									<c:forEach begin="${pageVO.startPage}" end="${pageVO.endPage}" var="i">
										<a href="/order/list?page=${i}" class="btn btn-outline-primary ${pageVO.cri.page == i ? 'active' : ''}">
											${i} </a>
									</c:forEach>
									<c:if test="${pageVO.next}">
										<a href="/order/list?page=${pageVO.endPage + 1}" class="btn btn-outline-primary next"> 
											<i class="fa fa-angle-double-right"></i>
										</a>
									</c:if>
								</div>
							</div>
							<!----- 페이징 끝 ----->



						</div>
					</div>
				</div>
				
				
				<!-- 푸터 -->
				<div class="footer-wrap pd-20 mb-20 card-box">
					ePle MES made by <a href="https://github.com/dropways" target="_blank">아이티윌 부산 2023년 7월 프로젝트 2차 1조</a>
				</div>
				<%@ include file="../include/footer.jsp"%>
				<%@ include file="../include/datatable.jsp"%>
			</div>
		</div>
	</div>




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
			return window.open(i, 'Popup_Window', set); // 가운데거가 이름이 똑같으면 같은창에서 열림
		}

		$(document).ready(function() {
			// 추가
			$("#add").click(function() {
				// 가로, 세로 설정
				openPage("/request/add", 400, 700);
			});

			// 수정
			$("#update").click(function() {
				// 가로, 세로 설정
				openPage("/request/update", 400, 700);
			});

			// 삭제
			$("#delete").click(function() {
				// 가로, 세로 설정
				openPage("/request/delete?", 400, 700);
				// 체크된 데이터열의 코드들을 보내야함!
				
			});
			
			// 삭제
			$(".info${status.index}").click(function() {
        		var code = $(this).text().trim();
				// 가로, 세로 설정
				openPage("/request/info?code"+code, 400, 700);
				// 체크된 데이터열의 코드들을 보내야함!
				
			});
			
			// 상세보기
			$('body').on('click', '[class^="info"]', function(){
        		var code = $(this).text().trim();
      		  openPage("/request/info?code=" + code, 400, 700);
  			});
			
			// 사원검색
			$("#manager,#managerName").click(function() {
				// 가로, 세로 설정
				openPage("/warehouse/searchEmployees", 400,700);
			});
			
		});
		
		

 		//검색하기
/*   		function doSearch() {
		        var query = {"searchCode" : $("#whCode").val(), "searchName" : $("#manager").val()};
		        
		        console.log("searchCode:", query.searchCode);
		        console.log("searchName:", query.searchName);
		        
		        $.ajax({
		            url : "${pageContext.request.contextPath}/warehouse/list",
		            type : "get",
		            data : query,
		            dataType : "text",
		            success : function(data){
		                 if (query.searchCode == "" && query.searchName == "") {
		                    location.href = "${pageContext.request.contextPath}/warehouse/list";
		                } else {
		                    location.href = "${pageContext.request.contextPath}/warehouse/list?searchCode=" + $("#whCode").val() + "&searchName=" + $("#manager").val();
		                } 
		                 
		                if (data) {
		                    alert("완료");
		                } else {
		                    alert("전송된 값 없음");
		                }
		                
		            },
		            
		            error: function() {
		                alert("에러 발생");
		            }

		        });
		    
		}  */
		

  		
/* 		//검색 초기화 버튼 , placeholder 재지정 O
		function resetSearch() {
			$("#manager").val("");
			$("#managerName").val("");
		    $("#manager").attr("placeholder", "관리자코드");
		    $("#managerName").attr("placeholder", "관리자이름");
		} */

		
	</script>
</body>
</html>
