<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../../include/head.jsp"%>
<title>보전 정보</title>
</head>
<body>
<body>
	<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10">
			<button type="button" class="close" onclick="closePopup();">×</button>
			<!-- 타이틀 -->
			<div class="login-title">
				<h1 class="text-center text-primary">보전 정보</h1>
			</div>
			<div class="row">
				<div class="col-sm-12 mb-3">
					<div class="form-group">
						<ul class="list-group">
							<c:choose>
								<c:when test="${empty info}">
									<li class="list-group-item">정보가 없습니다!</li>
								</c:when>
								<c:otherwise>
									<li class="list-group-item"><b style="display:block;">보전 번호</b><p style="display:inline;">${info.code}</p></li>
									<li class="list-group-item"><b style="display:block;">작성일자</b><p style="display:inline;"><fmt:formatDate value="${info.reg_date}" pattern="yyyy년 MM월 DD일 EE요일 hh시 mm분"/><br /></p></li>
									<li class="list-group-item"><b style="display:block;">작성자</b><p style="display:inline;">${info.emp_name}(${info.emp_code})</p></li>
									<li class="list-group-item"><b style="display:block;">제목</b><p style="display:inline;">${info.mt_subject}</p></li>
									<li class="list-group-item"><b style="display:block;">내용</b><p style="display:inline;">${info.mt_content}</p></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
				</div>
			</div>
			<c:if test="${!empty info and info.complete eq true}">
				<div class="row">
					<div class="col-sm-12 mb-3">
						<div class="form-group">
							<ul class="list-group">
								<li class="list-group-item"><b style="display: block;">완료 일자</b>
								<p style="display: inline;"><fmt:formatDate value="${info.comp_date}" dateStyle="long"/><fmt:formatDate value="${info.comp_date}" type="time" timeStyle="short"/></p></li>
								<li class="list-group-item"><b style="display: block;">담당자</b>
								<p style="display: inline;">${info.manager_name}(${info.manager})</p></li>
								<li class="list-group-item"><b style="display: block;">결과</b>
								<p style="display: inline;">${info.res_info}</p></li>
								<li class="list-group-item"><b style="display: block;">정보</b>
								<p style="display: inline;">${info.res_content}</p></li>
							</ul>
						</div>
					</div>
				</div>
			</c:if>

			<!-- 버튼 -->
			<div class="row">
				<div class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
					<c:if test="${role eq 'manager'}">
						<button type="button" class="btn btn-warning" onclick="javascript:openPage('/facility/maintenance/result/insert?code=${info.code}', 500, 600)">
							<b>입력</b>
						</button>
					</c:if>
					<c:if test="${role eq 'admin' or id eq 'emp_code'}">
						<button type="button" class="btn btn-warning" onclick="javascript:openPage('/facility/maintenance/update?code=${info.code}', 500, 600)">
							<b>수정</b>
						</button>
						<button type="button" class="btn btn-danger" onclick="javascript:openPage('/facility/maintenance/delete?code=${info.code}', 500, 600)">
							<b>삭제</b>
						</button>
					</c:if>
				</div>
			</div>
			<!-- 버튼 -->
		</div>
	</div>
	<!-- 콘텐츠 끝> -->
	<%@ include file="../../include/footer.jsp"%>
	<script type="text/javascript">
		$(document).ready(function(){
			window.resizeTo(outerWidth - innerWidth + 500, outerHeight - innerHeight + $(".login-box").outerHeight() + 12);
		});
	</script>
</body>
</html>