<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>
<html>
<head>
<%@ include file="../include/head.jsp"%>
<%-- <link href="${pageContext.requeset.contextPath }/resources/css/default.css" rel="stylesheet" type"text/css"> --%>
<title>출하 관리</title>
</head>
<body>
	<!-- 공통, css 및 js 추가 시 /include/header, footer에서 삽입 -->
	<%@ include file="../include/header.jsp"%>
	<%@ include file="../include/right-side-bar.jsp"%>
	<%@ include file="../include/left-side-bar.jsp"%>
	<!-- 비로그인 거름망 -->
	 <c:if test="${empty sessionScope.id}" > 
	 	<c:redirect url="/login"/> 
	 </c:if> 
	<!-- 메인 컨테이너 -->
	<div class="main-container">
		<div class="pd-ltr-20 xs-pd-20-10">
			<div class="title" style="margin-bottom: 10px;">
				<h1><a href="/shipment/list" style="color:#202342;">출하 관리</a></h1>
			</div>
		<div class="min-height-200px">
				<br>
			<!-- 아코디언 시작 -->
			<div class="faq-wrap">
				<div id="accordion">
					<div class="card">
						<div class="card-header">
							<button class="btn btn-block collapsed" data-toggle="collapse"
								data-target="#faq1" aria-expanded="false">
								<b>검색</b>
							</button>
						</div>
						<div id="faq1" class="collapse" data-parent="#accordion" style="">
							<div class="card-body">
								<form id="accordion-search" method="get" action="/shipment/list">
									<div class="col-md-12">
										<div class="form-group">
										
										
											<div class="row">
												<h4 class="text-blue h4">출하 검색</h4>
											</div>
											<div class="row">
												<div class="col-md-1 col-sm-12" >
												</div>
												<div class="col-md-5 col-sm-12 btn-group ml-auto" style="margin-left: auto;">
													<label class="col-md-2" style="padding: 10px 0px 10px 0px; "><b>업체명</b></label> 
													<input type="hidden" id="client_code" > 
													<input type="text" name="clientName" class="form-control" 
													id="searchCompany" style="width: 50%;" 
													autocomplete="off" readonly value="${paramMap.clientName }">
												</div>
												<div class="col-md-6 col-sm-12 btn-group ml-auto" style="margin-left: auto;">
													<label class="col-md-2" style="padding: 10px 0px 10px 0px; "><b>품명</b></label> 
													<input type="hidden" name="product" id="product" value="${paramMap.product }"> 
														<input type="text" name="reqsdate" 
														class="form-control" id="searchProduct"
														style="width: 50%;" 
														autocomplete="off" readonly value="${paramMap.reqsdate }">
												</div>
											</div>
											<br>
											<div class="row">
												<div class="col-md-1 col-sm-12" >
												</div>
												<label class="col-md-1 col-sm-12"><b>출하 상태</b></label>
												<div class="col-md-1 col-sm-12" >
													<div class="custom-control custom-checkbox mb-3">
														<input type="checkbox" class="custom-control-input"
															id="formCheck1" name="statusList" value="출하대기"
															<c:if test="${paramMap.statusList.contains('출하대기')}">checked</c:if>> 
														<label class="custom-control-label" for="formCheck1">출하대기</label>
													</div>
												</div>
												<div class="col-md-3 col-sm-12" >
													<div class="custom-control custom-checkbox mb-5">
														<input type="checkbox" class="custom-control-input"
															id="formCheck2" name="statusList" value="출하완료"
															<c:if test="${paramMap.statusList.contains('출하완료')}">checked</c:if>> <label
															class="custom-control-label" for="formCheck2">출하완료</label>
													</div>
												</div>
												<label class="col-md-1 col-sm-12"><b>출하 일자</b></label>
												<div class="col-md-4 col-sm-12">
													<div class="form-group md-4" style="margin-top : auto;">
															<span style="display : flex; justify-content:space-between;">
															<input class="form-control date-picker" 
															type="text" name="startDate" autocomplete="off" id="startDate"
															style="width:50%;" readonly value = "${paramMap.startDate }">
															<span style="padding:0px 10px; padding-top:10px; text-align : center;"> ~ </span>
															<input class="form-control date-picker"
															type="text" name="endDate" autocomplete="off" id="endDate" style="width:50%;"
															readonly value = "${paramMap.endDate }">
															</span>
													</div>
												</div>
												</div>
											
											
										</div>
									</div>
									
										<!-- 정렬, asc, desc -->
										<input type="hidden" name="activeSortCategory" id="sortCategory" value="${pageVO.search.activeSortCategory}"> 
										<input type="hidden" name="sortValue" id="sortValue" value="${pageVO.search.sortValue}">

										<c:choose>
											<c:when test="${!empty pageVO.cri.page}">
												<input type="hidden" id="page" name="page" value="1">
											</c:when>
											<c:when test="${!empty pageVO.cri.page}">
												<input type="hidden" id="page" name="page" value="${pageVO.cri.page}">
											</c:when>
										</c:choose>

										<c:choose>
											<c:when test="${empty pageVO.cri.pageSize}">
												<input type="hidden" id="pageSize" name="pageSize" value="10">
											</c:when>
											<c:when test="${!empty pageVO.cri.pageSize}">
												<input type="hidden" id="pageSize" name="pageSize" value="${pageVO.cri.pageSize}">
											</c:when>
										</c:choose>
									
									<div class="btn-group pull-right" style="margin-bottom: 10px">
										<button type="submit" class="btn btn-primary" id="search">
											<b>검색</b>
										</button>
										<button type="button" class="btn btn-secondary" id="reset">
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
				<c:if test="${sessionScope.pos_id.equals('005') or sessionScope.dep_group.equals('영업')}">
					<div class="btn-group pull-right" style="margin-bottom: 10px">
						<button type="button" class="btn btn-success" id="add">
							<b>추가</b>
						</button>
						<button type="button" class="btn btn-danger" id="delete">
							<b>삭제</b>
						</button>
					</div>
					<div class="btn-group pull-right" style="margin-bottom: 10px">
						<button type="button" class="btn btn-info" id="statusChange">
							<b>출하완료</b>
						</button>
					</div>
				</c:if>
				</div>
				<div class="pb-20">
					<div class="col-sm-30">
						<form class="table" id="table">
							<table class="table table-striped" style="text-align : center">
								<thead>
									<tr>
										<td style="width: 100px;">
											<div class="custom-control custom-checkbox mb-5">
												<input type="checkbox" class="custom-control-input" id="tableCheckAll"> 
												<label class="custom-control-label" for="tableCheckAll"></label>
											</div>
										</td>
										<th>출하번호</th>
										<th>수주번호</th>
										<th>수주업체</th>
										<th>납품예정일</th>
										<th>품번</th>
										<th>수주수량</th>
										<th>출하량</th>
										<th>출하일자</th>
										<th>출하상태</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${List}" var="List" varStatus="status">
										<tr>
											<!-- 리스트 표, 1페이지에 몇개 조회 가능하게 할 지는 정해도 될 거 같음 -->
											<c:choose>
												<c:when test="${List.status eq '출하대기'}">
													<td>
													<div class="custom-control custom-checkbox mb-5">
															<!-- id에 뒤에 el식으로 테이블 인덱스나, 번호 추가, value에 primary 붙이기  -->
															<input type="checkbox" class="custom-control-input"
																id="checkTable${status.index}" name="tableCheck"
																value="${List.code }" >
															<input type="checkbox" class="hidden-checkbox" id="hiddenCheckTable${status.index}" 
															data-reqs-code="${List.reqs_code }" style="display: none;" >
															<label class="custom-control-label" for="checkTable${status.index}" ></label>
													</div>
														</td>
												</c:when>
												<c:otherwise>
													<td>
													<div class="custom-control custom-checkbox mb-5">
															<!-- id에 뒤에 el식으로 테이블 인덱스나, 번호 추가, value에 primary 붙이기  -->
															<input type="text" class="custom-control-input"
																id="checkTable${status.index}" name="tableCheck"
																value="${List.code }" style="visibility: hidden;" disabled="disabled">
															<input type="text" class="hidden-checkbox" id="hiddenCheckTable${status.index}" 
															data-reqs-code="${List.reqs_code }" style="display: none;" disabled="disabled">
															<label style="visibility: hidden;" class="custom-control-label" for="checkTable${status.index}" ></label>
													</div>
													
													</td>
												</c:otherwise>
											</c:choose>
											<!-- 상세 정보 이동! -->
											<th class="info${status.index}"
												style="color: blue; text-decoration: underline;">${List.code }</th>
											<th>${List.reqs_code }</th>
											<th>${List.clientName }</th>
											<th>${List.reqsdate }</th>
											<th>${List.product }</th>
											<th>${List.reqsamount }</th>
											<th>${List.amount }</th>
											<th>${List.date }</th>
											<th>${List.status }</th>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</form>
						<div class="row">
							<div class="col-sm-12 col-md-5">
							</div>
							<div class="col-sm-5 col-md-7 text-right">
							<div>
								<button type="button" class="btn btn-success btn-sm" id="print">
									<b>거래명세서</b>
								</button>
							</div>
							</div>
						</div>
						<div class="btn-toolbar justify-content-center mb-15">
							<c:if test="${pageVO.totalCount > 1}">
									<div class="btn-group">
										<c:if test="${pageVO.prev}">
											<a href="javascript:pageMove(${pageVO.startPage - 1})" class="btn btn-outline-primary prev"> 
											<i class="fa fa-angle-double-left"></i>
											</a>
										</c:if>
										<c:forEach begin="${pageVO.startPage}" end="${pageVO.endPage}" var="i">
											<c:if test="${pageVO.cri.page == i}">
												<span class="btn btn-primary current">${i}</span>
											</c:if>
											<c:if test="${pageVO.cri.page != i}">
												<a href="javascript:pageMove(${i})" class="btn btn-outline-primary">${i}</a>
											</c:if>
										</c:forEach>
										<c:if test="${pageVO.next}">
											<a href="javascript:pageMove(${pageVO.endPage + 1})" class="btn btn-outline-primary next"> 
											<i class="fa fa-angle-double-right"></i>
											</a>
										</c:if>
									</div>
								</c:if>
							</div>
					</div>
				</div>
			</div>
			</div>
			<!-- Checkbox select Datatable End -->
			
			<!-- 푸터 -->
			<div class="footer-wrap pd-20 mb-20 card-box">
				ePle MES made by <a href="https://github.com/dropways"
					target="_blank">아이티윌 부산 2023년 7월 프로젝트 2차 1조</a>
			</div>
			<%@ include file="../include/footer.jsp"%>
			<%@ include file="../include/datatable.jsp"%>
		</div>
	</div>

