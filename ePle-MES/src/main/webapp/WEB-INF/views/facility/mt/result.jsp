<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../../include/head.jsp"%>
<title>보전 결과</title>
</head>
<body>
<c:if test="${(sessionScope.id != 'admin' or sessionScope.id eq null) and (sessionScope.dep_group != '설비')}">
	<c:redirect url="/" />
</c:if>
	<!-- 직원의 경우 사후보전만 실시 -->

	<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10">
			<button type="button" class="close" onclick="closePopup();">×</button>
			<!-- 타이틀 -->
			<div class="login-title">
				<h1 class="text-center text-primary">보전 결과</h1>
			</div>
			<div class="faq-wrap">
				<div id="accordion">
					<div class="card">
						<div class="card-header">
							<button class="btn btn-block" data-toggle="collapse"
								data-target="#faq1">기본 정보</button>
						</div>
						<div id="faq1" class="collapse show" data-parent="#accordion">
							<div class="card-body">
								<ul class="list-group">
									<li class="list-group-item"><b>등록일</b><br>
									<fmt:formatDate value="${info.reg_date}" type="both" /></li>
									<li class="list-group-item"><b>제목</b><br>${info.mt_subject}</li>
									<li class="list-group-item"><b>내용</b><br>${info.mt_content}</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="pd-20">
				<!-- 폼 -->
				<form method="post" action="/facility/mt/result">

					<!-- 입력 구간 -->
					<div class="row">
						<div class="col-sm-12 mb-3">
							<!-- hidden -->
							<input type="hidden" name="code" value="${info.code}">
							<!-- examples -->
							<div class="form-group">
								<label><b>제목</b></label> <input class="form-control"
									name="res_info" type="text" placeholder="내용 입력">
							</div>
							<div class="form-group">
								<label><b>결과</b></label><br>
								<div class="btn-group btn-group-toggle" data-toggle="buttons">
									<label class="btn btn-outline-secondary active"> <input
										type="radio" name="code_id" value="BM" id="option1"
										autocomplete="off" checked> 보전 완료
									</label> <label class="btn btn-outline-secondary"> <input
										type="radio" name="code_id" value="CM" id="option2"
										autocomplete="off"> 개량 처리
									</label>
								</div>
							</div>
							<div class="form-group">
								<label><b>상세 내용</b></label>
								<textarea class="form-control" name="res_content"></textarea>
							</div>
							<!-- examples end -->
						</div>
					</div>
					<!-- 입력 구간 -->

					<!-- 버튼 -->
					<div class="row">
						<div
							class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
							<button type="button" class="btn btn-secondary"
								onclick="history.back();">
								<b>이전</b>
							</button>
							<button type="submit" class="btn btn-success">
								<b>등록</b>
							</button>
						</div>
					</div>
					<!-- 버튼 -->
				</form>
				<!-- 폼 -->
			</div>
		</div>
	</div>
	<!-- 콘텐츠 끝> -->
	<%@ include file="../../include/footer.jsp"%>
</body>
</html>