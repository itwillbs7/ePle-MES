<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/head.jsp"%>
<title>상세 정보</title>
</head>
<body>
<body>
	<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10">
			<button type="button" class="close" onclick="closePopup();">×</button>
			<!-- 타이틀 -->
			<div class="login-title">
				<h1 class="text-center text-primary mb-20">상세 정보</h1>
				<h4 class="text-center">${info.name}</h4>
			</div>

			<div class="row">
				<div class="col-sm-12">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>코드</th>
								<th>이름</th>
								<th>사용 수량</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="i">
								<tr>
									<td>${i.material}</td>
									<td>${i.materialName}</td>
									<td>${i.amount}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>

			<!-- 버튼 -->
			<div class="row">
				<div class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
					<button type="button" class="btn btn-success" onclick="javascript:openPage('/requirement/add?code=${info.code}', 500, 700)">
						<b>추가</b>
					</button>
					<button type="button" class="btn btn-warning" onclick="javascript:openPage('/requirement/update?code=${info.code}', 500, 700)">
						<b>수정</b>
					</button>
					<button type="button" class="btn btn-danger" onclick="javascript:openPage('/requirement/delete?code=${info.code}', 500, 700)">
						<b>삭제</b>
					</button>
				</div>
				<div class="col-sm-12 mb-3 justify-content-center btn-toolbar">
					<button type="button" class="btn btn-secondary btn-block" onclick="javascript:closePopup();">
						<b>닫기</b>
					</button>
				</div>
			</div>
			<!-- 버튼 -->
		</div>
	</div>
	<!-- 콘텐츠 끝> -->
	<%@ include file="../include/footer.jsp"%>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							window.resizeTo(outerWidth - innerWidth + 500,
									outerHeight - innerHeight
											+ $(".login-box").outerHeight()
											+ 12);
						});
	</script>
</body>
</html>