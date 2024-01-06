<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
	String today = dateFormat.format(new Date());
%>
<html>
<head>
<%@ include file="../../include/head.jsp"%>
<title>설비 상태</title>
</head>
<body>
	<!-- 공통, css 및 js 추가 시 /include/header, footer에서 삽입 -->
	<%@ include file="../../include/header.jsp"%>
	<%@ include file="../../include/right-side-bar.jsp"%>
	<%@ include file="../../include/left-side-bar.jsp"%>
	<!-- 메인 컨테이너 -->
	<div class="main-container">
		<div class="pd-ltr-20 xs-pd-20-10">
			<div class="title mb-30">
				<h1>설비 상태</h1>
			</div>
			<div class="pd-20 mb-20 card-box">
				<div class="tab">
					<ul class="nav nav-pills" role="tablist">
						<li class="nav-item"><a class="nav-link text-blue active"
							data-toggle="tab" href="#home5" role="tab" aria-selected="true">기본</a></li>
						<li class="nav-item"><a class="nav-link text-blue"
							data-toggle="tab" href="#profile5" role="tab"
							aria-selected="false">보전 신청 목록(${orderCount}건)</a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane fade active show" id="home5" role="tabpanel">
							<div class="pd-20">
								<div class="table-responsive">
									<table class="table table-striped">
										<thead>
											<tr>
												<th>코드</th>
												<th>모델</th>
												<th>이름</th>
												<th>위치</th>
												<th>최근 보전일자</th>
											</tr>
										</thead>
										<tbody>
											<c:choose>
												<c:when test="${empty status}">
													<!-- 리스트가 없을 때 작동 -->
													<tr class="table-warning">
														<td colspan="6" class="text-center"><b>등록된 설비가
																없습니다.</b></td>
													</tr>
												</c:when>
												<c:otherwise>
													<!-- 리스트가 있을 때 작동 -->
													<!-- 
														사후보전이 등록되어 있을 때 danger 처리,
														complete asc, regdate asc
													 -->
													<c:forEach items="${status}" var="i">
														<c:choose>
															<c:when test="${empty i.reg_date}">
																<tr class="table-warning">
																	<th><a
																		href="javascript:openPage('/facility/mt/detail?code=${i.fac_code}', 500, 600)"><b
																			class="text-blue">${i.fac_code}</b></a></th>
																	<th>${i.facility.model}</th>
																	<th>${i.facility.name}</th>
																	<th>
																		<c:choose>
																			<c:when test="${empty i.facility.line_name}">
																				없음
																			</c:when>
																			<c:otherwise>
																				${i.facility.line_name}
																			</c:otherwise>			
																		</c:choose>
																	</th>
																	<th>보전 내역 없음!</th>
																</tr>
															</c:when>
															<c:when test="${dateformat.format(i.reg_date) < today}">
																<tr class="table-primary">
																	<th><a
																		href="javascript:openPage('/facility/mt/detail?code=${i.fac_code}', 500, 600)"><b
																			class="text-blue">${i.fac_code}</b></a></th>
																	<th>${i.facility.model}</th>
																	<th>${i.facility.name}</th>
																	<th><c:choose>
																			<c:when test="${empty i.facility.line_name}">
																				없음
																			</c:when>
																			<c:otherwise>
																				${i.facility.line_name}
																			</c:otherwise>
																		</c:choose></th>
																	<th><fmt:formatDate value="${i.reg_date}"
																			type="both" /></th>
																</tr>
															</c:when>
															<c:when test="${dateformat.format(i.reg_date) eq today}">
																<tr class="table-success">
																	<th><a
																		href="javascript:openPage('/facility/mt/detail?code=${i.fac_code}', 500, 600)"><b
																			class="text-blue">${i.fac_code}</b></a></th>
																	<th>${i.facility.model}</th>
																	<th>${i.facility.name}</th>
																	<th><c:choose>
																			<c:when test="${empty i.facility.line_name}">
																				없음
																			</c:when>
																			<c:otherwise>
																				${i.facility.line_name}
																			</c:otherwise>
																		</c:choose></th>
																	<th>오늘 완료됨</th>
																</tr>
															</c:when>
															<c:otherwise>
																<tr>
																	<th></th>
																</tr>
															</c:otherwise>
														</c:choose>
													</c:forEach>
												</c:otherwise>
											</c:choose>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<div class="tab-pane fade" id="profile5" role="tabpanel">
							<div class="pd-20">
								<div class="table-responsive">
									<table class="table table-striped">
										<thead>
											<tr>
												<th>코드</th>
												<th>모델</th>
												<th>이름</th>
												<th>위치</th>
												<th>상태</th>
												<th>등록 일자</th>
											</tr>
										</thead>
										<tbody>
											<c:choose>
												<c:when test="${orderCount == 0}">
													<!-- 리스트가 없을 때 작동 -->
													<tr class="table-warning">
														<td colspan="6" class="text-center"><b>등록된 보전 신청이
																없습니다.</b></td>
													</tr>
												</c:when>
												<c:otherwise>
													<c:forEach items="${order}" var="i">
														<tr>
															<th><a
																href="javascript:openPage('/facility/mt/detail?code=${i.fac_code}', 500, 600)"><b
																	class="text-blue">${i.fac_code}</b></a></th>
															<td>${i.facility.model}</td>
															<td>${i.facility.name}</td>
															<td><c:choose>
																	<c:when test="${empty i.facility.line_name}">없음</c:when>
																	<c:otherwise>${i.facility.line_name}</c:otherwise>
																</c:choose></td>
															<td>${i.mt_subject}</td>
															<td><fmt:formatDate value="${i.reg_date}"
																	type="both" /></td>
														</tr>
													</c:forEach>
													<!-- 리스트가 있을 때 작동 -->
													<!-- 등록 코드 오름차순 정렬!, complete = false -->
												</c:otherwise>
											</c:choose>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 푸터 -->
			<%@ include file="../../include/github.jsp"%>
			<%@ include file="../../include/footer.jsp"%>
		</div>
	</div>
</body>
</html>