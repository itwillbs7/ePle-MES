<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../../include/head.jsp"%>
<title>상세 정보</title>
</head>
<body>
<c:if test="${sessionScope.id eq null}">
	<c:redirect url="/" />
</c:if>
	<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10">
			<button type="button" class="close" onclick="closePopup();">×</button>
			<!-- 타이틀 -->
			<div class="login-title">
				<h1 class="text-center text-primary">상세 정보</h1>
			</div>
			<div class="row">
				<div class="col-sm-12 mb-3">
					<h2 class="text-center mb-10">${info.code}</h2>
					<h5 class="text-center mb-10">
						<c:choose>
							<c:when test="${info.active}">
								<span class="badge badge-success">가동 중</span>
							</c:when>
							<c:otherwise>
								<span class="badge badge-danger">정지</span>
							</c:otherwise>
						</c:choose>
					</h5>

					<table class="table table-striped">
						<tr>
							<th>이름</th>
							<td>${info.name}</td>
							<th>공정</th>
							<td>${info.process}</td>
						</tr>
						<tr>
							<th>위치</th>
							<td>${info.place}</td>
							<th>상태</th>
							<td>${info.status}</td>
						</tr>
						<tr>
							<th colspan="4" style="text-align: center;">메모</th>
						</tr>
						<tr>
							<td colspan="4" style="text-align: center;">${info.note}</td>
						</tr>
					</table>
				</div>
			</div>

			<div class="faq-wrap">
				<div id="accordion">
					<!-- foreach -->
					<div class="card">
						<div class="card-header">
							<button class="btn btn-block collapsed" data-toggle="collapse" data-target="#faq1" aria-expanded="false">
								<h4>정지 내역</h4>
							</button>
						</div>
						<div id="faq1" class="collapse" data-parent="#accordion" style="">
							<div class="card-body">
								<div class="pd-20">
									<div class="row">
										<div class="col-sm-12 mb-3">
											<div class="form-group">
												<ul class="list-group">
													<c:choose>
														<c:when test="${empty list}">
															<li class="list-group-item text-center"><b>내역이 없습니다.</b></li>
														</c:when>
														<c:otherwise>
															<c:forEach items="${list}" var="i">
																<li class="list-group-item"><b>시작 시간</b><br><fmt:formatDate value="${i.start_time}" type="both" /><br><b>종료 시간</b><br><fmt:formatDate value="${i.end_time}" type="both" /><br><br>${i.code_name}</li>
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
				</div>
			</div>

			<!-- 버튼 -->
			<div class="row">
				<div class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
					<c:choose>
						<c:when test="${info.active}">
							<button type="button" class="btn btn-danger" onclick="javascript:openPage('/facility/info/delete?code=${info.code}', 500, 600)">
								<b>정지</b>
							</button>
						</c:when>
						<c:otherwise>
							<button type="button" class="btn btn-success" onclick="javascript:openPage('/facility/info/delete?code=${info.code}', 500, 600)">
								<b>가동</b>
							</button>
						</c:otherwise>
					</c:choose>

					<button type="button" class="btn btn-info" onclick="javascript:openPage('/facility/info/delete?code=${info.code}', 500, 600)">
						<b>예약</b>
					</button>
				</div>
				<div class="col-sm-12 mb-3 justify-content-center btn-toolbar">
					<button type="button" class="btn btn-secondary btn-block" onclick="javascript:closePopup();">
						<b>닫기</b>
					</button>
				</div>
			</div>
			<!-- 버튼 -->
		</div>
	</div>
	<!-- 콘텐츠 끝> -->
	<%@ include file="../../include/footer.jsp"%>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							window.resizeTo(outerWidth - innerWidth + 500,
									outerHeight - innerHeight
											+ $(".login-box").outerHeight()
											+ 12);
						});
	</script>
</body>
</html>