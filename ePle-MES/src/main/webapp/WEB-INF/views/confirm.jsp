<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="include/head.jsp"%>
<title>결과</title>
</head>
<body>
	<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10">
			<!-- 타이틀 -->
			<div class="login-title">
				<h1 class="text-center text-primary">${title}</h1>
				<h4 class="text-center">${result}</h4>
			</div>

			<!-- 버튼 -->
			<div class="row">
				<div class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
					<button type="button" class="btn btn-block btn-primary" onclick="window.close();">
						<b>닫기</b>
					</button>
				</div>
			</div>
			<!-- 버튼 -->
		</div>
	</div>
	<!-- 콘텐츠 끝 -->
	<%@ include file="include/footer.jsp"%>
	<!-- 
	가로 500px
	세로 258px
	 -->
	<script type="text/javascript">
		$(document).ready(function(){
			window.resizeTo(outerWidth - innerWidth + 500, outerHeight - innerHeight + $(".login-box").outerHeight() + 11);
		});
	</script>
</body>
</html>