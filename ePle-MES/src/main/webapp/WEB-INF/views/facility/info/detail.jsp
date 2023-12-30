<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<%@ include file="../../include/head.jsp"%>
<title>설비 상세 정보</title>
</head>
<body>
	<!-- 공통, css 및 js 추가 시 /include/header, footer에서 삽입 -->
	<%@ include file="../../include/header.jsp"%>
	<%@ include file="../../include/right-side-bar.jsp"%>
	<%@ include file="../../include/left-side-bar.jsp"%>
	<!-- 메인 컨테이너 -->
	<div class="main-container">
		<div class="pd-ltr-20 xs-pd-20-10">
			<div class="min-height-200px">
				<div class="title" style="margin-bottom: 10px;">
					<h1>설비 상세 정보</h1>
				</div>
				<br>
				<div class="pd-20 card-box mb-30">
					<h2 class="text-blue mb-10">${info.code}</h2>
					<br>
					<table class="table table-striped">
						<tr>
							<th>모델</th><td>${info.model}</td><th>이름</th><td>${info.name}</td>
						</tr>
						<tr>
							<th>카테고리</th>
							<td>
								<c:choose>
									<c:when test="${info.category eq 'production'}">생산</c:when>
									<c:when test="${info.category eq 'non-production'}">비생산</c:when>
									<c:when test="${info.category eq 'etc'}">기타</c:when>
								</c:choose>
							</td>
							<th>사용 상태</th>
							<td>
								<c:choose>
									<c:when test="${info.active}">
										<span class="badge badge-success">사용 중</span>
									</c:when>
									<c:otherwise>
										<span class="badge badge-secondary">미사용</span>
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
						<tr>
							<th>구매 일자</th><td>${info.purchase_date}</td><th>구매 금액</th><td>${info.inprice}</td>
						</tr>
						<tr>
							<th>라인 코드</th><td>${info.line_code}</td><th>사용자</th><td>${info.client_code}</td>
						</tr>
					</table>
				</div>
				<div class="pd-20 card-box mb-30">
					<h2 class="text-blue mb-10">보전 내역</h2>
					<br>
					<table class="table table-striped">
						<tr>
							<th>#</th><th>등록일자</th><th>작성자</th><th>완료 여부</th>
						</tr>
						<c:choose>
							<c:when test="${info.mainList == null or info.mainList.size() == 0}">
								<tr><th colspan="4" style="text-align: center;">등록된 보전 내역이 없습니다</th></tr>
							</c:when>
							<c:otherwise>
								<c:forEach	items="${list.mainList}" var="i">
									<tr>
										<td>${i.code}</td>
										<td>${i.reg_date}</td>
										<td>${i.emp_code}</td>
										<td>
											<c:choose>
												<c:when test="${i.complete}">
													<span class="badge badge-success">완료</span>
												</c:when>
												<c:otherwise>
													<span class="badge badge-secondary">미완료</span>
												</c:otherwise>
											</c:choose>
										</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</table>

				</div>
				<!-- 푸터 -->
				<%@ include file="../../include/github.jsp"%>
				<%@ include file="../../include/footer.jsp"%>
			</div>
		</div>
	</div>
</body>
</html>