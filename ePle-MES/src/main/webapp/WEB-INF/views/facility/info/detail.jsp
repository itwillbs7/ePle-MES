<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<%@ include file="../../include/head.jsp"%>
<title>설비 상세 정보</title>
</head>
<body>
	<!-- 공통, css 및 js 추가 시 /include/header, footer에서 삽입 -->
	<%@ include file="../../include/header.jsp"%>
	<%@ include file="../../include/right-side-bar.jsp"%>
	<%@ include file="../../include/left-side-bar.jsp"%>
	<!-- 메인 컨테이너 -->
	<div class="main-container">
		<div class="pd-ltr-20 xs-pd-20-10">
			<div class="min-height-200px">
				<div class="title" style="margin-bottom: 10px;">
					<h1>설비 상세 정보</h1>
				</div>
				<div class="container pd-0">
					<div class="row">
						<div class="col-md-12 col-sm-12">
							<div class="blog-detail card-box overflow-hidden mb-30">
								<div class="blog-img">
									<!-- 업로드된 이미지 표시 -->
									<img src="${pageContext.request.contextPath}/resource/vendors/images/img2.jpg" alt="">
								</div>
								<div class="blog-caption">
									<h4 class="mb-10">Lorem ipsum dolor sit amet, consectetur adipisicing elit</h4>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo</p>
									<h5 class="mb-10">Lorem ipsum dolor sit amet, consectetur.</h5>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
									<h5 class="mb-10">Unordered List</h5>
									<ul>
										<li>Duis aute irure dolor in reprehenderit in voluptate.</li>
										<li>Sunt in culpa qui officia deserunt mollit anim id est laborum.</li>
										<li>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.</li>
										<li>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</li>
										<li>Duis aute irure dolor in reprehenderit in voluptate.</li>
										<li>Sunt in culpa qui officia deserunt mollit anim id est laborum.</li>
										<li>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.</li>
										<li>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</li>
									</ul>
									<h5 class="mb-10">Ordered List</h5>
									<ol>
										<li>Duis aute irure dolor in reprehenderit in voluptate.</li>
										<li>Sunt in culpa qui officia deserunt mollit anim id est laborum.</li>
										<li>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.</li>
										<li>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</li>
										<li>Duis aute irure dolor in reprehenderit in voluptate.</li>
										<li>Sunt in culpa qui officia deserunt mollit anim id est laborum.</li>
										<li>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.</li>
										<li>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</li>
									</ol>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 푸터 -->
				<%@ include file="../../include/github.jsp"%>
				<%@ include file="../../include/footer.jsp"%>
			</div>
		</div>
	</div>
</body>
</html>