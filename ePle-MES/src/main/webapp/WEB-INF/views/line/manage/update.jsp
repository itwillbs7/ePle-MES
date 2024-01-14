<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../../include/head.jsp"%>
<title>예약 편집</title>
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
				<h1 class="text-center text-primary">예약 편집</h1>
			</div>
			<!-- 폼 -->
			<form action="/line/manage/update" method="post">
				<!-- 리스트 목록 -->
				<div class="row">
					<div class="col-sm-12 mb-3">
						<div class="form-group">
							<label><b>라인 목록</b></label>
							<c:forEach items="${list}" var="i">
								<div class="custom-control custom-checkbox mb-5">
									<input type="checkbox" class="custom-control-input" id="${i.code}" name="codeList" value="${i.code}" checked="checked"> <label class="custom-control-label" for="${i.code}">${i.line.name}(${i.line.place})</label>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
				<!-- 리스트 목록 -->

				<div class="row">
					<div class="col-sm-12 mb-3">
						<div class="form-group">
							<label><b>정지 사유</b></label> <select id="group" name="group_id" class="selectpicker form-control" data-style="btn-primary" data-size="5" required>
								<option selected disabled hidden>선택</option>
								<c:forEach items="${clist}" var="i">
									<option value="${i.group_id}">${i.group_name}</option>
								</c:forEach>
							</select>
						</div>

						<div class="form-group" id="codeForm" style="display: none;">
							<label><b>상세 사유</b></label> <select id="code" name="code_id" class="selectpicker form-control" data-size="5" data-style="btn-info" required>
								<option selected disabled hidden>선택</option>
							</select>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-sm-12 mb-3">
						<div class="form-group">
							<label><b>기간</b></label> <input name="dateRange" class="form-control datetimepicker-range" placeholder="Select Month" type="text" required />
						</div>
						<div class="form-group">
							<label><b>시작 시간</b></label> <input name="startTime" class="form-control time-picker" placeholder="time" type="text" required />
						</div>
						<div class="form-group">
							<label><b>종료 시간</b></label> <input name="endTime" class="form-control time-picker" placeholder="time" type="text" required />
						</div>
					</div>
				</div>

				<!-- 버튼 -->
				<div class="row">
					<div class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
						<button type="button" class="btn btn-secondary" onclick="closePopup();">
							<b>취소</b>
						</button>
						<button type="submit" class="btn btn-warning">
							<b>정지</b>
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
		$("#group")
				.on(
						"change",
						function() {
							$("#codeForm").css('display', 'block');
							var value = $(this).val();
							$("#code").empty();
							$("#code")
									.append(
											"<option selected disabled hidden>선택</option>");
							if (value == 'LOFF0') {
								<c:forEach var="i" items="${LOFF0}">
								$("select#code")
										.append(
												"<option value='${i.code_id}'data-subtext='${i.code_id}'>${i.code_name}</option>");
								</c:forEach>
							} else if (value == 'LOFF1') {
								<c:forEach var="i" items="${LOFF1}">
								$("select#code")
										.append(
												"<option value='${i.code_id}'data-subtext='${i.code_id}'>${i.code_name}</option>");
								</c:forEach>
							} else if (value == 'LOFF2') {
								<c:forEach var="i" items="${LOFF2}">
								$("select#code")
										.append(
												"<option value='${i.code_id}'data-subtext='${i.code_id}'>${i.code_name}</option>");
								</c:forEach>
							} else if (value == 'LOFF3') {
								<c:forEach var="i" items="${LOFF3}">
								$("select#code")
										.append(
												"<option value='${i.code_id}'data-subtext='${i.code_id}'>${i.code_name}</option>");
								</c:forEach>
							} else if (value == 'LOFF4') {
								<c:forEach var="i" items="${LOFF4}">
								$("select#code")
										.append(
												"<option value='${i.code_id}'data-subtext='${i.code_id}'>${i.code_name}</option>");
								</c:forEach>
							}
							$("#code").selectpicker('refresh');
						});
	</script>
</body>
</html>