<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<%@ include file="../include/head.jsp"%>
<%-- <link href="${pageContext.requeset.contextPath }/resources/css/default.css" rel="stylesheet" type"text/css"> --%>
<title>반품 관리</title>
</head>
<body>
	<!-- 공통, css 및 js 추가 시 /include/header, footer에서 삽입 -->
	<%@ include file="../include/header.jsp"%>
	<%@ include file="../include/right-side-bar.jsp"%>
	<%@ include file="../include/left-side-bar.jsp"%>
	<!-- 비로그인 거름망 -->
<%-- <c:if test="${empty id}" > --%>
<%-- 	<c:redirect url="/main/login"/> --%>
<%-- </c:if> --%>
	<!-- 메인 컨테이너 -->
	<div class="main-container">
		<div class="pd-ltr-20 xs-pd-20-10">
			<div class="title" style="margin-bottom: 10px;">
				<h1>반품 관리</h1>
			</div>
			<div class="min-height-200px">
<!-- 				<ul class="nav nav-pills"> -->
<!-- 					<li class="nav-item"><a class="nav-link text-blue active" href="/maintenance/list">수주 목록</a></li> -->
<!-- 					<li class="nav-item"><a class="nav-link text-blue" href="/maintenance/resultList">수주 결과</a></li> -->
<!-- 				</ul> -->
				<br>
				<div class="alert alert-success alert-dismissible fade show" role="alert" style="display:none">
					<strong>반품 등록</strong>이 완료되었습니다!
					<button type="button" class="close" data-dismiss="alert" aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="alert alert-info alert-dismissible fade show" role="alert" style="display:none">
					<strong>반품 수정</strong>이 완료되었습니다!
					<button type="button" class="close" data-dismiss="alert" aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="alert alert-warning alert-dismissible fade show" role="alert" style="display:none">
					<strong>반품 삭제</strong>가 완료되지 않았습니다!
					<button type="button" class="close" data-dismiss="alert" aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<!-- 아코디언 시작 -->
				<div class="faq-wrap">
					<div id="accordion">
						<div class="card">
							<div class="card-header">
								<button class="btn btn-block collapsed" data-toggle="collapse" data-target="#faq1" aria-expanded="false">
									<b>검색</b>
								</button>
							</div>
							<div id="faq1" class="collapse" data-parent="#accordion" style="">
								<div class="card-body">
									<form id="accordion-search" method="GET" action="/request/search">
										<div class="col-md-12">
											<div class="form-group">
												<div class="row">
													<h4 class="text-blue h4">기본 검색</h4>
													<div class="col-md-5 col-sm-12 btn-group" style="margin-left: auto;">
														<label>업체명</label> 
														<input type="hidden" id="searchCompany" name="searchCategory"> 
														<input type="text" name="client_code" class="form-control" style="width: 100%;" placeholder="검색어 입력">
													</div>
													<div class="col-md-5 col-sm-12 btn-group" style="margin-left: auto;">
														<label>품명</label> 
														<input type="hidden" id="searchProduct" name="searchCategory"> 
														<input type="text" name="product" class="form-control" style="width: 100%;" placeholder="검색어 입력">
													</div>
												</div>
												<div class="row">
													<div class="col-md-1 col-sm-12">
														<label class="weight-600">반품 상태</label>
													<div class="col-md-1 col-sm-12" style="margin-top: auto;">
														<div class="custom-control custom-checkbox mb-5">
															<input type="checkbox" class="custom-control-input" id="formCheck1" name="statusInput"> 
															<label class="custom-control-label" for="formCheck1">반품</label>
														</div>
														<div class="custom-control custom-checkbox mb-5">
															<input type="checkbox" class="custom-control-input" id="formCheck2" name="statusProduction"> 
															<label class="custom-control-label" for="formCheck2">폐기</label>
														</div>
													</div>					
													</div>
													<div class="col-md-2 col-sm-12">
														<div class="form-group">
															<label>반품일자</label> 
															<input class="form-control datetimepicker-range" placeholder="Select Month" type="text" name="date">
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="btn-group pull-right" style="margin-bottom: 10px">
											<button type="submit" class="btn btn-primary" id="search">
												<b>검색</b>
											</button>
											<button type="reset" class="btn btn-secondary" id="reset">
												<b>초기화</b>
											</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 아코디언 끝 -->
				
				<!-- Checkbox select Datatable start -->
				<div class="card-box mb-30">
					<div class="pd-20">
						<div class="btn-group pull-right" style="margin-bottom: 10px">
							<button type="button" class="btn btn-success" id="add">
								<b>추가</b>
							</button>
							<button type="button" class="btn btn-danger" id="doneDestroy">
								<b>폐기완료</b>
							</button>
						</div>
					</div>
					<div class="pb-20">
						<div class="col-sm-30">
							<form class="table" id="table">
								<table class="table table-striped">
									<tr>
										<td style="width: 100px;">
											<div class="custom-control custom-checkbox mb-5">
												<input type="checkbox" class="custom-control-input" id="tableCheckAll"> <label class="custom-control-label" for="tableCheckAll"></label>
											</div>
										</td>
										<th>수주번호</th>
										<th>수주업체</th>
										<th>출하번호</th>
										<th>품목</th>
										<th>반품수량</th>
										<th>반품사유</th>
										<th>반품상태</th>
									</tr>
								<c:forEach items="${List}" var="List" varStatus="status">
									<tr>
										<!-- 리스트 표, 1페이지에 몇개 조회 가능하게 할 지는 정해도 될 거 같음 -->
										<td><div class="custom-control custom-checkbox mb-5">
												<!-- id에 뒤에 el식으로 테이블 인덱스나, 번호 추가, value에 primary 붙이기  -->
												<input type="checkbox" class="custom-control-input" id="checkTable${status.index}" name="tableCheck" value="1"> <label class="custom-control-label" for="checkTable${status.index}"></label>
											</div></td>
										<!-- 상세 정보 이동! -->
										<th class="info${status.index}" style="color: blue; text-decoration: underline;">${List.code }</th> 
										<th>${List.request_code }</th> 
										<th>${List.clientName }</th> 
										<th>${List.ship_code }</th> 
										<th>${List.lot }</th> 
 										<th>${List.amount }</th> 
										<th>${List.reason }</th> 
										<th>${List.status }</th> 
										<td style="">
										<!-- 옵션 -->
											<div class="dropdown">
												<a class="btn btn-link font-24 p-0 line-height-1 no-arrow dropdown-toggle" href="#" role="button" data-toggle="dropdown"> <i class="dw dw-more"></i>
												</a>
												<div class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list">
													<!-- 링크 설정 -->
													<!-- 상세 보기 -->
													<a class="dropdown-item" href="#"><i class="dw dw-eye"></i> 상세 보기</a>
													<!-- 수정 -->
													<a class="dropdown-item" href="javascript:openPage('/maintenance/update?index=1', 400, 600)"><i class="dw dw-edit2"></i> 수정</a>
													<!-- 삭제 -->
													<a class="dropdown-item" href="javascript:openPage('/maintenance/delete?index=1', 400, 600)"><i class="dw dw-delete-3"></i> 삭제</a>
												</div>
											</div>
										</td>
									</tr>
								</c:forEach>
								</table>
							</form>
							<div class="row">
								<div class="col-sm-12 col-md-5">
									<div class="dataTables_info" id="DataTables_Table_0_info" role="status" aria-live="polite">&nbsp;&nbsp;(전체 수) 중 (검색 결과) 개</div>
								</div>
							</div>
							<div class="btn-toolbar justify-content-center mb-15">
								<div class="btn-group">
									<a href="#" class="btn btn-outline-primary prev"><i class="fa fa-angle-double-left"></i></a> 
									<a href="#" class="btn btn-outline-primary">1</a> 
									<a href="#" class="btn btn-outline-primary">2</a> 
									<span class="btn btn-outline-primary">3</span> 
									<a href="#" class="btn btn-outline-primary">4</a> 
									<a href="#" class="btn btn-outline-primary">5</a> 
									<a href="#" class="btn btn-outline-primary next"><i class="fa fa-angle-double-right"></i></a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Checkbox select Datatable End -->
				<!-- 푸터 -->
				<div class="footer-wrap pd-20 mb-20 card-box">
					ePle MES made by <a href="https://github.com/dropways" target="_blank">아이티윌 부산 2023년 7월 프로젝트 2차 1조</a>
				</div>
				<%@ include file="../include/footer.jsp"%>
				<%@ include file="../include/datatable.jsp"%>
			</div>
		</div>
	</div>

	<!-- 추가, 수정, 삭제, 상세보기 -->
	<script type="text/javascript">
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
			// 추가
			$("#add").click(function() {
				// 가로, 세로 설정
				openPage("/request/add", 500, 600);
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
			
			// 상세보기
			$('body').on('click', '[class^="info"]', function(){
        		var code = $(this).text().trim();
      		  openPage("/request/info?code=" + code, 400, 700);
  			});
			
			// 각각의 검색창
			// 업체검색
			$("#searchCompany").click(function() {
				// 가로, 세로 설정
				openPage("/request/info", 400,700);
			});
			
			// 제품검색
			$("#searchProduct").click(function() {
				// 가로, 세로 설정
				openPage("/request/info", 400,700);
			});
			
			// 사원검색
			$("#searchManager").click(function() {
				// 가로, 세로 설정
				openPage("/request/info", 400,700);
			});
			
			// 검색은 ajax
			$(".search").click(function() {
				// 가로, 세로 설정
				$.ajax({
					
				});
				
			});
			
			// 팝업창 닫을 때 list 새고 하기
// 			function closePopUp() {
// 				  // 팝업창을 닫습니다.
// 				  window.parent.window.close();

// 				  // 팝업창이 닫힌 후 list.jsp를 새로고침합니다.
// 				  $.ajax({
// 				    url: "/request/list",
// 				    type: "get",
// 				    success: function() {
// 				      // 새로고침이 완료된 후 화면이 깜빡이지 않도록 합니다.
// 				      window.location.reload();
// 				      alert('시작');
// 				    },
// 				    error: function() {
// 				      // 새로고침에 실패한 경우 처리합니다.
// 					      alert('error');

// 				    }
// 				  });
// 				}
			
			//등록 시 알럿
// 			var result = ${result}
// 			if(result == "AddDone"){
// 				$(".alert-success").css("display","inline")
// 			}
			
			
		});
	</script>
</body>
</html>
