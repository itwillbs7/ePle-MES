<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../../include/head.jsp"%>
<title>신청 삭제</title>
</head>
<body>
	<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10">
		<button type="button" class="close" onclick="closePopup();">×</button>
			<!-- 타이틀 -->
			<div class="login-title">
				<h1 class="text-center text-primary">신청 삭제</h1>
				<h3 class="text-center">삭제 하시겠습니까?</h3>
			</div>
			<!-- 폼 -->
			<form action="/facility/mt/delete" method="post">
				<input type="hidden" name="code" value="${code}">
				<!-- 삭제 리스트 목록 -->
				<!-- 버튼 -->
				<div class="row">
					<div
						class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
						<button type="button" class="btn btn-secondary"
							onclick="closePopup();">
							<b>취소</b>
						</button>
						<button type="submit" class="btn btn-danger">
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
	<%@ include file="../../include/footer.jsp"%>
	<script type="text/javascript">
		// get으로 불러온 인덱스가 있는 경우 인덱스 우선 진행
		var del = "<c:out value='${code}'/>";
		if(del == null || del == ''){
			closePopup();
		}
		else {
				window.resizeTo(outerWidth - innerWidth + 500, outerHeight - innerHeight + $(".login-box").outerHeight() + 12);
		}
	</script>
</body>
</html>