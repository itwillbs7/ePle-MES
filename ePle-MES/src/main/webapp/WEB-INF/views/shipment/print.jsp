<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<%@ include file="../include/head.jsp"%>
<%-- <link href="${pageContext.requeset.contextPath }/resources/css/default.css" rel="stylesheet" type"text/css"> --%>
<title>출하 관리</title>
</head>
<body >
	<!-- 공통, css 및 js 추가 시 /include/header, footer에서 삽입 -->
	<%@ include file="../include/header.jsp"%>
	<%@ include file="../include/right-side-bar.jsp"%>
	<%@ include file="../include/left-side-bar.jsp"%>
	<!-- 비로그인 거름망 -->
	<%-- <c:if test="${empty id}" > --%>
	<%-- 	<c:redirect url="/main/login"/> --%>
	<%-- </c:if> --%>
	<!-- 메인 컨테이너 -->
	<div class="main-container">
		<div class="pd-ltr-20 xs-pd-20-10">


			<!-- Checkbox select Datatable start -->
			
				<div class="pb-20">
					<div class="col-sm-30">
						<form class="table" id="table">
							<table class="table table-bordered">
								<thead>
									<tr>
										<th>출하번호</th>
										<th>수주번호</th>
										<th>납품예정일</th>
										<th>품번</th>
										<th>수주업체</th>
										<th>수주수량</th>
										<th>재고량</th>
										<th>출하량</th>
										<th>출하일자</th>
										<th>출하상태</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${ship}" var="List" varStatus="status">
										<tr>
											<th>${List.code }</th>
											<th>${List.reqs_code }</th>
											<th>${List.reqsdate }</th>
											<th>${List.product }</th>
											<th>${List.clientName }</th>
											<th>${List.reqsamount }</th>
											<th>${List.stock }</th>
											<th>${List.amount }</th>
											<th>${List.date }</th>
											<th>${List.status }</th>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</form>
						<img src="data:image/png;base64,${qrCodeImage }">
					</div>
				</div>
			</div>
			<!-- Checkbox select Datatable End -->
			
			
			
						<img src="data:image/png;base64,${qrCodeForClient }">
			
			
			<%@ include file="../include/footer.jsp"%>
			<%@ include file="../include/datatable.jsp"%>
		</div>
	



	<!-- 추가, 수정, 삭제, 상세보기 -->
	<script type="text/javascript">
	window.onload = function() {
	    window.print();
	    window.onafterprint = function() {
	        window.close();
	    }
	}

	</script>
</body>
</html>
