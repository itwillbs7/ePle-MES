<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	String today = dateFormat.format(new Date());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../../include/head.jsp"%>
<title>설비 수정</title>
</head>
<body>
	<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10">
			<button type="button" class="close" onclick="closePopup();">×</button>
			<!-- 타이틀 -->
			<div class="login-title">
				<h1 class="text-center text-primary">설비 수정</h1>
			</div>
			<div class="tab-pane fade active show" id="production" role="tabpanel">
				<form method="post" action="/facility/info/update" id="pro-form">
					<div class="pd-20">
						<div class="col-sm-12 mb-3">
							<input type="hidden" name="group_id" value="${info.group_id}">
							<input type="hidden" name="code" value="${code}">
							<div class="form-group">
								<label><b>물품 종류</b></label> <select class="form-control" name="code_id" required>
									<option>선택</option>
									<c:choose>
										<c:when test="${info.group_id eq 'FACPRO'}">
											<c:forEach items="${proList}" var="i">
												<c:choose>
													<c:when test="${info.group_id eq 'FACPRO' and info.code_id eq i.code_id}">
														<option value="${i.code_id}" selected>${i.code_name}</option>
													</c:when>
													<c:otherwise>
														<option value="${i.code_id}">${i.code_name}</option>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</c:when>
										<c:when test="${info.group_id eq 'FACNPR'}">
											<c:forEach items="${nprList}" var="i">
												<c:choose>
													<c:when test="${info.group_id eq 'FACNPR' and info.code_id eq i.code_id}">
														<option value="${i.code_id}" selected>${i.code_name}</option>
													</c:when>
													<c:otherwise>
														<option value="${i.code_id}">${i.code_name}</option>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</c:when>
										<c:when test="${info.group_id eq 'FACETC'}">
											<c:forEach items="${etcList}" var="i">
												<c:choose>
													<c:when test="${info.group_id eq 'FACETC' and info.code_id eq i.code_id}">
														<option value="${i.code_id}" selected>${i.code_name}</option>
													</c:when>
													<c:otherwise>
														<option value="${i.code_id}">${i.code_name}</option>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</c:when>
									</c:choose>
								</select>
							</div>
							<div class="form-group">
								<label><b>모델명</b></label> <input class="form-control" type="text" name="model" required value="${info.model}">
							</div>
							<div class="form-group">
								<label><b>이름</b></label> <input class="form-control" type="text" name="name" required value="${info.name}">
							</div>
							<div class="form-group">
								<label><b>구매 일자</b></label> <input class="form-control date-picker" type="text" name="purchase_date" required max="<%=today%>" value="${info.purchase_date}">
							</div>
							<div class="form-group">
								<label><b>구매 금액</b></label> <input class="form-control" type="number" name="inprice" value="${info.inprice}" required min="1000" max="100000000" step="1000" oninput="{(e:any) ->{if(e.target.value > 0){if(e.target.value > 100000000) e.target.value = 99999999;}else{e.target.value = 1;}}}">
							</div>
							<c:if test="${info.group_id eq 'FACPRO'}">
								<div class="form-group">
									<label><b>시간당 생산량</b></label> <input class="form-control" type="number" name="uph" value="${info.uph}" required min="1" max="10000000" oninput="{(e:any) ->{if(e.target.value > 0){if(e.target.value > 10000000) e.target.value = 10000000;}else{e.target.value = 1;}}}">
								</div>
							</c:if>
							<div class="form-group">
								<label><b>라인 정보</b></label> <select class="form-control" name="line_code">
									<option>선택</option>
									<option value="None">없음</option>
									<c:forEach items="${line}" var="i">
										<c:choose>
											<c:when test="${info.line_code == i.line_code}">
												<option value="${i.line_code}" selected>${i.line_name}</option>
											</c:when>
											<c:otherwise>
												<option value="${i.line_code}">${i.line_name}</option>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</select>
							</div>
							<div class="form-group">
								<label><b>사용 상태</b></label><br>
								<c:choose>
									<c:when test="${info.active}">
										<input type="checkbox" name="active" checked value="true" class="switch-btn" data-color="#0099ff" />
									</c:when>
									<c:otherwise>
										<input type="checkbox" name="active" value="true" class="switch-btn" data-color="#0099ff" />
									</c:otherwise>
								</c:choose>
								
							</div>
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
			<!-- 폼 -->
		</div>
	</div>
	<!-- 콘텐츠 끝 -->
	<%@ include file="../../include/footer.jsp"%>
</body>
</html>