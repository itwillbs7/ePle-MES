<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/head.jsp"%>
<title>출하명령 삭제</title>
<style type="text/css">

</style>
</head>
<body>
	<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10" style="max-width:600px">
			<!-- 타이틀 -->
			<div class="login-title">
				<h1 class="text-center text-primary">출하명령 삭제</h1>
				<h3 class="text-center text-primary" style="margin-top : 10px;">삭제 리스트</h3>
			</div>
			<!-- 폼 -->
			<form method="post" id="deleteForm">
				<!-- 삭제 리스트 목록 -->
				<div class="row">
					<div class="col-sm-12 mb-6">
						<div class="form-group">
						<table class="table table-striped">
							<tr>
								<th>출하번호</th>
								<th>수주번호</th>
								<th>상품명</th>
								<th>출하량</th>
								<th>출하일자</th>
							</tr>
								<c:forEach items="${List}" var="item">
							<tr>
								<th>${item.code}</th>
								<th>${item.reqs_code }</th>
								<th>${item.product}</th>
								<th>${item.amount }</th>
								<th>${item.date }</th>
							</tr>
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
	<%@ include file="../include/footer.jsp"%>
	<script type="text/javascript">
	
	</script>
</body>
</html>