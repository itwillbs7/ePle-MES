<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/head.jsp"%>
<title>소요량 등록</title>
</head>
<body>
	<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10">
			<!-- 타이틀 -->
			<div class="login-title">
				<h1 class="text-center text-primary">소요량 등록</h1>
			</div>
			<!-- 폼 -->
			<form action="/requirement/add" method="post">
				<!-- 입력 구간 -->
				<div class="row">
					<div class="col-sm-12 mb-3">
						<!-- examples -->
						<div class="form_group">
							<label><b>완제품</b></label>
							<c:choose>
								<c:when test="${empty mapd}">
									<p>${info.name}</p>
									<input class="form-control" type="hidden" name="mapd_code" value="${info.code}" id="mapd_code" required>
								</c:when>
								<c:when test="${empty info}">
									<select class="custom-select2 form-control" name="mapd_code" style="width: 100%; height: 38px" required>
										<option selected disabled hidden="hidden" value="">선택</option>
										<c:forEach var="i" items="${mapd}">
											<option value="${i.code}">${i.name}</option>
										</c:forEach>
									</select>
								</c:when>
							</c:choose>
						</div>
						<div class="form_group">
							<label><b>재료</b></label> <select class="custom-select2 form-control" name="material" style="width: 100%; height: 38px" required>
								<option selected disabled hidden="hidden" value="">선택</option>
								<c:forEach var="i" items="${mat}">
									<option value="${i.code}">${i.name}</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label><b>소요량</b></label> <input class="form-control" type="number" name="amount" placeholder="소요량 입력" required>
						</div>
						<div class="form-group">
							<label><b>내용</b></label>
							<textarea class="form-control" name="content" required></textarea>
						</div>
						<!-- examples end -->
					</div>
				</div>
				<!-- 입력 구간 -->

				<!-- 버튼 -->
				<div class="row">
					<div class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
						<button type="button" class="btn btn-secondary" onclick="window.close();">
							<b>취소</b>
						</button>
						<button type="submit" class="btn btn-success">
							<b>등록</b>
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
	<script type="text/javascript">
		$(document).ready(function(){
			window.resizeTo(outerWidth - innerWidth + 500,
					outerHeight - innerHeight
							+ $(".login-box").outerHeight()
							+ 12);
		});
	</script>
</body>
</html>