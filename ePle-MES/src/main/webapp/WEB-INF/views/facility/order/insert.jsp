<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../../include/head.jsp"%>
<title>설비 발주 신청</title>
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
				<h1 class="text-center text-primary">설비 발주 신청</h1>
			</div>
			<form method="post">
				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<label>설비 종류</label> <select class="custom-select2 form-control" name="material" style="width: 100%; height: 38px" required>
								<option value="" selected>선택</option>
								<optgroup label="생산용 설비">
									<c:forEach items="${proList}" var="i">
										<option value="${i.code}">${i.name}</option>
									</c:forEach>
								</optgroup>
								<optgroup label="비생산 설비">
									<c:forEach items="${nprList}" var="i">
										<option value="${i.code}">${i.name}</option>
									</c:forEach>
								</optgroup>
								<optgroup label="기타">
									<c:forEach items="${etcList}" var="i">
										<option value="${i.code}">${i.name}</option>
									</c:forEach>
								</optgroup>
							</select>
						</div>
						<div class="form-group row">
							<label class="col-sm-12 col-md-2 col-form-label">수량</label>
							<div class="col-sm-12 col-md-10">
								<input class="form-control" name="amount" value="1" type="number" min="1" max="100">
							</div>
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