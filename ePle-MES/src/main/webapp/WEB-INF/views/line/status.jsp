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
<%@ include file="../include/head.jsp"%>
<title>라인 상태</title>
</head>
<body>
	<!-- 공통, css 및 js 추가 시 /include/header, footer에서 삽입 -->
	<%@ include file="../include/header.jsp"%>
	<%@ include file="../include/right-side-bar.jsp"%>
	<%@ include file="../include/left-side-bar.jsp"%>
	<!-- 메인 컨테이너 -->
	<div class="main-container">
		<div class="pd-ltr-20 xs-pd-20-10">
			<div class="title mb-30">
				<h1>라인 상태</h1>
			</div>
			<div class="pd-20 mb-20 card-box">
				<div class="pd-20">
					<div class="table-responsive">
						<table class="table table-striped">
							<thead>
								<tr>
									<th>코드</th>
									<th>라인명</th>
									<th>과정</th>
									<th>상태</th>
									<th>설비 개수</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${empty status}">
										<!-- 리스트가 없을 때 작동 -->
										<tr class="table-warning">
											<td colspan="6" class="text-center"><b>등록된 설비가 없습니다.</b></td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach items="${status}" var="i">
											<c:choose>
												<c:when test="${empty i.reg_date || i.reg_date == null}">
													<tr class="table-warning">
														<th><a href="javascript:openPage('/facility/mt/detail?code=${i.fac_code}', 500, 600)"><b class="text-blue">${i.fac_code}</b></a></th>
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
														<th>보전 내역 없음!</th>
													</tr>
												</c:when>
												<c:when test="${!empty i.reg_date}">
													<tr class="table-primary">
														<th><a href="javascript:openPage('/facility/mt/detail?code=${i.fac_code}', 500, 600)"><b class="text-blue">${i.fac_code}</b></a></th>
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
														<th><fmt:formatDate value="${i.reg_date}" type="both" /></th>
													</tr>
												</c:when>
											</c:choose>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<!-- 푸터 -->
		<%@ include file="../include/github.jsp"%>
		<%@ include file="../include/footer.jsp"%>
	</div>
	</div>
</body>
</html>