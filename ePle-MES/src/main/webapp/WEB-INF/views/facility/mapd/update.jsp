<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../../include/head.jsp"%>
<title>정보 수정</title>

</head>
<body>
	<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10">
			<!-- 타이틀 -->
			<div class="login-title">
				<h1 class="text-center text-primary">정보 수정</h1>
			</div>
			<!-- 폼 -->
			<form action="/facility/mapd/update" method="post">

				<!-- 품목 코드 -->
				<input type="hidden" name="code" value="${mvo.code}">

				<!-- 원자재 or 완제품 품번 -->
				<div class="form-group">
					<label>종류</label> <select class="selectpicker form-control"
						id="group" name="group_id" data-style="btn-primary" data-size="5"
						required>
						<option value="" disabled selected hidden="hidden">선택</option>
						<c:choose>
							<c:when test="${mvo.group_id eq 'FACPRO'}">
								<option value="FACPRO" selected>생산</option>
								<option value="FACNPR">비생산</option>
								<option value="FACETC">기타</option>
							</c:when>
							<c:when test="${mvo.group_id eq 'FACNPR'}">
								<option value="FACPRO">생산</option>
								<option value="FACNPR" selected="selected">비생산</option>
								<option value="FACETC">기타</option>
							</c:when>
							<c:when test="${mvo.group_id eq 'FACETC'}">
								<option value="FACPRO">생산</option>
								<option value="FACNPR">비생산</option>
								<option value="FACETC" selected="selected">기타</option>
							</c:when>
						</c:choose>

					</select>
				</div>

				<!-- 소분류 -->
				<div class="selectpicker form-group" id="codeForm">
					<label>소분류</label> <select class="form-control" id="code"
						name="code_id" data-style="btn-info" data-size="5" required>
						<option selected disabled hidden>선택</option>
						<c:choose>
							<c:when test="${mvo.group_id eq 'FACPRO'}">
								<c:forEach var="i" items="${FACPRO}">
									<c:choose>
										<c:when test="${mvo.code_id eq i.code_id}">
											<option value='${i.code_id}'data-subtext='${i.code_id}' selected>${i.code_name}</option>
										</c:when>
										<c:otherwise>
											<option value='${i.code_id}'data-subtext='${i.code_id}'>${i.code_name}</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</c:when>
							<c:when test="${mvo.group_id eq 'FACNPR'}">
								<c:forEach var="i" items="${FACNPR}">
									<c:choose>
										<c:when test="${mvo.code_id eq i.code_id}">
											<option value='${i.code_id}'data-subtext='${i.code_id}' selected>${i.code_name}</option>
										</c:when>
										<c:otherwise>
											<option value='${i.code_id}'data-subtext='${i.code_id}'>${i.code_name}</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</c:when>
							<c:when test="${mvo.group_id eq 'FACETC'}">
								<c:forEach var="i" items="${FACETC}">
									<c:choose>
										<c:when test="${mvo.code_id eq i.code_id}">
											<option value='${i.code_id}'data-subtext='${i.code_id}' selected>${i.code_name}</option>
										</c:when>
										<c:otherwise>
											<option value='${i.code_id}'data-subtext='${i.code_id}'>${i.code_name}</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</c:when>
						</c:choose>
					</select>
				</div>

				<!-- 원자재 or 완제품 품명 -->
				<div class="row">
					<div class="col-sm-12 mb-3">
						<div class="form-group">
							<label>원자재 or 완제품 품명</label> <input class="form-control"
								type="text" name="name" value="${mvo.name}">
						</div>
					</div>
				</div>

				<!-- 규격 -->
				<div class="row">
					<div class="col-sm-12 mb-3">
						<div class="form-group">
							<label>규격</label> <input class="form-control" type="text"
								name="size" value="${mvo.size}">
						</div>
					</div>
				</div>

				<!-- 단위 -->
				<div class="row">
					<div class="col-sm-12 mb-3">
						<div class="form-group">
							<label>단위</label> <select class="form-control" name="unit"
								required>
								<option value="" disabled>단위 선택</option>
								<option value="EA" ${mvo.unit == 'EA' ? 'selected' : ''}>EA</option>
							</select>
						</div>
					</div>
				</div>

				<!-- 입고단가 (원) -->
				<div class="row">
					<div class="col-sm-12 mb-3">
						<div class="form-group">
							<label>단가</label> <input class="form-control" type="text"
								name="inprice" value="${mvo.inprice}">
						</div>
					</div>
				</div>

				<!-- 사용 여부 -->
				<div class="row">
					<div class="col-sm-12 mb-3">
						<div class="form-group">
							<label>사용 여부</label> <select class="form-control" name="active"
								required>
								<option value="" disabled selected>사용여부 선택</option>
								<option value="true" ${mvo.active == 'true' ? 'selected' : ''}>Y</option>
								<option value="false" ${mvo.active == 'false' ? 'selected' : ''}>N</option>
							</select>
						</div>
					</div>
				</div>


				<!-- 버튼 -->
				<div class="row">
					<div
						class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
						<button type="button" class="btn btn-secondary"
							onclick="window.close();">
							<b>취소</b>
						</button>
						<button type="submit" class="btn btn-success">
							<b>수정</b>
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
	<script type="text/javascript">
	$("#group").on("change", function() {
		$("#codeForm").css('display', 'block');
		var value = $(this).val();
		$("#code").empty();
		$("#code").append("<option selected disabled hidden>선택</option>");
		if (value == 'FACPRO') {
			<c:forEach var="i" items="${FACPRO}">
				$("select#code").append("<option value='${i.code_id}'data-subtext='${i.code_id}'>${i.code_name}</option>");
			</c:forEach>
		} else if (value == 'FACNPR') {
			<c:forEach var="i" items="${FACNPR}">
				$("select#code").append("<option value='${i.code_id}'data-subtext='${i.code_id}'>${i.code_name}</option>");
			</c:forEach>
		} else if (value == 'FACETC') {
			<c:forEach var="i" items="${FACETC}">
				$("select#code").append("<option value='${i.code_id}'data-subtext='${i.code_id}'>${i.code_name}</option>");
			</c:forEach>
		}
		$("#code").selectpicker('refresh');
	});
	</script>
</body>
</html>