<!-- 초기화 -->
<script type="text/javascript">
$('#reset').click(function(){
	  $('input[type="text"]').val('');
	  $('input[type="checkbox"]').prop("checked",false);
	  document.getElementById('accordion-search').submit();
	});
</script>

	<script type="text/javascript">
	$('input[name="tableCheck"]').change(function() {
    var index = this.id.replace('checkTable', '');
    var hiddenCheckbox = document.getElementById('hiddenCheckTable' + index);
    
    if(this.checked) {
        hiddenCheckbox.checked = true;
  	  } else {
        hiddenCheckbox.checked = false;
  	  }
		});
	</script>
	<!-- 추가, 수정, 삭제, 상세보기 -->
	<script type="text/javascript">
		var popupWidth, popupHeight, popupX, popupY, link;
		var set;

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

		function openPage(i, width, height) {
			set = retPopupSetting(width, height);
			return window.open(i, 'Popup_Window', set); // 가운데거가 이름이 똑같으면 같은창에서 열림
		}

		

		$(document).ready(function() {
			
			
			$("#tableCheckAll").click(function() {
			    if ($("#tableCheckAll").is(":checked")) {
			        $("input.hidden-checkbox").prop("checked", true);
					$(":checkbox:not(:disabled)").prop("checked", true);
			    } else {
			    	 $("input.hidden-checkbox").prop("checked", false);
			    }
			});
			
					// 추가
					$("#add").click(function() {
						openPage("/shipment/add", 400, 700);
					});

					// 수정
					$("#update").click(function() {
						openPage("/shipment/update", 400, 700);
					});

					// 삭제
					$("#delete").click(function() {
								var deleteList = [];
								$("input:checkbox[name=tableCheck]:checked").each(function() {
											deleteList.push($(this).val());
										});
								if (deleteList.length > 0) {
									openPage("/shipment/delete?code="+ deleteList.join(','), 600, 500);
								} else {
									alert('관리자에게 문의하세요');
								}
							});
					
					// 삭제
					$("#statusChange").click(function() {
								var stautsList = [];
								$("input:checkbox[name=tableCheck]:checked").each(function() {
											stautsList.push($(this).val());
										});
								if (stautsList.length > 0) {
									openPage("/shipment/statusChange?code="+ stautsList.join(','), 400, 700);
								} else {
									alert('관리자에게 문의하세요');
								}
							});
					
					$("#print").click(function() {
					    var stautsList = [];
					    var checkboxes = document.querySelectorAll('input[name="tableCheck"]:checked');
					    var hiddenCheckboxes = document.querySelectorAll('input.hidden-checkbox:checked');
					    var selectedReqsCode = null; 
					    
					    for(var i = 0; i < checkboxes.length; i++) {
					        var currentReqsCode = hiddenCheckboxes[i].dataset.reqsCode.substring(0, 11);

					        if(!selectedReqsCode) {
					            selectedReqsCode = currentReqsCode;
					        }
					        else {
					            if(selectedReqsCode !== currentReqsCode) {
					                alert('동일한 수주만 선택해주세요.');
					                return; // 함수 종료
					            }
					        }

					        stautsList.push(checkboxes[i].value);
					    }

					    if (stautsList.length > 0) {
					        openPage("/shipment/print?code="+ stautsList.join(','), 1000, 700);
					    } 
					    else {
					        alert('관리자에게 문의하세요');
					    }
					});

						
					// 상세보기
					$('body').on('click', '[class^="info"]', function() {
						var code = $(this).text().trim();
						openPage("/shipment/info?code=" + code, 400, 700);
					});

					// 각각의 검색창
					// 업체검색
					$("#searchCompany").click(function() {
						openPage("/request/searchClient", 400, 700);
					});

					// 제품검색
					$("#searchProduct").click(function() {
						openPage("/request/searchProduct", 400, 700);
					});

					

				});
	</script>
	<!-- 검색은 ajax -->

	
</body>
</html>
