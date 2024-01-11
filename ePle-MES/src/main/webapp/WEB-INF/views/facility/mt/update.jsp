<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../../include/head.jsp"%>
<title>보전 신청 수정</title>
</head>
<body>
	<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10">
			<button type="button" class="close" onclick="closePopup();">×</button>
			<div class="pd-20">
				<!-- 타이틀 -->
				<div class="login-title">
					<h1 class="text-center text-primary">보전 신청 수정</h1>
				</div>
				<form method="post" action="/facility/mt/update">
					<!-- 입력 구간 -->
					<div class="row">
						<div class="col">
							<!-- examples -->
							<input type="hidden" name="code" value="${info.code}">
							<div class="form-group">
								<label><b>사유</b></label> <input class="form-control" name="mt_subject" value="${info.mt_subject}" type="text" placeholder="사유 입력">
							</div>
							<div class="form-group">
								<label><b>상세 내용</b></label>
								<textarea class="form-control" name="mt_content">${info.mt_content}</textarea>
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
			</div>
		</div>
		<!-- 콘텐츠 끝> -->
		<%@ include file="../../include/footer.jsp"%>
	</div>
</body>
</html>