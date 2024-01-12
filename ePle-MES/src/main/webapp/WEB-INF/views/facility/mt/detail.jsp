<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
					<li class="nav-item"><a class="nav-link text-blue active"
						data-toggle="tab" href="#info" role="tab" aria-selected="true">기본
							정보</a></li>
					<li class="nav-item"><a class="nav-link text-blue"
						data-toggle="tab" href="#order" role="tab" aria-selected="false">보전
							신청 목록</a></li>
					<li class="nav-item"><a class="nav-link text-blue"
						data-toggle="tab" href="#result" role="tab" aria-selected="false">보전
							내역</a></li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane fade active show" id="info" role="tabpanel">
						<div class="pd-20">
							<!-- 정보 조회 -->
							<div class="col-sm-12 mb-3">
								<div class="form-group">
									<ul class="list-group">
										<li class="list-group-item"><b>코드</b><br>${info.code}</li>
										<li class="list-group-item"><b>모델</b><br>${info.model}</li>
										<li class="list-group-item"><b>이름</b><br>${info.mapd.name}</li>
										<li class="list-group-item"><b>카테고리</b><br>${info.group_name}</li>
										<li class="list-group-item"><b>상태</b><br> <c:choose>
												<c:when test="${info.active}">
													<span class="badge badge-success">사용 중</span>
												</c:when>
												<c:otherwise>
													<span class="badge badge-secondary">미사용</span>
												</c:otherwise>
											</c:choose></li>
										<li class="list-group-item"><b>구매 일자</b><br> <fmt:formatDate
												value="${info.date}" dateStyle="full" /></li>
										<li class="list-group-item"><b>구매 금액</b><br> <fmt:formatNumber
												value="${info.mapd.inprice}" type="currency" /></li>
										<li class="list-group-item"><b>라인</b><br>${info.line_name}</li>
									</ul>
								</div>
							</div>
						</div>
						<!-- 버튼 -->
						<div class="row">
							<div
								class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
								<button type="button" class="btn btn-success"
									onclick="openPage('/facility/mt/routine?code=${info.code}', 500, 600)">
									<b>보전 등록</b>
								</button>
							</div>
						</div>
						<!-- 버튼 -->
					</div>
					<div class="tab-pane fade" id="order" role="tabpanel">
						<div class="pd-20">
							<div class="faq-wrap">
								<div id="accordion">
									<div class="mb-20">
										<h4 class="text-left">총 ${orderCount}건</h4>
									</div>

									<c:choose>
										<c:when test="${orderCount eq 0 }">
											<h5 class="text-center">등록된 보전 신청이 없습니다.</h5>
										</c:when>
										<c:otherwise>
											<c:forEach items="${order}" var="i">
												<!-- foreach -->
												<div class="card">
													<div class="card-header">
														<button class="btn btn-block collapsed"
															data-toggle="collapse" data-target="#${i.code}"
															aria-expanded="false">제목 : ${i.mt_subject}</button>
													</div>
													<div id="${i.code}" class="collapse"
														data-parent="#accordion" style="">
														<div class="card-body">
															<div class="pd-20">
																<div class="row">
																	<div class="col-sm-12 mb-3">
																		<div class="form-group">
																			<ul class="list-group">
																				<li class="list-group-item"><b>등록일</b><br>
																					<fmt:formatDate value="${i.reg_date}" type="both" /></li>
																				<li class="list-group-item"><b>내용</b><br>${i.mt_content}</li>
																			</ul>
																		</div>
																	</div>
																</div>
															</div>
															<!-- 버튼 -->
															<div class="row">
																<div
																	class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
																	<button type="button" class="btn btn-success"
																		onclick="openPage('/facility/mt/result?code=${i.code}', 500, 600)">
																		<b>결과 등록</b>
																	</button>
																</div>
															</div>
															<!-- 버튼 -->
														</div>
													</div>
												</div>
												<!-- foreach -->
											</c:forEach>
										</c:otherwise>
									</c:choose>
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
											<button class="btn btn-block collapsed"
												data-toggle="collapse" data-target="#faq1"
												aria-expanded="false">
												<h4>예방 보전 (총 ${routineCount}건)</h4>
											</button>
										</div>
										<div id="faq1" class="collapse" data-parent="#accordion"
											style="">
											<div class="card-body">
												<div class="pd-20">
													<div class="row">
														<div class="col-sm-12 mb-3">
															<div class="form-group">
																<ul class="list-group">
																	<c:choose>
																		<c:when test="${routineCount eq 0}">
																			<li class="list-group-item text-center"><b>내역이
																					없습니다.</b></li>
																		</c:when>
																		<c:otherwise>
																			<c:forEach items="${routine}" var="i">
																				<li class="list-group-item"><b>등록일 : </b> <fmt:formatDate
																						value="${i.reg_date}" type="date" /><br> <b>제목
																						: </b>${i.mt_subject}<br> <b>내용 : </b>${i.mt_content}</li>
																			</c:forEach>
																		</c:otherwise>
																	</c:choose>
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
											<button class="btn btn-block collapsed"
												data-toggle="collapse" data-target="#faq2"
												aria-expanded="false">
												<h4>사후 보전 (총 ${resultCount}건)</h4>
											</button>
										</div>
										<div id="faq2" class="collapse" data-parent="#accordion"
											style="">
											<div class="card-body">
												<div class="pd-20">
													<div class="row">
														<div class="col-sm-12 mb-3">
															<div class="form-group">
																<ul class="list-group">
																	<c:choose>
																		<c:when test="${resultCount eq 0}">
																			<li class="list-group-item text-center"><b>내역이
																					없습니다.</b></li>
																		</c:when>
																		<c:otherwise>
																			<c:forEach var="i" items="${result}">
																				<li class="list-group-item"><b>완료일 : </b> <fmt:formatDate
																						value="${i.comp_date}" type="date" /><br> <b>제목
																						: </b>${i.mt_subject}<br> <b>내용 : </b>${i.mt_content}</li>
																			</c:forEach>
																		</c:otherwise>
																	</c:choose>
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