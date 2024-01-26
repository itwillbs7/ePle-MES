<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/head.jsp"%>
<title>수주 삭제</title>
</head>
<body>
	<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10" style="max-width:600px">
			<!-- 타이틀 -->
			<div class="login-title">
				<h1 class="text-center text-primary">반품 폐기</h1>
				<h3 class="text-center text-primary" style="margin-top : 10px;">폐기 처리 리스트</h3>
			</div>
			<!-- 폼 -->
			<form action ="" method="post" id="deleteForm">
				<!-- 삭제 리스트 목록 -->
				<div class="row">
					<div class="col-sm-12 mb-3">
						<div class="form-group">
						<table class="table">
							<tr>
								<th>수주번호</th>
								<th>회사명</th>
								<th>lot</th>
								<th>반품량</th>
							</tr>
								<c:forEach items="${List}" var="item">
							<tr>
								<th>${item.request_code}</th>
								<th>${item.clientName }</th>
								<th>${item.lot}</th>
								<th>${item.amount }</th>
							</tr>
								<input type="hidden" value="${item.code }">
								</c:forEach>
						</table>
						</div>
					</div>
				</div>
				<!-- 삭제 리스트 목록 -->

				<!-- 버튼 -->
				<div class="row">
					<div
						class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
						<button type="button" class="btn btn-secondary"
							onclick="window.close();">
							<b>취소</b>
						</button>
						<button type="submit" class="btn btn-warning">
							<b>폐기완료처리</b>
						</button>
					</div>
				</div>
				<!-- 버튼 -->
			</form>
			<!-- 폼 -->
		</div>
	</div>
	<!-- 콘텐츠 끝 -->
	<%@ include file="../include/footer.jsp"%>
	<script type="text/javascript">

	</script>
</body>
</html>