<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../../include/head.jsp"%>
<title>설비 상태</title>
</head>
<body>
<body>
	<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10">
			<button type="button" class="close" onclick="closePopup();">×</button>
			<!-- 타이틀 -->
			<div class="login-title">
				<h1 class="text-center text-primary">설비 상태</h1>
			</div>
			<div class="tab">
				<ul class="nav nav-pills" role="tablist">
					<li class="nav-item"><a class="nav-link text-blue active" data-toggle="tab" href="#info" role="tab" aria-selected="true">기본 정보</a></li>
					<li class="nav-item"><a class="nav-link text-blue" data-toggle="tab" href="#order" role="tab" aria-selected="false">보전 신청 목록</a></li>
					<li class="nav-item"><a class="nav-link text-blue" data-toggle="tab" href="#result" role="tab" aria-selected="false">보전 내역</a></li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane fade active show" id="info" role="tabpanel">
						<div class="pd-20">
							<!-- 정보 조회 -->
							<table class="table table-striped">
								<tr>
									<th>모델</th>
									<td>${info.model}</td>
									<th>이름</th>
									<td>${info.name}</td>
								</tr>
								<tr>
									<th>카테고리</th>
									<td>${info.group_name}</td>
									<th>사용 상태</th>
									<td><c:choose>
											<c:when test="${info.active}">
												<span class="badge badge-success">사용 중</span>
											</c:when>
											<c:otherwise>
												<span class="badge badge-secondary">미사용</span>
											</c:otherwise>
										</c:choose></td>
								</tr>
								<tr>
									<th>구매 일자</th>
									<td><fmt:formatDate value="${info.purchase_date}" dateStyle="full" /></td>
									<th>구매 금액</th>
									<td><fmt:formatNumber value="${info.inprice}" type="currency" /></td>
								</tr>
								<tr>
									<th>라인 코드</th>
									<td>${info.line_code}</td>
									<th>제조사</th>
									<td>${info.client_code}</td>
								</tr>
							</table>
						</div>
					</div>
					<div class="tab-pane fade" id="order" role="tabpanel">
						<div class="pd-20">
							<div class="faq-wrap">
								<div id="accordion">
									<div class="mb-20">
										<h4 class="text-left">총 0건</h4>
									</div>
									<!-- foreach -->
									<div class="card">
										<div class="card-header">
											<button class="btn btn-block collapsed" data-toggle="collapse" data-target="#id1" aria-expanded="false">제목</button>
										</div>
										<div id="id1" class="collapse" data-parent="#accordion" style="">
											<div class="card-body">
												<div class="pd-20">
													<div class="row">
														<div class="col-sm-12 mb-3">
															<div class="form-group">
																<ul class="list-group">
																	<li class="list-group-item">aa</li>
																</ul>
															</div>
														</div>
													</div>
												</div>
												<!-- 버튼 -->
												<div class="row">
													<div class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
														<button type="button" class="btn btn-success">
															<b>결과 등록</b>
														</button>
													</div>
												</div>
												<!-- 버튼 -->
											</div>
										</div>
									</div>
									<!-- foreach -->

								</div>
							</div>
						</div>
					</div>
					<div class="tab-pane fade" id="result" role="tabpanel">
						<div class="pd-20">
							<div class="faq-wrap">
								<div id="accordion">
									<!-- foreach -->
									<div class="card">
										<div class="card-header">
											<button class="btn btn-block collapsed" data-toggle="collapse" data-target="#faq1" aria-expanded="false">
												<h4>예방 보전 (총 0건)</h4>
											</button>
										</div>
										<div id="faq1" class="collapse" data-parent="#accordion" style="">
											<div class="card-body">
												<div class="pd-20">
													<div class="row">
														<div class="col-sm-12 mb-3">
															<div class="form-group">
																<ul class="list-group">
																	<li class="list-group-item">aa</li>
																</ul>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<!-- foreach -->

									<!-- foreach -->
									<div class="card">
										<div class="card-header">
											<button class="btn btn-block collapsed" data-toggle="collapse" data-target="#faq2" aria-expanded="false">
												<h4>사후 보전 (총 0건)</h4>
											</button>
										</div>
										<div id="faq2" class="collapse" data-parent="#accordion" style="">
											<div class="card-body">
												<div class="pd-20">
													<div class="row">
														<div class="col-sm-12 mb-3">
															<div class="form-group">
																<ul class="list-group">
																	<li class="list-group-item">aa</li>
																</ul>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<!-- foreach -->

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 콘텐츠 끝> -->
	<%@ include file="../../include/footer.jsp"%>
</body>
</html>