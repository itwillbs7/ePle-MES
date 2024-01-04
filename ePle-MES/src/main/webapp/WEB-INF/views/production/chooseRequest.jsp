<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/head.jsp"%>
<title>수주정보 선택</title>
</head>
<body>
	<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10" style="max-width: 1000px">
			<!-- 타이틀 -->
			<div class="login-title">
				<h1 class="text-center text-primary">수주정보 선택</h1>
			</div>
			<!-- 폼 -->
			<form method="post">
				<div class="row">
					<!-- 검색구간 -->
				</div>
				<div class="row">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>수주번호</th>
								<th>수주업체명</th>
								<th>수주일자</th>
								<th>납품예정일</th>
								<th>품번</th>
								<th>품명</th>
								<th>수주수량</th>
								<th>재고량</th>
								<th>과부족</th>
								<th>수주상태</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${List}" var="List" varStatus="status">
								<tr>
									<th class="info${status.index}" style="color: blue; text-decoration: underline;">${List.code }</th>
									<th>${List.clientName }</th>
									<th>${List.date }</th>
									<th>${List.deadline }</th>
									<th>${List.product }</th>
									<th>${List.productName }</th>
									<th>${List.amount }</th>
									<th>${List.stock }</th>
									<th class="diff">${List.stock - List.amount }</th>
									<th>${List.status }</th>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

				<!-- 버튼 -->
				<div class="row">
					<div class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
						<button type="button" class="btn btn-secondary" onclick="window.close();">
							<b>취소</b>
						</button>
						<button type="submit" class="btn btn-success" id="submit" disabled>
							<b>선택</b>
						</button>
					</div>
				</div>
				<!-- 버튼 -->
			</form>
			<!-- 폼 -->
		</div>
	</div>
	<!-- 콘텐츠 끝> -->
	<%@ include file="../include/footer.jsp"%>
</body>
</html>