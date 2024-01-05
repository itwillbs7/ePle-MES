<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../../include/head.jsp"%>
<title>일상 보전 내역</title>
</head>
<body>
<fmt:setLocale value="ko_kr"/>
	<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10">
		<button type="button" class="close" onclick="window.close();">×</button>
			<!-- 타이틀 -->
			<div class="login-title">
				<h1 class="text-center text-primary">일상 보전 내역</h1>
				<h4 class="text-center">오늘 진행 : ${count}개</h4>
			</div>
			<!-- 폼 -->
			<form method="post">
				<!-- 삭제 리스트 목록 -->
				<div class="row">
					<div class="col-sm-12 mb-3">
						<div class="form-group">
							<ul class="list-group">
								<c:choose>
									<c:when test="${empty list or list.size() eq 0}">
										<li class="list-group-item">오늘 진행한 보전 내역이 없습니다!</li>
									</c:when>
									<c:when test="${!empty list and list.size() > 0}">
										<c:forEach var="i" items="${list}">
											<li class="list-group-item">${i.code} : <fmt:formatDate value="${i.reg_date}" type="time" pattern="(a) hh:mm:ss"/></li>
										</c:forEach>
									</c:when>
								</c:choose>
							</ul>
						</div>
					</div>
				</div>
				<!-- 삭제 리스트 목록 -->

				<!-- 버튼 -->
				<div class="row">
					<div
						class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
						<button type="button" class="btn btn-block btn-primary"
							onclick="window.close();">
							<b>닫기</b>
						</button>
					</div>
				</div>
				<!-- 버튼 -->
			</form>
			<!-- 폼 -->
		</div>
	</div>
	<!-- 콘텐츠 끝 -->
	<%@ include file="../../include/footer.jsp"%>
</body>
</html>