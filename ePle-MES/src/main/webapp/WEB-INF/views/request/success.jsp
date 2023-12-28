<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/head.jsp"%>
<title>결과</title>
</head>
<body>
	<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10">
		<!-- 타이틀 -->
		<div class="login-title">
				<h1 class="text-center text-primary">오류</h1>
				<h4 class="text-center">${result}</h4>
		</div>
		<!-- 버튼 -->
		<div class="row">
		<div class="max-width-200 mx-auto">
				<button
					type="button"
					class="btn mb-20 btn-primary btn-block"
					id="sa-custom-position"
				>Click me</button>
		</div>
		</div>
		<!-- 버튼 -->		
		</div>
	</div>
	<!-- 콘텐츠 끝 -->
	<%@ include file="../include/footer.jsp"%>
	
</body>
</html>