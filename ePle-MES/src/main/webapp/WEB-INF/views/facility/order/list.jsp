<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<%@ include file="../../include/head.jsp"%>
<title>설비 발주 신청</title>
</head>
<body>
<c:if test="${sessionScope.id eq null}">
	<c:redirect url="/" />
</c:if>
	<!-- 공통, css 및 js 추가 시 /include/header, footer에서 삽입 -->
	<%@ include file="../../include/header.jsp"%>
	<%@ include file="../../include/right-side-bar.jsp"%>
	<%@ include file="../../include/left-side-bar.jsp"%>
	<!-- 메인 컨테이너 -->
	<div class="main-container">
		<div class="pd-ltr-20 xs-pd-20-10">
			<div class="title" style="margin-bottom: 10px;">
				<h1>설비 발주 신청</h1>
			</div>
			<div class="min-height-200px">
				<form id="accordion-search">
					<!-- 정렬, asc, desc -->
					<input type="hidden" name="activeSortCategory" id="sortCategory"
						value="${pageVO.search.activeSortCategory}"> <input
						type="hidden" name="sortValue" id="sortValue"
						value="${pageVO.search.sortValue}">

					<c:choose>
						<c:when test="${!empty pageVO.cri.page}">
							<input type="hidden" id="page" name="page" value="1">
						</c:when>
						<c:when test="${!empty pageVO.cri.page}">
							<input type="hidden" id="page" name="page"
								value="${pageVO.cri.page}">
						</c:when>
					</c:choose>

					<c:choose>
						<c:when test="${empty pageVO.cri.pageSize}">
							<input type="hidden" id="pageSize" name="pageSize" value="10">
						</c:when>
						<c:when test="${!empty pageVO.cri.pageSize}">
							<input type="hidden" id="pageSize" name="pageSize"
								value="${pageVO.cri.pageSize}">
						</c:when>
					</c:choose>
				</form>
				<!-- Checkbox select Datatable start -->
				<div class="card-box mb-30">
					<div class="pd-20">
						<div class="btn-group pull-left" style="margin-bottom: 15px">
							<div class="dropdown">
								<button type="button" id="searchCategoryButton"
									class="btn btn-secondary dropdown-toggle waves-effect"
									data-toggle="dropdown" aria-expanded="false">
									행 개수 <span class="caret"></span>
								</button>
								<div class="dropdown-menu" style="">
									<a class="dropdown-item" href="javascript:changePageSize(10);">10</a>
									<a class="dropdown-item" href="javascript:changePageSize(25);">25</a>
									<a class="dropdown-item" href="javascript:changePageSize(50);">50</a>
									<a class="dropdown-item" href="javascript:changePageSize(100);">100</a>
								</div>
							</div>
						</div>
						<div class="btn-group pull-right" style="margin-bottom: 10px">
							<button type="button" class="btn btn-success" id="add">
								<b>추가</b>
							</button>
							<button type="button" class="btn btn-danger" id="delete">
								<b>삭제</b>
							</button>
						</div>
					</div>
					<div class="pb-20">
						<div class="col-sm-30">
							<table class="table table-striped">
								<tr>
									<td style="width: 100px;">
										<div class="custom-control custom-checkbox mb-5">
											<input type="checkbox" class="custom-control-input"
												id="tableCheckAll"> <label
												class="custom-control-label" for="tableCheckAll"></label>
										</div>
									</td>
									<c:forEach begin="0" end="5" var="i">
										<th class="btn-light" onclick="javascript:orderList(${i})"><c:if
												test="${i eq pageVO.search.activeSortCategory}">
												<c:choose>
													<c:when test="${pageVO.search.sortValue eq 'asc'}">
														<i class="ion-android-arrow-up"></i>
													</c:when>
													<c:when test="${pageVO.search.sortValue eq 'desc'}">
														<i class="ion-android-arrow-down"></i>
													</c:when>
												</c:choose>
											</c:if> &nbsp;&nbsp;
											<h6 style="display: inline-block;">${pageVO.search.kor[i]}</h6></th>
									</c:forEach>
									<th>옵션</th>
								</tr>
								<c:if test="${empty list}">
									<tr>
										<th colspan="8" style="text-align: center;">데이터가 없습니다.</th>
									</tr>
								</c:if>
								<c:if test="${!empty list }">
									<c:forEach items="${list}" var="i">
										<tr>
										
											
											<!-- 리스트 표, 1페이지에 몇개 조회 가능하게 할 지는 정해도 될 거 같음 -->
											<td><div class="custom-control custom-checkbox mb-5">
													<!-- id에 뒤에 el식으로 테이블 인덱스나, 번호 추가, value에 primary 붙이기  -->
													<input type="checkbox" class="custom-control-input"
														id="checkTable${i.code}" name="tableCheck" value="${i.code}">
													<label class="custom-control-label" for="checkTable${i.code}"></label>
												</div></td>
											<th>
												<a href="javascript:openPage('/facility/order/detail?code=${i.code}', 500, 634)">
													<b class="text-blue tableTitle${i.code}">${i.code}</b>	
												</a>
											</th>
											<th>${i.date}</th>
											<th>${i.group_name}</th>
											<th id ="tableTitle${i.code}">${i.mapd.name}</th>
											<th>${i.ask_emp}</th>
											<th id="tableinfo${i.code}">${i.amount}</th>
											<td style="">
												<!-- 옵션 -->
												<div class="dropdown">
													<a
														class="btn btn-link font-24 p-0 line-height-1 no-arrow dropdown-toggle"
														href="#" role="button" data-toggle="dropdown"> <i
														class="dw dw-more"></i>
													</a>
													<div
														class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list">
														<!-- 링크 설정 -->
														<!-- 수정 -->
														<a class="dropdown-item"
															href="javascript:openPage('/facility/order/update?code=${i.code}', 500, 600)"><i
															class="dw dw-edit2"></i> 수정</a>
														<!-- 삭제 -->
														<a class="dropdown-item"
															href="javascript:openPage('/facility/order/delete?code=${i.code}', 500, 600)"><i
															class="dw dw-delete-3"></i> 삭제</a>
													</div>
												</div>
											</td>
										</tr>
									</c:forEach>
								</c:if>
							</table>
							<div class="row">
								<div class="col-sm-12 col-md-5">
									<div class="dataTable_info" id="dataTable_info" role="status"
										aria-live="polite"></div>
								</div>
							</div>
							<div class="btn-toolbar justify-content-center mb-15">
								<c:if test="${pageVO.totalCount > 1}">
									<div class="btn-group">
										<c:if test="${pageVO.prev}">
											<a href="javascript:pageMove(${pageVO.startPage - 1})"
												class="btn btn-outline-primary prev"> <i
												class="fa fa-angle-double-left"></i>
											</a>
										</c:if>
										<c:forEach begin="${pageVO.startPage}" end="${pageVO.endPage}"
											var="i">
											<c:if test="${pageVO.cri.page == i}">
												<span class="btn btn-primary current">${i}</span>
											</c:if>
											<c:if test="${pageVO.cri.page != i}">
												<a href="javascript:pageMove(${i})"
													class="btn btn-outline-primary">${i}</a>
											</c:if>
										</c:forEach>
										<c:if test="${pageVO.next}">
											<a href="javascript:pageMove(${pageVO.endPage + 1})"
												class="btn btn-outline-primary next"> <i
												class="fa fa-angle-double-right"></i>
											</a>
										</c:if>
									</div>
								</c:if>
							</div>
						</div>
					</div>
				</div>
				<!-- Checkbox select Datatable End -->
				<!-- 푸터 -->
				<%@ include file="../../include/github.jsp"%>
				<%@ include file="../../include/footer.jsp"%>
			</div>
		</div>
	</div>

	<!-- 모달 창 -->
	<div class="modal fade" id="warning-modal" tabindex="-1" role="dialog"
		aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm modal-dialog-centered">
			<div class="modal-content bg-warning">
				<div class="modal-body text-center">
					<h3 class="mb-15">
						<i class="fa fa-exclamation-triangle"></i> 주의
					</h3>
					<p>
						<b>선택된 데이터</b>가 없습니다!
					</p>
					<button type="button" class="btn btn-dark" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 모달 창 -->

	<!-- 추가, 수정, 삭제 -->
	<script type="text/javascript">
		$(document).ready(function() {
			// 추가
			$("#add").click(function() {
				// 가로, 세로 설정
				openPage("/facility/order/insert", 500, 600);
			});

			// 삭제
			$("#delete").click(function() {
				var ch = $("input:checkbox[name=tableCheck]:checked").length;
				if (ch > 0) {
					// 가로, 세로 설정
					openPage("/facility/order/delete", 400, 700);
				} else {
					$(this).attr("data-toggle", "modal");
					$(this).attr("data-target", "#warning-modal");
					$($(this).data("target")).show();
				}
			});
		});
	</script>
</body>
</html>