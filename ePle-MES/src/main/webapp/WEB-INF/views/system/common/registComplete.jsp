<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../../include/head.jsp"%>
<title>추가완료</title>
</head>
<body>
	<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10">
			<!-- 타이틀 -->
			<div class="login-title">
				<h1 class="text-center text-primary">공통코드 추가완료!</h1>
			</div>
		
				<!-- 버튼 -->
				<div class="row">
					<div class="col-sm-6 mb-2 justify-content-center btn-toolbar btn-group">
						<button type="button" class="btn btn-success" onclick="closePopup();">
							<b>확인</b>
						</button>
					</div>
					
				</div>
				<!-- 버튼 -->
		</div>
	</div>
	
	<script type="text/javascript">
	
	$(document).ready(function() {
		window.resizeTo(outerWidth - innerWidth + 500, outerHeight - innerHeight + $(".login-box").outerHeight());
	});
	</script>
	
	
	<!-- 콘텐츠 끝> -->
	<%@ include file="../../include/footer.jsp"%>
</body>
</html>