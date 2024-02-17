<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<%@ include file="../../include/head.jsp"%>
<title>설비 보전</title>
</head>
<body>
<c:if test="${sessionScope.id eq null}">
	<c:redirect url="/" />
</c:if>
<c:if test="${sessionScope.dep_group eq '설비'}">
	<c:redirect url="/facility/mt/status" />
</c:if>
<!-- 직원의 경우 보전 등록, 자신이 등록한 것만 보도록 함 -->
<!-- 관리자의 경우 보전 등록 및 전체 조회 가능, 보전 작업 실시 -->
	<!-- 공통, css 및 js 추가 시 /include/header, footer에서 삽입 -->
	<%@ include file="../../include/header.jsp"%>
	<%@ include file="../../include/left-side-bar.jsp"%>
	<!-- 메인 컨테이너 -->
	<div class="main-container">
		<div class="pd-ltr-20 xs-pd-20-10">
			<div class="row">
				<div class="col-md-12">
					<h1 class="title">설비 보전</h1>
				</div>
				<div class="col-md-12">
					<nav aria-label="breadcrumb" role="navigation">
						<ol class="breadcrumb">
							<li class="breadcrumb-item">설비 관리</li>
							<li class="breadcrumb-item active" aria-current="page"><b>
									설비 보전</b></li>
						</ol>
					</nav>
				</div>
			</div>
			<br>
			<div class="min-height-200px">
				<c:choose>
					<c:when test="${empty role}">
						<c:redirect url="/" />
					</c:when>
					<c:when test="${role eq 'emp'}">
						<!-- row -->
						<div class="row">
							<div class="col-md-4 mb-20">
								<a href="javascript:insert();" class="card-box d-block mx-auto pd-20 text-secondary text-center">
									<div class="img pb-30 ">
										<img src="${pageContext.request.contextPath}/resources/images/plus.png" alt="">
									</div>
									<div class="content">
										<h3 class="h1">보전 등록</h3>
									</div>
								</a>
							</div>
							<div class="col-md-4 mb-20">
								<a href="javascript:list();" class="card-box d-block mx-auto pd-20 text-secondary text-center">
									<div class="img pb-30">
										<img src="${pageContext.request.contextPath}/resources/images/settings.png" alt="">
									</div>
									<div class="content">
										<h3 class="h1">보전 조회</h3>
									</div>
								</a>
							</div>
							<div class="col-md-4 mb-20">
								<a href="javascript:history();" class="card-box d-block mx-auto pd-20 text-secondary text-center">
									<div class="img pb-30">
										<img src="${pageContext.request.contextPath}/resources/images/table.png" alt="">
									</div>
									<div class="content">
										<h3 class="h1">보전 내역</h3>
									</div>
								</a>
							</div>
						</div>
						<!-- row -->
					</c:when>
					<c:when test="${role eq 'manager'}">
						<c:redirect url="/facility/mt/status" />
					</c:when>
				</c:choose>
				<!-- 푸터 -->
				<%@ include file="../../include/github.jsp"%>
				<%@ include file="../../include/footer.jsp"%>
			</div>
		</div>
	</div>

	<!-- 추가, 수정, 삭제 -->
	<script type="text/javascript">
		function insert() {
			openPage("/facility/mt/insert", 500, 766);
		}

		function list() {
			openPage("/facility/mt/list", 500, 600);
		}
		
		function history() {
			openPage("/facility/mt/history", 500, 600);
		}
	</script>
</body>
</html>