<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<html>
<head>
<%@ include file="../include/head.jsp"%>
<title>소요량 관리</title>
</head>
<body>
	<!-- 공통, css 및 js 추가 시 /include/header, footer에서 삽입 -->
	<%@ include file="../include/header.jsp"%>
	<%@ include file="../include/right-side-bar.jsp"%>
	<%@ include file="../include/left-side-bar.jsp"%>
	<!-- 메인 컨테이너 -->
	<div class="main-container">
		<div class="pd-ltr-20 xs-pd-20-10">
			<div class="title mb-20">
				<h1>소요량 관리</h1>
			</div>
			<div class="min-height-200px">
				<!-- Checkbox select Datatable start -->
				<div class="card-box mb-30">
					<div class="pd-20">
						<div class="btn-group pull-right" style="margin-bottom: 10px">
							<button type="button" class="btn btn-success" id="add">
								<b>+</b>
							</button>
						</div>
					</div>
					<div class="pb-20">
						<div class="col-sm-30">
							<table class="table table-striped">
								<tr>
									<th>#</th>
									<th>품명</th>
									<th>재료 종류</th>
									<th>옵션</th>
								</tr>
								<c:choose>
									<c:when test="${empty list}">
										<tr>
											<th colspan="4">등록된 소요량이 없습니다!</th>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="i" items="${list}">
											<tr onclick="$('.${i.code}').toggle();">
												<td><a href="javascript:openPage('/requirement/detail?code=${i.code}', 500, 700)"> <b class="text-blue">${i.code}</b></a></td>
												<td>${i.name}</td>
												<td>${i.count}</td>
												<td>
													<!-- 옵션 -->
													<div class="dropdown">
														<a class="btn btn-link font-24 p-0 line-height-1 no-arrow dropdown-toggle" href="#" role="button" data-toggle="dropdown"> <i class="dw dw-more"></i>
														</a>
														<div class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list">
															<!-- 링크 설정 -->
															<!-- 수정 -->
															<a class="dropdown-item" href="javascript:openPage('/requirement/detail?code=${i.code}', 500, 700)"><i class="dw dw-eye"></i> 상세 보기</a>
															<!-- 수정 -->
															<a class="dropdown-item" href="javascript:openPage('/requirement/add?code=${i.code}', 500, 700)"><i class="dw dw-add"></i> 재료 추가</a>
															<!-- 수정 -->
															<a class="dropdown-item" href="javascript:openPage('/requirement/update?code=${i.code}', 500, 700)"><i class="dw dw-edit2"></i> 수정</a>
															<!-- 삭제 -->
															<a class="dropdown-item" href="javascript:openPage('/requirement/delete?code=${i.code}', 500, 600)"><i class="dw dw-delete-3"></i> 삭제</a>
														</div>
													</div>
												</td>
											</tr>
											<tr class="tog ${i.code}">
												<th colspan="4">
													<table class="table">
														<thead>
															<tr>
																<th>코드</th>
																<th>재료명</th>
																<th>수량</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach var="j" items="${i.list}">
																<tr>
																	<td>${j.material}</td>
																	<td>${j.materialName}</td>
																	<td>${j.amount}</td>
																</tr>
															</c:forEach>
														</tbody>
													</table>
												</th>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</table>
						</div>
					</div>
				</div>
				<!-- Checkbox select Datatable End -->
				<!-- 푸터 -->
				<div class="footer-wrap pd-20 mb-20 card-box">
					ePle MES made by <a href="https://github.com/dropways" target="_blank">아이티윌 부산 2023년 7월 프로젝트 2차 1조</a>
				</div>
				<%@ include file="../include/footer.jsp"%>
				<%@ include file="../include/datatable.jsp"%>
			</div>
		</div>
	</div>

	<!-- 추가, 수정, 삭제 -->
	<script type="text/javascript">
		$(document).ready(function() {
			// 추가
			$("#add").click(function() {
				// 가로, 세로 설정
				openPage("/requirement/add", 500, 700);
			});

			$(".tog").toggle();
		});
	</script>
</body>
</html>
