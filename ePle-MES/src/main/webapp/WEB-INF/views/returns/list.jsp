<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>
<html>
<head>
<%@ include file="../include/head.jsp"%>
<%-- <link href="${pageContext.requeset.contextPath }/resources/css/default.css" rel="stylesheet" type"text/css"> --%>
<title>반품 관리</title>
</head>
<body>
	<!-- 공통, css 및 js 추가 시 /include/header, footer에서 삽입 -->
	<%@ include file="../include/header.jsp"%>
	<%@ include file="../include/left-side-bar.jsp"%>
	<!-- 비로그인 거름망 -->
	 <c:if test="${empty sessionScope.id}" > 
	 	<c:redirect url="/login"/> 
	 </c:if> 
	<!-- 메인 컨테이너 -->
	<div class="main-container">
		<div class="pd-ltr-20 xs-pd-20-10">
			<div class="row">
            <div class="col-md-12">
               <h1 class="title">반품 관리</h1>
            </div>
            <div class="col-md-12">
               <nav aria-label="breadcrumb" role="navigation">
                  <ol class="breadcrumb">
                     <li class="breadcrumb-item">영업 관리</li>
                     <li class="breadcrumb-item active" aria-current="page"><b>반품 관리</b></li>
                  </ol>
               </nav>
            </div>
         </div>

			<!-- 아코디언 시작 -->
			<div class="faq-wrap">
				<div id="accordion">
					<div class="card">
						<div class="card-header">
							<button class="btn btn-block collapsed" data-toggle="collapse"
								data-target="#faq1" aria-expanded="false">
								<b>반품 검색</b>
							</button>
						</div>
						<div id="faq1" class="collapse" data-parent="#accordion" style="">
							<div class="card-body">
								<form id="accordion-search" method="get"
									action="/returns/list">
									<div class="col-md-12">
										<div class="form-group">
										
										<div class="row">
											<div class="col-md-2 col-sm-12 btn-group" style="margin-left: 20px; padding-top : 15px;">
												<label class="col-md-4" style="padding: 10px 0px 10px 0px; "><b>업체명</b></label> 
												<input type="hidden" name="client_code" id="client_code"> 
												<input type="text"
												name="clientName" class="form-control" id="searchCompany"
												style="width: 100%;" 
												autocomplete="off" readonly value="${paramMap.clientName }">
											</div>
											<div class="col-md-2 col-sm-12 btn-group" style="margin-left: 20px; padding : 15px;">
												<label class="col-md-3" style="padding: 10px 0px 10px 0px; "><b>품명</b></label> 
												<input type="hidden" name="product" id="product">
												<input type="text" name="productName" class="form-control" 
												id="searchProduct" style="width: 100%;"
												autocomplete="off" readonly value="${paramMap.productName}">
											</div>
											<div class="col-md-4 col-sm-12 btn-group">
												<div class="col-md-12 col-sm-12" style="display: flex; align-items: center;">
												<label class="col-md-3"><b>반품 일자</b></label>
												<span style="display: flex; justify-content: space-between; width: 100%; margin-left: 10px;">
													<input class="form-control date-picker" readonly
														type="text" name="startDate" autocomplete="off" id="startDate"
														value="${paramMap.startDate }"> 
													<span style="padding:0px 10px; padding-top:10px; text-align : center;"> ~ </span>
													<input class="form-control date-picker"
														type="text" name="endDate" autocomplete="off"
														id="endDate" value="${paramMap.endDate }" readonly>
												</span>
												</div>
											</div>
										<div class="col-md-3 col-sm-12 btn-group" style="margin-left: 20px; padding-left: 10px; display: flex; flex-direction: row; align-items: center;">
										    <label style="margin-right: 20px;"><b>반품 상태</b></label>
										    <div style="display: flex;">
										        <div style="padding-top: 7px;" class="custom-control custom-checkbox mb-3 col-sm-12 col-md-7">
										            <input type="checkbox" class="custom-control-input"
										                id="formCheck1" name="statusList" value="반품등록"
										                <c:if test="${paramMap.statusList.contains('반품등록')}">checked</c:if>>
										            <label class="custom-control-label" for="formCheck1">반품등록</label>
										        </div>
										        <div style="padding-top: 7px;" class="custom-control custom-checkbox mb-3 col-sm-12 col-md-6">
										            <input type="checkbox" class="custom-control-input"
										                id="formCheck2" name="statusList" value="폐기"
										                <c:if test="${paramMap.statusList.contains('폐기')}">checked</c:if>>
										            <label class="custom-control-label" for="formCheck2">폐기</label>
										        </div>
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
						<button type="button" class="btn btn-warning" id="update">
							<b>수정</b>
						</button>
						<button type="button" class="btn btn-danger" id="delete">
							<b>삭제</b>
						</button>
					</div>
					<div class="btn-group pull-right" style="margin-bottom: 10px; margin-right: 10px;">
						<button type="button" class="btn btn-danger" id="dispose">
							<b>폐기완료</b>
						</button>
					</div>
				</c:if>
				</div>
				<div class="pb-20">
					<div class="col-sm-30">
						<form class="table" id="table">
							<table class="table" style="text-align : center">
								<thead>
									<tr>
										<td style="width: 100px;">
											<div class="custom-control custom-checkbox mb-5">
												<input type="checkbox" class="custom-control-input"
													id="tableCheckAll"> <label
													class="custom-control-label" for="tableCheckAll"></label>
											</div>
										</td>
										<th>수주번호</th>
										<th>수주업체</th>
										<th>출하번호</th>
										<th>LOT</th>
										<th>반품일자</th>
										<th>반품수량</th>
										<th>반품상태</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${List}" var="List" varStatus="status">
									<c:choose>
									<c:when test="${List.status eq '폐기'}"><tr style="background-color: #eaeef2;">
									</c:when>
									<c:otherwise><tr></c:otherwise>
									</c:choose>
											<!-- 리스트 표, 1페이지에 몇개 조회 가능하게 할 지는 정해도 될 거 같음 -->
											<c:choose>
												<c:when test="${List.status eq '반품등록'}">
													<td>
													<div class="custom-control custom-checkbox mb-5">
															<input type="checkbox" class="custom-control-input"
																id="checkTable${status.index}" name="tableCheck"
																value="${List.code }"> <label
																class="custom-control-label"
																for="checkTable${status.index}"></label>
														</div>
														</td>
												</c:when>
												<c:otherwise>
													<td>
													<div class="custom-control custom-checkbox mb-5">
														<input type="checkbox" class="custom-control-input"
															id="checkTable${status.index}" name="tableUnCheck"
															value="${List.code }" disabled="disabled" > 
														<label class="custom-control-label"
															for="checkTable${status.index}"></label>
													</div>
													</td>
												</c:otherwise>
											</c:choose>
											<!-- 상세 정보 이동! -->
											<th class="info${status.index}"
												style="color: blue; text-decoration: underline;">${List.code }</th>
											<th>${List.request_code }</th>
											<th>${List.ship_code }</th>
											<th>${List.lot }</th>
											<th>${List.date }</th>
											<th>${List.amount }</th>
											<th class="diff">${List.status }</th>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</form>
						<div class="row">
							<div class="col-sm-12 col-md-5">
								<div class="dataTables_info" id="DataTables_Table_0_info"
									role="status" aria-live="polite"></div>
							</div>
							<div class="col-sm-5 col-md-7 text-right"></div>
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

	<!-- list 내 처리 -->
