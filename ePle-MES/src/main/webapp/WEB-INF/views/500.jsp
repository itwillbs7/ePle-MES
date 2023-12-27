<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<%@ include file="include/head.jsp"%>
	</head>
	<body>
		<div
			class="error-page d-flex align-items-center flex-wrap justify-content-center pd-20"
		>
			<div class="pd-10">
				<div class="error-page-wrap text-center">
					<h1>500</h1>
					<h3>오류: 500 요청이 처리되지 않았습니다!</h3>
					<h5></h5>
					<div class="pt-20 mx-auto max-width-200">
						<a href="/" class="btn btn-primary btn-block btn-lg"
							>메인 페이지로</a
						>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="include/footer.jsp"%>
	</body>
</html>