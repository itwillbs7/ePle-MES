<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../../../include/head.jsp"%>
<title>보전 입력</title>
</head>
<body>
	<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10">
			<button type="button" class="close" onclick="closePopup();">×</button>
			<!-- 타이틀 -->
			<div class="login-title">
				<h1 class="text-center text-primary">일상 보전 입력</h1>
			</div>
			<!-- 폼 -->
			<form method="post">
				<input type="hidden" name="code" value="${info.code}">
				<input type="hidden" name="manager" value="${emp_code}">
				<!-- 카테고리 -->
				<div class="row">
					<div class="col-sm-12 mb-3">
						<div class="form-group">
							<label><b>설비 목록</b></label> <select class="custom-select2 form-control" name="fac_code" style="width: 100%; height: 38px">
								<option value="None">선택</option>
								<c:if test="${!empty list}">
									<c:forEach items="${list}" var="i">
										<option value="${i.code}">${i.name}(${i.model})</option>
									</c:forEach>
								</c:if>
							</select>
						</div>
					</div>
				</div>

				<!-- 입력 구간 -->
				<div class="row">
					<div class="col-sm-12 mb-3">
						<!-- examples -->
						<div class="form-group">
							<div class="row">
								<div class="form-group">
									<label>보전 결과</label> <input class="form-control" type="text" placeholder="Johnny Brown">
								</div>
								<div class="form-group">
									<label>상세 내용</label>
									<textarea class="form-control" name="mt_content"></textarea>
								</div>
							</div>
						</div>
						<!-- examples end -->
					</div>
				</div>
				<!-- 입력 구간 -->
				<!-- 버튼 -->
				<div class="row">
					<div class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
						<button type="button" class="btn btn-secondary" onclick="closePopup();">
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
	<%@ include file="../../../include/footer.jsp"%>
	<script type="text/javascript">
		$(document).ready(function(){
			window.resizeTo(outerWidth - innerWidth + 500, outerHeight - innerHeight + $(".login-box").outerHeight() + 12);
		});
	</script>
</body>
</html>