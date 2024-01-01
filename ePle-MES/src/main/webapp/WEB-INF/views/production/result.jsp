<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<link rel="stylesheet" href="result.css" />
<%@ include file="../include/head.jsp"%>
<title>실적등록</title>
</head>
<body>
	<!-- 공통, css 및 js 추가 시 /include/header, footer에서 삽입 -->
	<%@ include file="../include/header.jsp"%>
	<%@ include file="../include/right-side-bar.jsp"%>
	<%@ include file="../include/left-side-bar.jsp"%>
	<!-- 메인 컨테이너 -->
	<div class="main-container">
		<div class="pd-ltr-20 xs-pd-20-10">
			<div class="title" style="margin-bottom: 10px;">
				<h1>실적 등록</h1>
			</div>
			<div class="min-height-200px">
				<!-- 검색 시작 -->
				<div class="faq-wrap">
					<div class="card">
						<div class="card-body" style="padding: 20px;">
							<form id="accordion-search">
								<div class="col-md-12">
									<div class="form-group" style="margin: 0">
										<div class="row">
											<div class="col-md-2 col-sm-12">
												<div class="form-group">
													<label>생산일</label> <input class="form-control date-picker" placeholder="Select Date" type="text" />
												</div>
											</div>
											<div class="col-md-2 col-sm-12">
												<div class="form-group">
													<label>라인코드</label> <select class="custom-select2 form-control" multiple="multiple" style="width: 100%" name="line_code">
														<c:forEach items="${line_codeList }" var="line_code">
															<option value="${line_code }">${line_code }</option>
														</c:forEach>
													</select>
												</div>
											</div>
											<div class="col-md-2 col-sm-12">
												<div class="custom-control custom-checkbox mb-5" style="position: absolute; top: 50%; margin-top: -8px;">
													<input type="checkbox" class="custom-control-input" id="customCheck1" /> <label class="custom-control-label" for="customCheck1">완료포함</label>
												</div>
											</div>
											<div class="col-md-2 col-sm-12">
												<div class="btn-group pull-right" style="margin-bottom: 10px; position: absolute; top: 50%; margin-top: -22px;">
													<button class="btn btn-primary" type="button" onclick="ajaxSearch()">
														<b>검색</b>
													</button>
													<button type="reset" class="btn btn-secondary" id="reset">
														<b>초기화</b>
													</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
				<!-- 검색 끝 -->
				<!-- 실적 데이터 테이블 시작 -->
				<div class="card-box mb-30">
					<div class="pb-20" style="padding: 20px">
						<table class="data-table table hover multiple-select-row nowrap">
							<thead>
								<tr>
									<th>실적번호</th>
									<th>생산일</th>
									<th>라인</th>
									<th>상태</th>
									<th>제품코드</th>
									<th>제품명</th>
									<th>단위</th>
									<th>지시량</th>
									<th>양품량</th>
									<th>부적합량</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${rsList }" var="result">
									<tr>
										<td>${result }</td>
										<td>${code }</td>
										<td>${code }</td>
										<td>${code }</td>
										<td>${code }</td>
										<td>${code }</td>
										<td>${code }</td>
										<td>${code }</td>
										<td>${code }</td>
										<td>${code }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<!-- 실적 데이터 테이블 끝 -->
				<!-- 실적 정보 편집 시작 -->
				<div class="pd-20 card-box">
					<div class="tab">
						<ul class="nav nav-tabs" role="tablist">
							<li class="nav-item"><a class="nav-link active text-blue" data-toggle="tab" href="#result" role="tab" aria-selected="true">기본 정보</a></li>
							<li class="nav-item"><a class="nav-link text-blue" data-toggle="tab" href="#failed" role="tab" aria-selected="false">부적합 정보</a></li>
							<li class="nav-item"><a class="nav-link text-blue" data-toggle="tab" href="#input" role="tab" aria-selected="false">투입 내역</a></li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane fade show active" id="result" role="tabpanel">
								<div class="pd-20">
									<table border="1px solid black" style="border-spacing: 10px; border-collapse: separate;">
										<tr>
											<td>
												<span class="infoDF">실적번호</span>
												<span class="infoAS">실적번호1</span>
											</td>
											<td>
												<span class="infoDF">제품코드</span>
												<span class="infoAS">제품코드1</span>
											</td>
											<td>
												<span class="infoDF">제품명</span>
												<span class="infoAS">제품명1</span>
											</td>
											<td>
												<span class="infoDF">상태</span>
												<span class="infoAS">상태1</span>
											</td>
											<td>
												<span class="infoDF">단위</span>
												<span class="infoAS">단위1</span>
											</td>
											<td>
												<span class="infoDF">LOT</span>
												<span class="infoAS">LOT1</span>
											</td>
										</tr>
										<tr>
											<td>
												<span class="infoDF">라인</span>
												<span class="infoAS">라인1</span>
											</td>
											<td>
												<span class="infoDF">기간</span>
												<span class="infoAS">기간1</span>
											</td>
											<td>
												<span class="infoDF">지시량</span>
												<span class="infoAS">지시량1</span>
											</td>
											<td>
												<span class="infoDF">양품량</span>
												<span class="infoAS">양품량1</span>
											</td>
											<td>
												<span class="infoDF">부적합량</span>
												<span class="infoAS">부적합량1</span>
											</td>
										</tr>
									</table>
								</div>
							</div>
							<div class="tab-pane fade" id="failed" role="tabpanel">
								<div class="pd-20">failed</div>
							</div>
							<div class="tab-pane fade" id="input" role="tabpanel">
								<div class="pd-20">input</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 실적 정보 편집 끝 -->
				<!-- 푸터 -->
				<div class="footer-wrap pd-20 mb-20 card-box">
					ePle MES made by <a href="https://github.com/dropways" target="_blank">아이티윌 부산 2023년 7월 프로젝트 2차 1조</a>
				</div>
				<%@ include file="../include/footer.jsp"%>
				<%@ include file="../include/datatable.jsp"%>
			</div>
		</div>
	</div>
</body>
</html>
