<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../../include/head.jsp"%>
<title>발주 정보</title>
</head>
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
				<h1 class="text-center text-primary">발주 정보</h1>
			</div>
			<div class="row">
				<div class="col-sm-12 mb-3">
					<div class="form-group">
						<ul class="list-group">
							<c:choose>
								<c:when test="${empty info}">
									<li class="list-group-item">정보가 없습니다!</li>
								</c:when>
								<c:otherwise>
									<li class="list-group-item"><b style="display:block;">발주 번호</b><p style="display:inline;">${info.code}</p></li>
									<li class="list-group-item"><b style="display:block;">작성 정보</b><p style="display:inline;">${info.emp_name}(${info.ask_emp}) ${info.date}</p></li>
									<li class="list-group-item"><b style="display:block;">물품 정보</b><p style="display:inline;">${info.code_name}</p></li>
									<li class="list-group-item"><b style="display:block;">개수</b><p style="display:inline;">${info.amount}</p></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
				</div>
			</div>

			<!-- 버튼 -->
			<div class="row">
				<div class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
					<button type="button" class="btn btn-warning" onclick="javascript:openPage('/facility/order/update?code=${info.code}', 500, 600)">
						<b>수정</b>
					</button>
					<button type="button" class="btn btn-danger" onclick="javascript:openPage('/facility/order/delete?code=${info.code}', 500, 600)">
						<b>삭제</b>
					</button>
				</div>
			</div>
			<!-- 버튼 -->
		</div>
	</div>
	<!-- 콘텐츠 끝> -->
	<%@ include file="../../include/footer.jsp"%>
</body>
</html>