<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../../include/head.jsp"%>
<title>예약 삭제</title>
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
				<h1 class="text-center text-primary">예약 삭제</h1>
			</div>
			<!-- 폼 -->
			<form action="/line/manage/delete" method="post">
				<!-- 리스트 목록 -->
				<div class="row">
					<div class="col-sm-12 mb-3">
						<div class="form-group">
							<label><b>라인 목록</b></label>
							<c:forEach items="${list}" var="i">
								<div class="custom-control custom-checkbox mb-5">
									<input type="checkbox" class="custom-control-input" id="${i.code}" name="code" value="${i.code}" checked="checked"> <label class="custom-control-label" for="${i.code}">${i.line.name}(${i.line.place})</label>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
				<!-- 리스트 목록 -->
				
				<!-- 버튼 -->
				<div class="row">
					<div class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
						<button type="button" class="btn btn-secondary" onclick="closePopup();">
							<b>취소</b>
						</button>
						<button type="submit" class="btn btn-danger">
							<b>삭제</b>
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