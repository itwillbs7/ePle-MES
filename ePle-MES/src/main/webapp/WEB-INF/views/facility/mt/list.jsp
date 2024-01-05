<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../../include/head.jsp"%>
<title>보전 신청 목록</title>
</head>
<body>
	<!-- 직원의 보전 신청 내역, 완료된 건 표시x -->
	<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10">
			<button type="button" class="close" onclick="window.close();">×</button>
			<div class="pd-20">
				<!-- 타이틀 -->
				<div class="login-title">
					<h1 class="text-center text-primary">보전 신청 목록</h1>
					<h4 class="text-center">총 개수 : 0개</h4>
				</div>
				<div class="faq-wrap">
					<div id="accordion">
					
						<!-- foreach -->
						<div class="card">
							<div class="card-header">
								<button class="btn btn-block collapsed" data-toggle="collapse" data-target="#faq1" aria-expanded="false">Collapsible Group Item #1</button>
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
									<!-- 버튼 -->
									<div class="row">
										<div class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
											<button type="button" class="btn btn-warning">
												<b>수정</b>
											</button>
											<button type="button" class="btn btn-danger">
												<b>삭제</b>
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
		<!-- 콘텐츠 끝> -->
		<%@ include file="../../include/footer.jsp"%>
	</div>
</body>
</html>