<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	String today = dateFormat.format(new Date());
%>
<html>
<head>
<%@ include file="../../include/head.jsp"%>
<title>설비 상태</title>
</head>
<body>
	<!-- 공통, css 및 js 추가 시 /include/header, footer에서 삽입 -->
	<%@ include file="../../include/header.jsp"%>
	<%@ include file="../../include/right-side-bar.jsp"%>
	<%@ include file="../../include/left-side-bar.jsp"%>
	<!-- 메인 컨테이너 -->
	<div class="main-container">
		<div class="pd-ltr-20 xs-pd-20-10">
			<div class="title mb-30">
				<h1>설비 상태</h1>
			</div>
			<div class="pd-20 mb-20 card-box">
				<div class="tab">
					<ul class="nav nav-pills" role="tablist">
						<li class="nav-item"><a class="nav-link text-blue active" data-toggle="tab" href="#home5" role="tab" aria-selected="true">이상 없음</a></li>
						<li class="nav-item"><a class="nav-link text-blue" data-toggle="tab" href="#profile5" role="tab" aria-selected="false">이상 있음</a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane fade active show" id="home5" role="tabpanel">
							<div class="pd-20">
								<div class="table-responsive">
									<table class="table table-striped">
										<thead>
											<tr><td></td></tr>
										</thead>
										<tbody>
											<tr class="table-active">
												<td></td>
											</tr>
											<tr class="table-primary">
												<td></td>
											</tr>
											<tr class="table-secondary">
												<td></td>
											</tr>
											<tr class="table-success">
												<td></td>
											</tr>
											<tr class="table-danger">
												<td></td>
											</tr>
											<tr class="table-warning">
												<td></td>
											</tr>
											<tr class="table-info">
												<td></td>
											</tr>
											<tr class="table-light">
												<td></td>
											</tr>
											<tr class="table-dark">
												<td></td>
											</tr>
										</tbody>
									</table>
								</div>

							</div>
						</div>
						<div class="tab-pane fade" id="profile5" role="tabpanel">
							<div class="pd-20">
								<div class="table-responsive">
									<table class="table table-striped">
										<thead>
											<tr><td></td></tr>
										</thead>
										<tbody>
											<tr class="table-active">
												<td></td>
											</tr>
											<tr class="table-primary">
												<td></td>
											</tr>
											<tr class="table-secondary">
												<td></td>
											</tr>
											<tr class="table-success">
												<td></td>
											</tr>
											<tr class="table-danger">
												<td></td>
											</tr>
											<tr class="table-warning">
												<td></td>
											</tr>
											<tr class="table-info">
												<td></td>
											</tr>
											<tr class="table-light">
												<td></td>
											</tr>
											<tr class="table-dark">
												<td></td>
											</tr>
										</tbody>
									</table>
								</div>

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
</body>
</html>