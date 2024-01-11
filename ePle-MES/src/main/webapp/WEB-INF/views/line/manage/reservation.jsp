<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../../include/head.jsp"%>
<title>예약</title>
</head>
<body>
	<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10">
			<button type="button" class="close" onclick="closePopup();">×</button>
			<!-- 타이틀 -->
			<div class="login-title">
				<h1 class="text-center text-primary">예약</h1>
			</div>
			<!-- 폼 -->
			<form action="/line/manage/reservation" method="post">
				<!-- 리스트 목록 -->
				<div class="row">
					<div class="col-sm-12 mb-3">
						<div class="form-group">
							<ul class="list-group">
								<c:if test="${!empty info}">
									<li class="list-group-item">${info.code} : ${info.name}(${info.place})</li>
									<input type="hidden" name="code" value="${info.code}">
								</c:if>
							</ul>
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
						<button type="submit" class="btn btn-info">
							<b>예약</b>
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
		var listHtml = "<li class='list-group-item'>"
		// get으로 불러온 인덱스가 있는 경우 인덱스 우선 진행

		var del = "<c:out value='${info}'/>";
		if (del == null || del == '') {
			// 부모의 체크박스 목록 불러오기
			var delList = opener.document.getElementsByName('tableCheck');

			// 체크박스 checked 개수
			var delCheckedCount = 0;

			for (var i = 0; i < delList.length; i++) {
				if (delList[i].checked) { // == true
					delCheckedCount++;
					let title = opener.document.getElementById('tableTitle'
							+ delList[i].value);
					let info = opener.document.getElementById('tableinfo'
							+ delList[i].value);
					$(".list-group").append(
							listHtml + delList[i].value + "&nbsp;:&nbsp;"
									+ title.innerText + "(" + info.innerText
									+ ")" + "</li>");
					$("form")
							.append(
									"<input type='hidden' name='code' value='" + delList[i].value +"'>");
				}
			}
			// 닫기 진행!
			if (delCheckedCount == 0)
				closePopup();
		}
	</script>
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