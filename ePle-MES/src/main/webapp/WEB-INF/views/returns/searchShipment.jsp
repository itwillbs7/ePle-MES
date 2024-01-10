<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/head.jsp"%>
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
<title>반품 등록</title>
</head>
<body>
	<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10">
			<!-- 타이틀 -->
			<div class="login-title">
				<h1 class="text-center text-primary">출하번호 검색</h1>
			</div>
			<!-- 폼 -->
			<div class="search_area">
				<form action="/returns/searchShipment" method="post"
					id="accordion-search">
					<!-- 입력 구간 -->
					<div class="row">
						<div class="col-sm-12 mb-3">
							<!-- 필수입력내역 -->
							<div class="form-group">
								<label>회사명</label> <input class="form-control" type="text"
									placeholder="업체명을 입력하세요" name="clientName" id="manager"
									value="${clientName }">
							</div>
							<div class="form-group">
								<label>품명</label> <input class="form-control" type="text"
									placeholder="품명을 입력하세요" name="productName" id="managerName"
									value="${productName }">
							</div>
							<c:choose>
								<c:when test="${!empty pageVO.cri.page}">
									<input type="hidden" id="page" name="page" value="1">
								</c:when>
								<c:when test="${!empty pageVO.cri.page}">
									<input type="hidden" id="page" name="page"
										value="${pageVO.cri.page}">
								</c:when>
							</c:choose>

							<c:choose>
								<c:when test="${empty pageVO.cri.pageSize}">
									<input type="hidden" id="pageSize" name="pageSize" value="10">
								</c:when>
								<c:when test="${!empty pageVO.cri.pageSize}">
									<input type="hidden" id="pageSize" name="pageSize"
										value="${pageVO.cri.pageSize}">
								</c:when>
							</c:choose>
							<!-- 버튼 -->
							<div class="row">
								<div
									class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
									<button type="submit" class="btn btn-success">
										<b>검색</b>
									</button>
								</div>
							</div>
						</div>
					</div>
					<!-- 버튼 -->
				</form>
			</div>
			<!-- 폼 -->
			<table class="table table-striped" id="tableId">
				<thead>
					<tr>
						<th>출하번호</th>
						<th>품번</th>
						<th>출하일자</th>
						<th>출하량</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${List}" var="item">
						<tr
							onclick="selectWork('${item.code}','${item.product}','${item.clientName}','${item.date}','${item.amount}','${item.reqs_code}','${item.unit}')">
							<th>${item.code}</th>
							<th>${item.product }</th>
							<th>${item.date}</th>
							<th>${item.amount}</th>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="btn-toolbar justify-content-center mb-15">
				<c:if test="${pageVO.totalCount > 1}">
					<div class="btn-group">
						<c:if test="${pageVO.prev}">
							<a href="javascript:pageMove(${pageVO.startPage - 1})"
								class="btn btn-outline-primary prev"> <i
								class="fa fa-angle-double-left"></i>
							</a>
						</c:if>
						<c:forEach begin="${pageVO.startPage}" end="${pageVO.endPage}"
							var="i">
							<c:if test="${pageVO.cri.page == i}">
								<span class="btn btn-primary current">${i}</span>
							</c:if>
							<c:if test="${pageVO.cri.page != i}">
								<a href="javascript:pageMove(${i})"
									class="btn btn-outline-primary">${i}</a>
							</c:if>
						</c:forEach>
						<c:if test="${pageVO.next}">
							<a href="javascript:pageMove(${pageVO.endPage + 1})"
								class="btn btn-outline-primary next"> <i
								class="fa fa-angle-double-right"></i>
							</a>
						</c:if>
					</div>
				</c:if>
			</div>

		</div>
	</div>
	<!-- 콘텐츠 끝> -->
	<%@ include file="../include/footer.jsp"%>

	<script type="text/javascript">
		//부모창으로 데이터 넘기기
		function selectWork(a, b, c, d, e, f, g) { // 부모창으로 값 넘기기

			opener.document.getElementById("ship_code").value = a //출하번호
			opener.document.getElementById("clientName").value = c //회사명
			opener.document.getElementById("shipdate").value = d //출하일자
			opener.document.getElementById("samount").value = e // 출하량
			opener.document.getElementById("request_code").value = f //수주번호
			opener.document.getElementById("unit").value = g // unit

			opener.document.getElementById("ship_code").dispatchEvent(
					new Event('input'));
			opener.document.getElementById("clientName").dispatchEvent(
					new Event('input'));
			opener.document.getElementById("shipdate").dispatchEvent(
					new Event('input'));
			opener.document.getElementById("samount").dispatchEvent(
					new Event('input'));
			opener.document.getElementById("request_code").dispatchEvent(
					new Event('input'));
			opener.document.getElementById("unit").dispatchEvent(
					new Event('input'));

			self.close();

		}
	</script>
</body>
</html>