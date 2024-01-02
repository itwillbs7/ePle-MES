<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<%@ include file="../../include/head.jsp"%>
<title>보전 상세 정보</title>
</head>
<body>
<!-- 
	보전 상세
	관리자(Manager)의 경우 라인을 멈추고 설비 보전을 작업할 수 있도록 함
 -->
	<!-- 공통, css 및 js 추가 시 /include/header, footer에서 삽입 -->
	<%@ include file="../../include/header.jsp"%>
	<%@ include file="../../include/right-side-bar.jsp"%>
	<%@ include file="../../include/left-side-bar.jsp"%>
	<!-- 메인 컨테이너 -->
	<div class="main-container">
		<div class="pd-ltr-20 xs-pd-20-10">
			<div class="min-height-200px">
				<div class="title" style="margin-bottom: 10px;">
					<h1>보전 상세 정보</h1>
				</div>
				<div class="pd-20 card-box mb-30">
					<h4 class="h4 text-blue mb-10">Getting Started</h4>
					<div class="alert alert-primary" role="alert">Note: we recomonded you to please make your one own css file &amp; one js files and add that in your page, so whenever the update of Severny admin comes it does not affect your code.</div>
					<div class="alert alert-danger" role="alert">If you are using css then no need to follow below steps. Just go to the index.html and open that file in to the browser for desire output.</div>
					<div class="alert alert-danger" role="alert">If you are using scss and package managing then we have compilation tool (gulp) for that please follow the below steps.</div>
					<div>
						<ul class="list-group list-group-flush">
							<li class="list-group-item pt-20 pb-20">
								<h6 class="weight-400 d-flex">
									<i class="icon-copy dw dw-checked mr-2" data-color="#1b00ff" style="color: rgb(27, 0, 255);"></i> Install Node.js From <a href="https://nodejs.org/en/download/" class="ml-2" target="_blank" data-color="#1b00ff" style="color: rgb(27, 0, 255);">https://nodejs.org/en/download/</a>
								</h6>
							</li>
							<li class="list-group-item pt-20 pb-20">
								<h6 class="weight-400 d-flex">
									<i class="icon-copy dw dw-checked mr-2" data-color="#1b00ff" style="color: rgb(27, 0, 255);"></i> After that open command promt or any other terminal and go to Package Path.
								</h6>
							</li>
							<li class="list-group-item pt-20 pb-20">
								<h6 class="weight-400 d-flex">
									<i class="icon-copy dw dw-checked mr-2" data-color="#1b00ff" style="color: rgb(27, 0, 255);"></i> Npm is a default package manager for the JavaScript runtime environment Node.js. If you've already then update once.
								</h6>
								<div class="bg-dark py-2 px-3 ml-md-4 mt-md-3 text-white rounded-lg shadow">
									<p class="mb-0">npm install --global npm@latest</p>
								</div>
								<div class="ml-md-4 mt-md-3 alert alert-success p-0">
									<div class="bg-success mb-0 text-white py-2 px-3">
										<p class="mb-0">To check weather is node succesfully install or not.</p>
									</div>
									<div class="p-3">
										<p class="mb-0 weight-500">npm --version</p>
									</div>
								</div>
							</li>
							<li class="list-group-item pt-20 pb-20">
								<h6 class="weight-400 d-flex">
									<i class="icon-copy dw dw-checked mr-2" data-color="#1b00ff" style="color: rgb(27, 0, 255);"></i> Gulp is a cross-platform, streaming task runner that lets developers automate many development tasks. To install gulp globally has inclue:
								</h6>
								<div class="bg-dark py-2 px-3 ml-md-4 mt-md-3 text-white rounded-lg shadow">
									<p class="mb-0">npm install --global gulp-cli</p>
								</div>
								<div class="ml-md-4 mt-md-3 alert alert-success p-0">
									<div class="bg-success mb-0 text-white py-2 px-3">
										<p class="mb-0">If you have previously installed gulp then remove it.</p>
									</div>
									<div class="p-3">
										<p class="mb-0 weight-500">npm rm --global gulp</p>
									</div>
								</div>
								<div class="ml-md-4 mt-md-3 alert alert-success p-0">
									<div class="bg-success mb-0 text-white py-2 px-3">
										<p class="mb-0">To check weather is gulp succesfully install or not.</p>
									</div>
									<div class="p-3">
										<p class="mb-0 weight-500">gulp --version</p>
									</div>
								</div>
							</li>
							<li class="list-group-item pt-20 pb-20">
								<h6 class="weight-400 d-flex">
									<i class="icon-copy dw dw-checked mr-2" data-color="#1b00ff" style="color: rgb(27, 0, 255);"></i> Below Command will execute all the assets(js,css) to the dist folder separately.
								</h6>
								<div class="bg-dark py-2 px-3 ml-md-4 mt-md-3 text-white rounded-lg shadow">
									<p class="mb-0">gulp</p>
								</div>
							</li>
						</ul>
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