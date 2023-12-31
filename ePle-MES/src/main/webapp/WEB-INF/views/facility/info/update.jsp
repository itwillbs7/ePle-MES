<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../../include/head.jsp"%>
<title>보전 수정</title>
<!-- 
	실행 방법
		- 테이블 페이지의 옵션에서 삭제클릭
		- 상세 정보에서 삭제 클릭
 -->
</head>
<body>
	<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10">
			<!-- 타이틀 -->
			<div class="login-title">
				<h1 class="text-center text-primary">보전 수정</h1>
			</div>
			<!-- 폼 -->
			<form method="post">
				<!-- 입력 구간 -->
				<div class="row">
					<div class="col-sm-12 mb-3">
						<!-- examples -->
						<div class="form-group">
							<label>모델명</label> <input class="form-control" type="text"
								name="model" value="${info.model}" readonly>
						</div>
						<div class="form-group">
							<label>이름</label> <input class="form-control" type="text"
								name="name" value="${info.name}" readonly>
						</div>
						<c:choose>
							<c:when test="${info.category eq 'production'}">
								<div class="form-group">
									<label>시간당 생산량</label> <input class="form-control"
										type="number" name="uph" value="${info.uph}" required>
								</div>
							</c:when>
						</c:choose>
						<div class="form-group">
							<label>라인 정보</label> <select class="form-control"
								name="line_code">
								<option>선택</option>
								<option value="None">없음</option>
								<c:forEach items="${line}" var="i">
									<c:choose>
										<c:when test="${info.line_code eq i.code}">
											<option value="${i.code}" selected>${i.name}</option>
										</c:when>
										<c:otherwise>
											<option value="${i.code}">${i.name}</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</select>
						</div>
						<!-- examples end -->
					</div>
				</div>
				<!-- 입력 구간 -->

				<!-- 버튼 -->
				<div class="row">
					<div
						class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
						<button type="button" class="btn btn-secondary"
							onclick="window.close();">
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
	<%@ include file="../../include/footer.jsp"%>
	<script type="text/javascript">
		$(document).ready(function(){
			window.resizeTo(outerWidth - innerWidth + 500, outerHeight - innerHeight + $(".login-box").outerHeight() + 11);
		});
	</script>
</body>
</html>