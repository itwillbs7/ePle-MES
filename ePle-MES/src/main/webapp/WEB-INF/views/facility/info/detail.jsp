<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../../include/head.jsp"%>
<title>상세 정보</title>
</head>
<body>
<body>
<c:if test="${sessionScope.id eq null}">
	<c:redirect url="/" />
</c:if>
	<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10">
			<button type="button" class="close" onclick="closePopup();">×</button>
			<!-- 타이틀 -->
			<div class="login-title">
				<h1 class="text-center text-primary">상세 정보</h1>
			</div>
			<div class="row">
				<div class="col-sm-12 mb-3">
					<h2 class="text-center mb-10">${info.code}</h2>
					<table class="table table-striped">
						<tr>
							<th>모델</th>
							<td>${info.model}</td>
							<th>이름</th>
							<td>${info.mapd.name}</td>
						</tr>
						<tr>
							<th>카테고리</th>
							<td>${info.group_name}</td>
							<th>사용 상태</th>
							<td><c:choose>
									<c:when test="${info.active}">
										<span class="badge badge-success">사용 중</span>
									</c:when>
									<c:otherwise>
										<span class="badge badge-secondary">미사용</span>
									</c:otherwise>
								</c:choose></td>
						</tr>
						<tr>
							<th>등록일자</th>
							<td><fmt:formatDate value="${info.date}" type="both" /></td>
							<th>가격</th>
							<td> <fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${info.mapd.inprice}" /></td>
						</tr>
						<tr>
							<th>라인</th>
							<td>${info.line_name}</td>
							<th>위치</th>
							<td>${info.line.place}</td>
						</tr>
					</table>
				</div>
			</div>

			<!-- 버튼 -->
			<div class="row">
				<div class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
					<button type="button" class="btn btn-warning" onclick="javascript:openPage('/facility/info/update?code=${info.code}', 500, 600)">
						<b>수정</b>
					</button>
					<button type="button" class="btn btn-danger" onclick="javascript:openPage('/facility/info/delete?code=${info.code}', 500, 600)">
						<b>삭제</b>
					</button>
				</div>
			</div>
			<!-- 버튼 -->
		</div>
	</div>
	<!-- 콘텐츠 끝> -->
	<%@ include file="../../include/footer.jsp"%>
	<script type="text/javascript">
		$(document).ready(function(){
			window.resizeTo(outerWidth - innerWidth + 500, outerHeight - innerHeight + $(".login-box").outerHeight() + 12);
		});
	</script>
</body>
</html>