<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	String today = dateFormat.format(new Date());
%>
<html>
<head>
<%@ include file="../../../include/head.jsp"%>
<title>보전 목록</title>
</head>
<body>
	<!-- 공통, css 및 js 추가 시 /include/header, footer에서 삽입 -->
	<%@ include file="../../../include/header.jsp"%>
	<%@ include file="../../../include/right-side-bar.jsp"%>
	<%@ include file="../../../include/left-side-bar.jsp"%>
	<!-- 메인 컨테이너 -->
	<div class="main-container">
		<div class="pd-ltr-20 xs-pd-20-10">
			<div class="title" style="margin-bottom: 10px;">
				<h1>보전 결과</h1>
			</div>
			<ul class="nav nav-pills" role="tablist">
				<li class="nav-item">
					<a class="nav-link text-blue" href="/facility/maintenance/list">보전 목록</a>
				</li>
				<li class="nav-item">
					<a class="nav-link text-blue active" href="/facility/maintenance/result/list">보전 결과</a>
				</li>
			</ul>
			<br>
			<div class="min-height-200px">
				<!-- 아코디언 시작 -->
				<div class="faq-wrap">
					<div id="accordion">
						<div class="card">
							<div class="card-header">
								<button class="btn btn-block collapsed" data-toggle="collapse" data-target="#faq1" aria-expanded="false">
									<b>검색</b>
								</button>
							</div>
							<div id="faq1" class="collapse" data-parent="#accordion" style="">
								<div class="card-body">
									<form id="accordion-search" method="GET" action="#">
										<div class="col-md-12">
											<div class="form-group">
												<div class="row">
													<h4 class="text-blue h4">기본 검색</h4>
													<div class="col-md-5 col-sm-12 btn-group" style="margin-left: auto;">
														<div class="btn-group dropdown">

															<button type="button" id="searchCategoryButton" class="btn btn-primary dropdown-toggle waves-effect" data-toggle="dropdown" aria-expanded="false">
																<c:choose>
																	<c:when test="${empty pageVO.search.searchCategory}">카테고리 </c:when>
																	<c:when test="${!empty pageVO.search.searchCategory}">${pageVO.search.searchKor[pageVO.search.index]}</c:when>
																</c:choose>
																<span class="caret"></span>
															</button>
															<div class="dropdown-menu" style="">
																<a class="dropdown-item" id="category-none" href="javascript:buttonCategory(null);">선택</a>
																<c:forEach var="i" begin="0" end="4">
																	<a class="dropdown-item" href="javascript:buttonCategory(${i});">${pageVO.search.kor[i]}</a>
																</c:forEach>
															</div>
														</div>

														<input type="hidden" id="searchCategory" name="searchCategory" value="${pageVO.search.searchCategory}"> <input type="text" name="searchKeyword" class="form-control" style="width: 100%;" value="${pageVO.search.searchKeyword}" placeholder="검색어 입력">
													</div>
												</div>
												<hr>
												<div class="row">
													<h4 class="text-blue h4">상세 검색</h4>
												</div>
												<div class="row">
													<div class="col-md-2 col-sm-12">
														<label class="weight-600">체크 박스</label>
														<div class="custom-control custom-checkbox mb-5">
															<input type="checkbox" class="custom-control-input" id="formCheckAll"> <label class="custom-control-label" for="formCheckAll"><b>전체</b></label>
														</div>
														<div class="custom-control custom-checkbox mb-5">
															<input type="checkbox" class="custom-control-input" id="formCheck1" name="formCheck" value="PM"> <label class="custom-control-label" for="formCheck1">예방 보전</label>
														</div>
														<div class="custom-control custom-checkbox mb-5">
															<input type="checkbox" class="custom-control-input" id="formCheck2" name="formCheck" value="BM"> <label class="custom-control-label" for="formCheck2">사후 보전</label>
														</div>
														<div class="custom-control custom-checkbox mb-5">
															<input type="checkbox" class="custom-control-input" id="formCheck3" name="formCheck" value="EM"> <label class="custom-control-label" for="formCheck3">긴급 보전</label>
														</div>
														<div class="custom-control custom-checkbox mb-5">
															<input type="checkbox" class="custom-control-input" id="formCheck4" name="formCheck" value="CM"> <label class="custom-control-label" for="formCheck4">개량 보전</label>
														</div>
													</div>
													<div class="col-md-2 col-sm-12">
														<div class="form-group">
															<label>날짜</label> <input type="date" name="date" class="form-control" value="${pageVO.search.date}" max="<%=today%>">
														</div>
													</div>
													<div class="col-md-4 col-sm-12">
														<div class="form-group" style="display: inline-block;">
															<label>기간</label> <input type="date" id="dateLeft" value="${pageVO.search.betweenDateLeft}" name="betweenDateLeft" class="form-control" max="<%=today%>">
														</div>
														<b>-</b>
														<div class="form-group" style="display: inline-block;">
															<input type="date" id="dateRight" value="${pageVO.search.betweenDateRight}" name="betweenDateRight" class="form-control" max="<%=today%>">
														</div>
													</div>
												</div>
											</div>
										</div>

										<!-- 정렬, asc, desc -->
										<input type="hidden" name="activeSortCategory" id="sortCategory" value="${pageVO.search.activeSortCategory}">
										<input type="hidden" name="sortValue" id="sortValue" value="${pageVO.search.sortValue}">

										<c:choose>
											<c:when test="${!empty pageVO.cri.page}">
												<input type="hidden" id="page" name="page" value="1">
											</c:when>
											<c:when test="${!empty pageVO.cri.page}">
												<input type="hidden" id="page" name="page" value="${pageVO.cri.page}">
											</c:when>
										</c:choose>

										<c:choose>
											<c:when test="${empty pageVO.cri.pageSize}">
												<input type="hidden" id="pageSize" name="pageSize" value="10">
											</c:when>
											<c:when test="${!empty pageVO.cri.pageSize}">
												<input type="hidden" id="pageSize" name="pageSize" value="${pageVO.cri.pageSize}">
											</c:when>
										</c:choose>

										<div class="btn-group pull-right" style="margin-bottom: 10px">
											<button type="submit" class="btn btn-primary" id="search">
												<b>검색</b>
											</button>
											<button type="reset" class="btn btn-secondary" id="reset">
												<b>초기화</b>
											</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 아코디언 끝 -->
				<!-- table start -->
				<div class="card-box mb-30">
					<div class="pd-20">
						<div class="btn-group pull-left" style="margin-bottom: 15px">
							<div class="dropdown">
								<button type="button" id="searchCategoryButton" class="btn btn-secondary dropdown-toggle waves-effect" data-toggle="dropdown" aria-expanded="false">
									행 개수 <span class="caret"></span>
								</button>
								<div class="dropdown-menu" style="">
									<a class="dropdown-item" href="javascript:changePageSize(10);">10</a> <a class="dropdown-item" href="javascript:changePageSize(25);">25</a> <a class="dropdown-item" href="javascript:changePageSize(50);">50</a> <a class="dropdown-item" href="javascript:changePageSize(100);">100</a>
								</div>
							</div>
							&nbsp;
							<div class="dropdown">
								<button type="button" id="searchCategoryButton" class="btn btn-secondary dropdown-toggle waves-effect" data-toggle="dropdown" aria-expanded="false">
									내보내기 <span class="caret"></span>
								</button>
								<div class="dropdown-menu" style="">
									<a class="dropdown-item" href="javascript:exportData(1);">PDF</a> <a class="dropdown-item" href="javascript:exportData(2);">CSV</a> <a class="dropdown-item" href="javascript:exportData(3);">인쇄</a>
								</div>
							</div>
						</div>
						<div class="btn-group pull-right" style="margin-bottom: 10px">
							<button type="button" class="btn btn-success" id="add">
								<b>추가</b>
							</button>
							<button type="button" class="btn btn-danger" id="delete">
								<b>삭제</b>
							</button>
						</div>
					</div>
					<div class="pb-20">
						<div class="col-sm-30">
							<table class="table table-striped">
								<tr>
									<td style="width: 100px;">
										<div class="custom-control custom-checkbox mb-5">
											<input type="checkbox" class="custom-control-input" id="tableCheckAll"> <label class="custom-control-label" for="tableCheckAll"></label>
										</div>
									</td>
									<c:forEach begin="0" end="5" var="i">
										<th class="btn-light" onclick="javascript:orderList(${i})"><c:if test="${i eq pageVO.search.activeSortCategory}">
												<c:choose>
													<c:when test="${pageVO.search.sortValue eq 'asc'}">
														<i class="ion-android-arrow-up"></i>
													</c:when>
													<c:when test="${pageVO.search.sortValue eq 'desc'}">
														<i class="ion-android-arrow-down"></i>
													</c:when>
												</c:choose>
											</c:if> &nbsp;&nbsp;
											<h6 style="display: inline-block;">${pageVO.search.kor[i]}</h6></th>
									</c:forEach>
									<th>옵션</th>
								</tr>
								<c:if test="${empty list}">
									<tr>
										<th colspan="8" style="text-align: center;">데이터가 없습니다.</th>
									</tr>
								</c:if>
								<c:if test="${!empty list }">
									<c:forEach items="${list}" var="i">
										<tr>
											<!-- 리스트 표, 1페이지에 몇개 조회 가능하게 할 지는 정해도 될 거 같음 -->
											<td><div class="custom-control custom-checkbox mb-5">
													<!-- id에 뒤에 el식으로 테이블 인덱스나, 번호 추가, value에 primary 붙이기  -->
													<input type="checkbox" class="custom-control-input" id="checkTable${i.code}" name="tableCheck" value="${i.code}"> <label class="custom-control-label" for="checkTable${i.code}"></label>
												</div></td>
											<th><a href="/facility/maintenance/detail?code=${i.code}"><b class="text-blue" id="tableTitle1">${i.code}</b></a></th>
											<th>${i.code_name}</th>
											<th>${i.reg_date}</th>
											<th id="tableinfo${i.code}">${i.emp_name}</th>
											<!-- 상세 정보 이동! -->
											<th>${i.fac_code}</th>
											<th id="tableTitle${i.code}">${i.mt_subejct}</th>
											<td style="">
												<!-- 옵션 -->
												<div class="dropdown">
													<a class="btn btn-link font-24 p-0 line-height-1 no-arrow dropdown-toggle" href="#" role="button" data-toggle="dropdown"> <i class="dw dw-more"></i>
													</a>
													<div class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list">
														<!-- 링크 설정 -->
														<!-- 상세 보기 -->
														<a class="dropdown-item" href="/facility/maintenance/detail?code=${i.code}"><i class="dw dw-eye"></i> 상세 보기</a>
														<!-- 수정 -->
														<a class="dropdown-item" href="javascript:openPage('/facility/maintenance/update?code=${i.code}', 500, 600)"><i class="dw dw-edit2"></i> 수정</a>
														<!-- 삭제 -->
														<a class="dropdown-item" href="javascript:openPage('/facility/maintenance/delete?code=${i.code}', 500, 600)"><i class="dw dw-delete-3"></i> 삭제</a>
													</div>
												</div>
											</td>
										</tr>
									</c:forEach>
								</c:if>
							</table>
							<div class="row">
								<div class="col-sm-12 col-md-5">
									<div class="dataTable_info" id="dataTable_info" role="status" aria-live="polite"></div>
								</div>
							</div>
							<div class="btn-toolbar justify-content-center mb-15">
								<c:if test="${pageVO.totalCount > 1}">
									<div class="btn-group">
										<c:if test="${pageVO.prev}">
											<a href="javascript:pageMove(${pageVO.startPage - 1})" class="btn btn-outline-primary prev"> <i class="fa fa-angle-double-left"></i>
											</a>
										</c:if>
										<c:forEach begin="${pageVO.startPage}" end="${pageVO.endPage}" var="i">
											<c:if test="${pageVO.cri.page == i}">
												<span class="btn btn-primary current">${i}</span>
											</c:if>
											<c:if test="${pageVO.cri.page != i}">
												<a href="javascript:pageMove(${i})" class="btn btn-outline-primary">${i}</a>
											</c:if>
										</c:forEach>
										<c:if test="${pageVO.next}">
											<a href="javascript:pageMove(${pageVO.endPage + 1})" class="btn btn-outline-primary next"> <i class="fa fa-angle-double-right"></i>
											</a>
										</c:if>
									</div>
								</c:if>
							</div>
						</div>
					</div>
				</div>
				<!-- table End -->
				<!-- 푸터 -->
				<%@ include file="../../../include/github.jsp"%>
				<%@ include file="../../../include/footer.jsp"%>
			</div>
		</div>
	</div>

	<!-- 모달 창 -->
	<div class="modal fade" id="warning-modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm modal-dialog-centered">
			<div class="modal-content bg-warning">
				<div class="modal-body text-center">
					<h3 class="mb-15">
						<i class="fa fa-exclamation-triangle"></i> 주의
					</h3>
					<p>
						<b>선택된 데이터</b>가 없습니다!
					</p>
					<button type="button" class="btn btn-dark" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 모달 창 -->

	<!-- 추가, 수정, 삭제 -->
	<script type="text/javascript">
		$(document).ready(function() {
			// 추가
			$("#add").click(function() {
				// 가로, 세로 설정
				openPage("/facility/info/insert", 500, 600);
			});
			
			// 삭제
			$("#delete").click(function() {
				var ch = $("input:checkbox[name=tableCheck]:checked").length;
				if (ch > 0) {
					// 가로, 세로 설정
					openPage("/facility/info/delete", 400, 700);
				} else {
					$(this).attr("data-toggle", "modal");
					$(this).attr("data-target", "#warning-modal");
					$($(this).data("target")).show();
				}
			});
		});

		function downloadPDF(data) {
			alert("data : " + data);
		}

		function downloadCSV(data) {
			alert("CSV");
		}

		function printResult(data) {
			alert("PRINT");
		}
		
		// 일반 검색 카테고리 input 저장
		function buttonCategory(a) {
			var buttonText = document.getElementById("searchCategoryButton");
			var category = document.getElementById("searchCategory");
			var result = "";
			switch(a){
			case 0 :
				result = "<c:out value='${pageVO.search.searchKor[0]}'/>";
				break;
			case 1 :
				result = "<c:out value='${pageVO.search.searchKor[1]}'/>";
				break;
			case 2 :
				result = "<c:out value='${pageVO.search.searchKor[2]}'/>";
				break;
			case 3 :
				result = "<c:out value='${pageVO.search.searchKor[3]}'/>";
				break;
			case 4 :
				result = "<c:out value='${pageVO.search.searchKor[4]}'/>";
				break;
			}
			buttonText.innerText = result == ""? "카테고리" : result;
			category.value = a;
		}
	</script>
</body>
</html>