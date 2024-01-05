<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../../include/head.jsp"%>
<title>발주 수정</title>
</head>
<body>
<body>
		<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10">
		<button type="button" class="close" onclick="window.close();">×</button>
			<!-- 타이틀 -->
			<div class="login-title">
				<h1 class="text-center text-primary">발주 수정</h1>
			</div>
			<div class="tab">
				<ul class="nav nav-pills" role="tablist">
					<c:choose>
						<c:when test="${info.group_id eq 'FACPRO'}">
							<li class="nav-item"><a class="nav-link text-blue active" data-toggle="tab" href="#production" role="tab" aria-selected="true">생산</a></li>
							<li class="nav-item"><a class="nav-link text-blue" data-toggle="tab" href="#non-production" role="tab" aria-selected="false">비생산</a></li>
							<li class="nav-item"><a class="nav-link text-blue" data-toggle="tab" href="#etc" role="tab" aria-selected="false">기타</a></li>
						</c:when>
						<c:when test="${info.group_id eq 'FACNPR'}">
							<li class="nav-item"><a class="nav-link text-blue" data-toggle="tab" href="#production" role="tab" aria-selected="false">생산</a></li>
							<li class="nav-item"><a class="nav-link text-blue active" data-toggle="tab" href="#non-production" role="tab" aria-selected="true">비생산</a></li>
							<li class="nav-item"><a class="nav-link text-blue" data-toggle="tab" href="#etc" role="tab" aria-selected="false">기타</a></li>
						</c:when>
						<c:when test="${info.group_id eq 'FACETC'}">
							<li class="nav-item"><a class="nav-link text-blue" data-toggle="tab" href="#production" role="tab" aria-selected="false">생산</a></li>
							<li class="nav-item"><a class="nav-link text-blue" data-toggle="tab" href="#non-production" role="tab" aria-selected="false">비생산</a></li>
							<li class="nav-item"><a class="nav-link text-blue active" data-toggle="tab" href="#etc" role="tab" aria-selected="true">기타</a></li>
						</c:when>
					</c:choose>
				</ul>
				<div class="tab-content">
					<div class="tab-pane fade active show" id="production" role="tabpanel">
						<form method="post" id="pro-form">
							<div class="pd-20">
								<div class="col-sm-12 mb-3">
									<!-- examples -->
									<div class="form-group">
										<label>사원 번호</label> <input class="form-control" type="text" name="update_emp" readonly value="2">
									</div>
									<div class="form-group">
										<input type="hidden" name="group_id" value="FACPRO">
										<label>물품 종류</label> <select class="form-control" name="code_id" required>
											<option>선택</option>
											<c:forEach items="${proList}" var="i">
												<c:choose>
													<c:when test="${info.group_id eq 'FACPRO' and info.code_id eq i.code_id}">
														<option value="${i.code_id}" selected>${i.code_name}</option>
													</c:when>
													<c:otherwise><option value="${i.code_id}">${i.code_name}</option></c:otherwise>
												</c:choose>
											</c:forEach>
										</select>
									</div>
									<div class="form-group">
										<label>수량</label> <input class="form-control" type="number" value="${info.amount}" name="amount" required min="1" max="100"  oninput="{(e:any) ->{if(e.target.value > 0){if(e.target.value > 100) e.target.value = 99;}else{e.target.value = 1;}}}">
									</div>
									<!-- examples end -->
								</div>
							</div>
							<!-- 버튼 -->
							<div class="row">
								<div class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
									<button type="button" class="btn btn-secondary" onclick="window.close();">
										<b>취소</b>
									</button>
									<button type="submit" class="btn btn-success">
										<b>등록</b>
									</button>
								</div>
							</div>
							<!-- 버튼 -->
						</form>
					</div>
					<div class="tab-pane fade" id="non-production" role="tabpanel">
						<form method="post" id="nonpro-form">
							<div class="pd-20">
								<div class="col-sm-12 mb-3">
									<input type="hidden" name="group_id" value="FACNPR">
									<!-- examples -->
									<div class="form-group">
										<label>사원 번호</label> <input class="form-control" readonly type="text" name="update_emp" value="2">
									</div>
									<div class="form-group">
										<label>물품 종류</label> <select class="form-control" name="code_id" required>
											<option>선택</option>
											<c:forEach items="${nprList}" var="i">
												<c:choose>
													<c:when test="${info.group_id eq 'FACNPR' and info.code_id eq i.code_id}">
														<option value="${i.code_id}" selected>${i.code_name}</option>
													</c:when>
													<c:otherwise><option value="${i.code_id}">${i.code_name}</option></c:otherwise>
												</c:choose>
											</c:forEach>
										</select>
									</div>
									<div class="form-group">
										<label>수량</label> <input class="form-control" type="number" name="amount" value="${info.amount}" required min="1" max="100" oninput="{(e:any) ->{if(e.target.value > 0){if(e.target.value > 100) e.target.value = 99;}else{e.target.value = 1;}}}">
									</div>
									<!-- examples end -->
								</div>
							</div>
							<!-- 버튼 -->
							<div class="row">
								<div class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
									<button type="button" class="btn btn-secondary" onclick="closePopup();">
										<b>취소</b>
									</button>
									<button type="submit" class="btn btn-success">
										<b>등록</b>
									</button>
								</div>
							</div>
							<!-- 버튼 -->
						</form>
					</div>
					<div class="tab-pane fade" id="etc" role="tabpanel">
						<form method="post" id="etc-form">
							<div class="pd-20">
								<div class="col-sm-12 mb-3">
								<input type="hidden" name="group_id" value="FACETC">
									<!-- examples -->
									<div class="form-group">
										<label>사원 번호</label> <input class="form-control" readonly type="text" name="update_emp" value="2">
									</div>
									<div class="form-group">
										<label>물품 종류</label> <select class="form-control" name="code_id" required>
											<option>선택</option>
											<c:forEach items="${etcList}" var="i">
												<c:choose>
													<c:when test="${info.group_id eq 'FACETC' and info.code_id eq i.code_id}">
														<option value="${i.code_id}" selected>${i.code_name}</option>
													</c:when>
													<c:otherwise><option value="${i.code_id}">${i.code_name}</option></c:otherwise>
												</c:choose>
											</c:forEach>
										</select>
									</div>
									<div class="form-group">
										<label>수량</label> <input class="form-control" type="number" name="amount" value="${info.amount}" required min="1" max="100"  oninput="{(e:any) ->{if(e.target.value > 0){if(e.target.value > 100) e.target.value = 99;}else{e.target.value = 1;}}}">
									</div>
									<!-- examples end -->
								</div>
							</div>
							<!-- 버튼 -->
							<div class="row">
								<div class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
									<button type="button" class="btn btn-secondary" onclick="window.close();">
										<b>취소</b>
									</button>
									<button type="submit" class="btn btn-success">
										<b>등록</b>
									</button>
								</div>
							</div>
							<!-- 버튼 -->
						</form>
					</div>
				</div>
			</div>
			<!-- 폼 -->
		</div>
	</div>
	<!-- 콘텐츠 끝 -->
	<%@ include file="../../include/footer.jsp"%>
	<script type="text/javascript">
		$(document).ready(function(){
			window.resizeTo(outerWidth - innerWidth + 500, outerHeight - innerHeight + $(".login-box").outerHeight() + 13);
		});
	</script>
</body>
</html>