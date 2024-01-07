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
							<table class="table table-striped">
								<thead>
									<tr>
										<td style="width: 100px;">
											<div class="custom-control custom-checkbox mb-5">
												<input type="checkbox" class="custom-control-input"
													id="tableCheckAll"> <label
													class="custom-control-label" for="tableCheckAll"></label>
											</div>
										</td>
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
									<c:forEach items="${List}" var="List" varStatus="status">
										<tr>
											<!-- 리스트 표, 1페이지에 몇개 조회 가능하게 할 지는 정해도 될 거 같음 -->
											<c:choose>
												<c:when test="${List.status eq '출하대기'}">
													<td><div class="custom-control custom-checkbox mb-5">
															<!-- id에 뒤에 el식으로 테이블 인덱스나, 번호 추가, value에 primary 붙이기  -->
															<input type="checkbox" class="custom-control-input"
																id="checkTable${status.index}" name="tableCheck"
																value="${List.code }"> <label
																class="custom-control-label"
																for="checkTable${status.index}"></label>
														</div></td>
												</c:when>
												<c:otherwise>
													<td></td>
												</c:otherwise>
											</c:choose>
											<!-- 상세 정보 이동! -->
											<th class="info${status.index}"
												style="color: blue; text-decoration: underline;">${List.code }</th>
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
						<div class="row">
							<div class="col-sm-12 col-md-5">
								<div class="dataTables_info" id="DataTables_Table_0_info"
									role="status" aria-live="polite">전체 출하
									${pageVO.totalCount}개 중 ${pageVO.totalCount} 개</div>
							</div>
							<div class="col-sm-5 col-md-7 text-right">
							<div>
							<button type="button" class="btn btn-success btn-sm" id="print">
							<b>거래명세서</b>
							</button>
							</div>
							</div>
						</div>
						<div class="btn-toolbar justify-content-center mb-15">
							<c:if test="${pageVO.totalCount > 1}">
							<div class="btn-group">
								<c:if test="${pageVo.prev }">
									<a href="/request/list?page=${pageVO.startPage - 1 }"
										class="btn btn-outline-primary prev"><i
										class="fa fa-angle-double-left"></i></a>
								</c:if>
								<c:forEach begin="${pageVO.startPage }" end="${pageVO.endPage }"
									step="1" var="i">
									<c:if test="${pageVO.cri.page == i }">
										<span class="btn btn-primary current">${i }</span>
									</c:if>
									<c:if test="${pageVO.cri.page != i}">
												<a href="/shipment/list?page=${i}" class="btn btn-outline-primary">${i}</a>
									</c:if>
								</c:forEach>
								<c:if test="${pageVO.next }">
									<a href="/request/list?page=${pageVO.endPage + 1 }"
										class="btn btn-outline-primary next"><i
										class="fa fa-angle-double-right"></i></a>
								</c:if>
							</div>
							</c:if>
						</div>
					</div>
				</div>
			</div>
			<!-- Checkbox select Datatable End -->
			
			<!-- 푸터 -->
			<div class="footer-wrap pd-20 mb-20 card-box">
				ePle MES made by <a href="https://github.com/dropways"
					target="_blank">아이티윌 부산 2023년 7월 프로젝트 2차 1조</a>
			</div>
			<%@ include file="../include/footer.jsp"%>
			<%@ include file="../include/datatable.jsp"%>
		</div>
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
