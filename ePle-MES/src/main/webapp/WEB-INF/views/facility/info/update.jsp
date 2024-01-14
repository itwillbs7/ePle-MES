<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../../include/head.jsp"%>
<title>설비 수정</title>
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
				<h1 class="text-center text-primary">설비 수정</h1>
			</div>
			<form method="post" onsubmit="return formCheck()">
				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<label>라인</label> <select class="custom-select2 form-control" name="line" style="width: 100%; height: 38px" required>
								<option value="" selected>선택</option>
								<c:forEach var="i" items="${line}">
									<option value="${i.code}">${i.name}</option>
								</c:forEach>
							</select>
						</div>
						<c:if test="${info.mapd.group_id eq 'FACPRO'}">
							<div class="form-group row">
								<label class="col-sm-12 col-md-2 col-form-label">uph</label>
								<div class="col-sm-12 col-md-10">
									<input class="form-control" name="uph" value="${info.uph}" type="number" min="1" max="1000" required>
								</div>
							</div>
						</c:if>
						<div class="form-group">
							<label><b>사용 상태</b></label><br>
							<c:choose>
								<c:when test="${info.active}">
									<input type="checkbox" name="active" checked value="true" class="switch-btn" data-color="#0099ff" />
								</c:when>
								<c:otherwise>
									<input type="checkbox" name="active" value="true" class="switch-btn" data-color="#0099ff" />
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
				<!-- 버튼 -->
				<div class="row">
					<div class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
						<button type="button" class="btn btn-secondary" onclick="closePopup();">
							<b>취소</b>
						</button>
						<button type="submit" class="btn btn-success">
							<b>입력</b>
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