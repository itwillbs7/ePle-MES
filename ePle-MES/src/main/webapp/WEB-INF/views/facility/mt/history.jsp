<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../../include/head.jsp"%>
<title>보전 내역</title>
</head>
<body>
	<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10">
			<button type="button" class="close" onclick="window.close();">×</button>
			<!-- 타이틀 -->
			<div class="login-title">
				<h1 class="text-center text-primary">보전 내역</h1>
			</div>
			<!-- 폼 -->
			<form method="get">
				<div class="btn-group btn-block pb-20">
					<div class="btn-group dropdown">
						<button type="button" style="width: 100px" id="searchCategoryButton" class="btn btn-primary dropdown-toggle waves-effect" data-toggle="dropdown" aria-expanded="false">
							<c:choose>
								<c:when test="${empty pageVO.search.searchCategory}">카테고리 </c:when>
								<c:when test="${!empty pageVO.search.searchCategory}">${pageVO.search.searchKor[pageVO.search.index]} </c:when>
							</c:choose>
							<span class="caret"></span>
						</button>
						<div class="dropdown-menu" style="">
							<a class="dropdown-item" id="category-none" href="javascript:buttonCategory(null);">선택</a>
							<c:forEach var="i" begin="0" end="4">
								<a class="dropdown-item" href="javascript:buttonCategory(${i});">${pageVO.search.searchKor[i]}</a>
							</c:forEach>
						</div>

					</div>
					<input type="hidden" id="searchCategory" name="searchCategory" value="${pageVO.search.searchCategory}"> <input type="text" name="searchKeyword" class="form-control" style="width: 200px" value="${pageVO.search.searchKeyword}" placeholder="검색어 입력">
					<button type="submit" class="btn btn-success">
						<b>검색</b>
					</button>
				</div>

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
			</form>
			<!-- 폼 -->

			<div class="faq-wrap">
				<div id="accordion">
					<c:choose>
						<c:when test="${empty list or list.size() == 0}">
							<h4 class="text-center">등록된 보전 내역이 없습니다!</h4>
						</c:when>
						<c:otherwise>
							<c:forEach items="${list}" var="i">
								<!-- foreach -->
								<div class="card">
									<div class="card-header">
										<button class="btn btn-block collapsed" data-toggle="collapse" data-target="#faq${i.code}" aria-expanded="false">${i.mt_subject}</button>
									</div>
									<div id="faq${i.code}" class="collapse" data-parent="#accordion" style="">
										<div class="card-body">
											<div class="pd-20">
												<div class="row">
													<div class="col-sm-12">
														<div class="form-group">
															<dl>
																<dt class="col-sm-3">등록일</dt>
																<dd class="col-sm-9">
																	<fmt:formatDate value="${i.reg_date}" type="both" />
																</dd>
																<dt class="col-sm-3">내용</dt>
																<dd class="col-sm-9">${i.mt_content}</dd>
																<dt class="col-sm-3">담당자</dt>
																<dd class="col-sm-9">${i.manager_name}(${i.manager})</dd>
																<dt class="col-sm-3">결과</dt>
																<dd class="col-sm-9">
																	<dl class="row">
																		<dt class="col-sm-4">${i.res_info}</dt>
																		<dd class="col-sm-4">${i.res_content}</dd>
																	</dl>
																</dd>
															</dl>

														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- foreach -->
							</c:forEach>
						</c:otherwise>
					</c:choose>
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

			<!-- 버튼 -->
			<div class="row">
				<div class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
					<button type="button" class="btn btn-secondary" onclick="window.close();">
						<b>닫기</b>
					</button>
				</div>
			</div>
			<!-- 버튼 -->

		</div>
	</div>
	<!-- 콘텐츠 끝 -->
	<%@ include file="../../include/footer.jsp"%>
	<script type="text/javascript">
		// 일반 검색 카테고리 input 저장
		function buttonCategory(a) {
			var buttonText = document.getElementById("searchCategoryButton");
			var category = document.getElementById("searchCategory");
			var result = "";
			switch (a) {
			case 0:
				result = "<c:out value='${pageVO.search.searchKor[0]}'/>";
				break;
			case 1:
				result = "<c:out value='${pageVO.search.searchKor[1]}'/>";
				break;
			case 2:
				result = "<c:out value='${pageVO.search.searchKor[2]}'/>";
				break;
			case 3:
				result = "<c:out value='${pageVO.search.searchKor[3]}'/>";
				break;
			case 4:
				result = "<c:out value='${pageVO.search.searchKor[4]}'/>";
				break;
			}
			buttonText.innerText = result == "" ? "카테고리" : result;
			category.value = a;
		}
	</script>
</body>
</html>