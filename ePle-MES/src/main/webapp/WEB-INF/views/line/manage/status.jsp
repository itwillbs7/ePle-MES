<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<%@ include file="../../include/head.jsp"%>
<title>라인 현황</title>
</head>
<body>
	<!-- 공통, css 및 js 추가 시 /include/header, footer에서 삽입 -->
	<%@ include file="../../include/header.jsp"%>
	<%@ include file="../../include/right-side-bar.jsp"%>
	<%@ include file="../../include/left-side-bar.jsp"%>
	<!-- 메인 컨테이너 -->
	<div class="main-container">
		<div class="pd-ltr-20 xs-pd-20-10">
			<div class="title" style="margin-bottom: 10px;">
				<h1>라인 현황</h1>
			</div>
			<div class="min-height-200px">
				<!-- Checkbox select Datatable start -->
				<div class="card-box mb-30">
					<div class="pd-20">
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
											<input type="checkbox" class="custom-control-input" id="tableCheckAll"> <label class="custom-control-label" for="tableCheckAll"></label>
										</div>
									</td>
									<td>#</td>
									<td>이름</td>
									<td>작업</td>
									<td>위치</td>
									<td>상태</td>
									<td>활성화</td>
									<th>옵션</th>
								</tr>
								<c:if test="${empty list}">
									<tr>
										<th colspan="8" style="text-align: center;">데이터가 없습니다.</th>
									</tr>
								</c:if>
								<c:if test="${!empty list }">
									<c:forEach items="${list}" var="i">
										<tr <c:choose>
											<c:when test="${i.active}">
												class="table-success"
											</c:when>
											<c:otherwise>
												class="table-danger"
											</c:otherwise>
										</c:choose>>
											<!-- 리스트 표, 1페이지에 몇개 조회 가능하게 할 지는 정해도 될 거 같음 -->
											<td><div class="custom-control custom-checkbox mb-5">
													<!-- id에 뒤에 el식으로 테이블 인덱스나, 번호 추가, value에 primary 붙이기  -->
													<input type="checkbox" class="custom-control-input" id="checkTable${i.code}" name="tableCheck" value="${i.code}"> <label class="custom-control-label" for="checkTable${i.code}"></label>
												</div></td>
											<th><a href="javascript:openPage('/line/manage/detail?code=${i.code}', 500, 634)"> <b class="text-blue tableTitle${i.code}">${i.code}</b>
											</a></th>
											<th>${i.name}</th>
											<th>${i.process}</th>
											<th>${i.place}</th>
											<th>${i.status}</th>
											<th><c:choose>
													<c:when test="${i.active}">
														가동 중
													</c:when>
													<c:otherwise>
														정지
													</c:otherwise>
												</c:choose></th>
											<td style="">
												<!-- 옵션 -->
												<div class="dropdown">
													<a class="btn btn-link font-24 p-0 line-height-1 no-arrow dropdown-toggle" href="#" role="button" data-toggle="dropdown"> <i class="dw dw-more"></i>
													</a>
													<div class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list">
														<!-- 링크 설정 -->
														<!-- 상세정보 -->
														<a class="dropdown-item" href="javascript:openPage('/line/manage/detail?code=${i.code}', 500, 600)"><i class="dw dw-view"></i> 상세 정보</a>
														<!-- 정지,가동 -->
														<a class="dropdown-item" href="javascript:openPage('/line/manage/set?code=${i.code}', 500, 600)">
														<c:choose>
															<c:when test="${i.active}">
																<i class="dw dw-stop"></i> 정지
															</c:when>
															<c:otherwise>
																<i class="dw dw-right-arrow-4"></i> 가동
															</c:otherwise>
														</c:choose>
														</a>
														<!-- 예약 -->
														<a class="dropdown-item" href="javascript:openPage('/line/manage/reservation?code=${i.code}', 500, 600)"><i class="dw dw-wall-clock"></i> 예약</a>
													</div>
												</div>
											</td>
										</tr>
									</c:forEach>
								</c:if>
							</table>
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
	<div class="modal fade" id="warning-modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
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