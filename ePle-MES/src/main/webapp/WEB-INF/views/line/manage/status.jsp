<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
	String today = dateFormat.format(new Date());

	pageContext.setAttribute("dateFormat", dateFormat);
	pageContext.setAttribute("today", today);
%>
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
			<div class="title mb-10">
				<h1>라인 현황</h1>
			</div>
			<div class="tab">
				<ul class="nav nav-pills mb-20" role="tablist">
					<li class="nav-item"><a class="nav-link text-blue active" data-toggle="tab" href="#home5" role="tab" aria-selected="true">기본</a></li>
					<li class="nav-item"><a class="nav-link text-blue" data-toggle="tab" href="#profile5" role="tab" aria-selected="false">예약</a></li>
				</ul>
				<div class="pd-20 mb-20 card-box">
					<div class="tab-content">
						<div class="tab-pane fade active show" id="home5" role="tabpanel">
							<div class="btn-group pull-right" style="margin-bottom: 10px">
								<button type="button" class="btn btn-warning" id="set">
									<b>가동/정지</b>
								</button>
								<button type="button" class="btn btn-info" id="reservation">
									<b>예약</b>
								</button>
							</div>
							<table class="table table-striped">
								<tr>
									<td style="width: 100px;">
										<div class="custom-control custom-checkbox mb-5">
											<input type="checkbox" class="custom-control-input" id="tableCheckAll"> <label class="custom-control-label" for="tableCheckAll"></label>
										</div>
									</td>
									<th>#</th>
									<th>이름</th>
									<th>작업</th>
									<th>위치</th>
									<th>상태</th>
									<th>활성화</th>
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
											<td><a href="javascript:openPage('/line/manage/detail?code=${i.code}', 500, 634)"> <b class="text-blue tableTitle${i.code}">${i.code}</b>
											</a></td>
											<td id="tableTitle${i.code}">${i.name}</td>
											<td>${i.process}</td>
											<td id="tableinfo${i.code}">${i.place}</td>
											<td>${i.status}</td>
											<td><c:choose>
													<c:when test="${i.active}">
														<span class="badge badge-success" id="tableActive${i.code}">가동 중</span>
													</c:when>
													<c:otherwise>
														<span class="badge badge-danger" id="tableActive${i.code}">정지</span>
													</c:otherwise>
												</c:choose></td>
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
															<c:choose>
																<c:when test="${i.active}">
																	<a class="dropdown-item" href="javascript:openPage('/line/manage/off?code=${i.code}', 500, 600)"><i class="dw dw-stop"></i> 정지
															</c:when>
																<c:otherwise>
																	<a class="dropdown-item" href="javascript:openPage('/line/manage/on?code=${i.code}', 500, 600)"><i class="dw dw-right-arrow-4"></i> 가동
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
						<div class="tab-pane fade" id="profile5" role="tabpanel">
							<div class="btn-group pull-right" style="margin-bottom: 10px">
								<button type="button" class="btn btn-warning" id="set">
									<b>가동/정지</b>
								</button>
								<button type="button" class="btn btn-info" id="reservation">
									<b>예약</b>
								</button>
							</div>
							<table class="table table-striped">
								<tr>
									<td style="width: 100px;">
										<div class="custom-control custom-checkbox mb-5">
											<input type="checkbox" class="custom-control-input" id="tableCheckAll"> <label class="custom-control-label" for="tableCheckAll"></label>
										</div>
									</td>
									<th>#</th>
									<th>이름</th>
									<th>사유</th>
									<th>라인명</th>
									<th>시작일자</th>
									<th>종료일자</th>
									<th>옵션</th>
								</tr>
								<c:if test="${empty reservation}">
									<tr>
										<th colspan="7" style="text-align: center;">데이터가 없습니다.</th>
									</tr>
								</c:if>
								<c:if test="${!empty reservation}">
									<c:forEach items="${reservation}" var="i">
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
											<td><a href="javascript:openPage('/line/manage/detail?code=${i.code}', 500, 634)"> <b class="text-blue tableTitle${i.code}">${i.code}</b>
											</a></td>
											<td id="tableTitle${i.code}">${i.name}</td>
											<td>${i.process}</td>
											<td id="tableinfo${i.code}">${i.place}</td>
											<td>${i.status}</td>
											<td><c:choose>
													<c:when test="${i.active}">
														<span class="badge badge-success" id="tableActive${i.code}">가동 중</span>
													</c:when>
													<c:otherwise>
														<span class="badge badge-danger" id="tableActive${i.code}">정지</span>
													</c:otherwise>
												</c:choose></td>
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
														<a class="dropdown-item" href="javascript:openPage('/line/manage/set?code=${i.code}', 500, 600)"> <c:choose>
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
			</div>
			<!-- 푸터 -->
			<%@ include file="../../include/github.jsp"%>
			<%@ include file="../../include/footer.jsp"%>
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
					<p id="modalText">
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
		$(document)
				.ready(
						function() {
							// 추가
							$("#set")
									.click(
											function() {
												var ch = $("input:checkbox[name=tableCheck]:checked");
												if (ch.length > 0) {
													// 가로, 세로 설정
													var firstOne;
													var isAllSame = true;
													for (i = 0; i < ch.length; i++) {
														var chkCode = $(ch[i])
																.val();
														if (i == 0) {
															firstOne = $(
																	"#tableActive"
																			+ chkCode)
																	.html();
														} else {
															if (firstOne != $(
																	"#tableActive"
																			+ chkCode)
																	.html()) {
																isAllSame = false;
																break;
															} else {
																continue;
															}
														}
													}
													if (isAllSame) {
														if (firstOne == '가동 중')
															openPage(
																	"/line/manage/off",
																	500, 700);
														else
															openPage(
																	"/line/manage/on",
																	500, 700);
													} else {
														$(this).attr(
																"data-toggle",
																"modal");
														$(this)
																.attr(
																		"data-target",
																		"#warning-modal");
														$("#modalText")
																.html(
																		"<b>동일하지 않은 상태</b>의 데이터입니다!");
														$(
																$(this)
																		.data(
																				"target"))
																.show();
													}
												} else {
													$(this).attr("data-toggle",
															"modal");
													$(this).attr("data-target",
															"#warning-modal");
													$("#modalText")
															.html(
																	"<b>선택된 데이터</b>가 없습니다!");
													$($(this).data("target"))
															.show();
												}
											});

							// 삭제
							$("#reservation")
									.click(
											function() {
												var ch = $("input:checkbox[name=tableCheck]:checked").length;
												if (ch > 0) {
													// 가로, 세로 설정
													openPage(
															"/line/manage/reservation",
															500, 700);
												} else {
													$(this).attr("data-toggle",
															"modal");
													$(this).attr("data-target",
															"#warning-modal");
													$("#modalText")
															.html(
																	"<b>선택된 데이터</b>가 없습니다!");
													$($(this).data("target"))
															.show();
												}
											});
						});
	</script>
</body>
</html>