<script type="text/javascript">
$('#reset').click(function(){
	  $('input[type="text"]').val('');
	  $('input[type="checkbox"]').prop("checked",false);
	  document.getElementById('accordion-search').submit();
	});
</script>
	<!-- 추가, 수정, 삭제, 상세보기 -->
	<script type="text/javascript">
		var popupWidth, popupHeight, popupX, popupY, link;
		var set;

		function retPopupSetting(width, height) {
			popupX = Math.ceil((window.screen.width - width) / 2);
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
		
		$(".diff").each(function() {
		    var diff = $(this).text();
		    if (diff == '폐기') {
		      $(this).css("color", "red");
		    }
		  });
	</script>
	<script>

		$(document).ready(function() {

					$("#add").click(function() {
						openPage("/returns/add", 600, 700);
					});

					$("#update").click(function() {
					    var check = $("input:checkbox[name=tableCheck]:checked");
					    if (check.length === 0 || check.length > 1) {
					        alert("수정할 항목을 하나만 선택하세요!");
					    } else {
					        var code = check.val();
					        openPage("/returns/update?code=" + code, 650, 650);
					    }
					});

					$("#delete").click(
							function() {
								var deleteList = [];
								$("input:checkbox[name=tableCheck]:checked")
										.each(function() {
											deleteList.push($(this).val());
										});
								if (deleteList.length > 0) {
									openPage("/returns/delete?code="
											+ deleteList.join(','), 700, 600);
								} else {
									alert('삭제 실패');
								}
							});

					$("#dispose").click(
							function() {
								var disposeList = [];
								$("input:checkbox[name=tableCheck]:checked")
										.each(function() {
											disposeList.push($(this).val());
										});
								if (disposeList.length > 0) {
									openPage("/returns/dispose?code="
											+ disposeList.join(','), 650, 500);
								} else {
									alert('관리자에게 문의하세요');
								}
							});

					$('body').on('click', '[class^="info"]', function() {
						var code = $(this).text().trim();
						openPage("/returns/info?code=" + code, 650, 730);
					});

					$("#searchCompany").click(function() {
						openPage("/request/searchClient", 420, 700);
					});

					$("#searchProduct").click(function() {
						openPage("/request/searchProduct", 420, 700);
					});
					
					$("#searchManager").click(function() {
						openPage("/request/searchManager", 420, 700);
					});

				});
	</script>

</body>
</html>
