<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../../include/head.jsp"%>
<title>보전 예약</title>
<!-- 
	실행 방법
		- 테이블 페이지의 옵션에서 삭제클릭
		- 상세 정보에서 삭제 클릭
 -->
</head>
<body>
	<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10">
			<button type="button" class="close" onclick="window.close();">×</button>
			<div class="pd-20">
				<!-- 타이틀 -->
				<div class="login-title">
					<h1 class="text-center text-primary">보전 예약</h1>
				</div>
				<form action="/facility/maintenance/reservation" method="post">
					<!-- 보전 목록 -->
					<!-- 완료되지 않고 예약되지 않은 보전 목록만 표시 -->
					<div class="row">
						<div class="col-sm-12 mb-6">
							<div class="form-group">
								<label><b>보전 목록</b></label> <select class="custom-select2 form-control" name="fac_code" style="width: 100%; height: 38px">
									<option value="None">선택</option>
									<c:if test="${!empty m_list}">
										<c:forEach items="${m_list}" var="i">
											<option value="${i.code}">${i.emp_name}-${i.fac_name}(${i.facility.model})</option>
										</c:forEach>
									</c:if>
								</select>
							</div>
						</div>
					</div>
					<!-- 보전 목록 -->
					<!-- 일정 설정 -->
					<div class="form-group">
						<label><b>일정</b></label> <input class="form-control date-picker" data-language="ko" placeholder="일정 선택" type="text" />
					</div>
					<div class="row">
						<div class="col-sm-12 mb-3 justify-content-center">
							<div class="form-group">
								<label><b>예약 시간</b></label> <input class="form-control time-picker-default" placeholder="time" type="text" />
							</div>
						</div>
					</div>
					<!-- 일정 설정 -->
					<!-- 버튼 -->
					<div class="row">
						<div class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
							<button type="button" class="btn btn-secondary" onclick="window.close();">
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
		</div>
		<!-- 콘텐츠 끝> -->
		<%@ include file="../../include/footer.jsp"%>
	</div>
	<script type="text/javascript">
		$(function() {
			$(".date-picker").datepicker({
				format : 'YYYY-MM-DD'
			});
		});
	</script>
</body>
</html>