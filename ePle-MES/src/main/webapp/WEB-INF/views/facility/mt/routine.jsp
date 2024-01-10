<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../../include/head.jsp"%>
<title>일상 보전 등록</title>
</head>
<body>
	<!-- 직원의 경우 사후보전만 실시 -->

	<!-- 콘텐츠 시작 -->
	<div class="modal-content">
			<div class="login-title">
				<h1 class="text-center text-primary">일상 보전 등록</h1>
			</div>
			<div class="pd-20">
				<!-- 폼 -->
				<form method="post" action="/facility/mt/routine">

					<!-- 입력 구간 -->
					<div class="row">
						<div class="col-sm-12 mb-3">
							<!-- hidden -->
							<input type="hidden" name="code" value="MT">
							<input type="hidden" name="fac_code" value="${code}">
							<!-- examples -->
							<div class="form-group">
								<label><b>제목</b></label> <input class="form-control"
									name="mt_subject" type="text" placeholder="내용 입력">
							</div>
							<input type="hidden" name="code_id" value="PM">
							<div class="form-group">
								<label><b>상세 내용</b></label>
								<textarea class="form-control" name="mt_content"></textarea>
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
								onclick="history.back();">
								<b>이전</b>
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
	</div>
	<!-- 콘텐츠 끝> -->
	<%@ include file="../../include/footer.jsp"%>
</body>
</html>