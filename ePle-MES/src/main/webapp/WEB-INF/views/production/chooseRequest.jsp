<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/head.jsp"%>
<title>수주정보 선택</title>
</head>
<body>
	<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10" style="max-width: 1200px">
			<!-- 타이틀 -->
			<div class="login-title">
				<h1 class="text-center text-primary">수주정보 선택</h1>
			</div>
			<!-- 폼 -->
			<form method="post">
				<div class="row">
					<!-- 검색구간 -->
				</div>
				<div class="row" style="width: 100%">
					<!-- <table class="table table-striped"> -->
					<table class="data-table table hover select-row nowrap table-striped">
						<thead>
							<tr>
								<th>수주번호</th>
								<th>수주업체명</th>
								<th>수주일자</th>
								<th>납품예정일</th>
								<th>품번</th>
								<th>품명</th>
								<th>수주수량</th>
								<th>재고량</th>
								<th>과부족</th>
								<th>수주상태</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${List}" var="List" varStatus="status">
								<tr class="request">
									<th class="info${status.index}" style="color: blue; text-decoration: underline;">${List.code }<input class="hiddenCode" type="hidden" value="${List.code }"></th>
									<th>${List.clientName }</th>
									<th>${List.date }</th>
									<th>${List.deadline }</th>
									<th>${List.product }</th>
									<th>${List.productName }</th>
									<th>${List.amount }</th>
									<th>${List.stock }</th>
									<th class="diff">${List.stock - List.amount }</th>
									<th>${List.status }</th>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="row">
					<div class="col-sm-12 col-md-5">
						<div class="dataTables_info" id="DataTables_Table_0_info" role="status" aria-live="polite">전체 수주 ${pageVO.totalCount}개 중 (${List.size() }) 개</div>
					</div>
				</div>
				<div class="btn-toolbar justify-content-center mb-15">
					<c:if test="${pageVO.totalCount > 1}">
						<div class="btn-group">
							<c:if test="${pageVo.prev }">
								<a href="/production/chooseRequest?page=${pageVO.startPage - 1 }" class="btn btn-outline-primary prev"><i class="fa fa-angle-double-left"></i></a>
							</c:if>
							<c:forEach begin="${pageVO.startPage }" end="${pageVO.endPage }" step="1" var="i">
								<c:if test="${pageVO.cri.page == i }">
									<span class="btn btn-primary current">${i }</span>
								</c:if>
								<c:if test="${pageVO.cri.page != i}">
									<a href="/production/chooseRequest?page=${i}" class="btn btn-outline-primary">${i}</a>
								</c:if>
							</c:forEach>
							<c:if test="${pageVO.next }">
								<a href="/production/chooseRequest?page=${pageVO.endPage + 1 }" class="btn btn-outline-primary next"><i class="fa fa-angle-double-right"></i></a>
							</c:if>
						</div>
					</c:if>
				</div>
				<!-- 버튼 -->
				<div class="row">
					<div class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
						<button type="button" class="btn btn-secondary" onclick="window.close();">
							<b>취소</b>
						</button>
						<button type="button" class="btn btn-success" id="submit" disabled onclick="sendMessageToParent()">
							<b>선택</b>
						</button>
					</div>
				</div>
				<!-- 버튼 -->
			</form>
			<!-- 폼 -->
		</div>
	</div>
	<!-- 콘텐츠 끝> -->
	<%@ include file="../include/footer.jsp"%>
	<%@ include file="../include/datatable.jsp"%>
	<script type="text/javascript">
		$(function() {
			$('#DataTables_Table_0_wrapper').width('100%');
			$('#DataTables_Table_0_wrapper').children().first().remove();
			$('#DataTables_Table_0_wrapper').children().last().remove();
		});
	</script>
	<script type="text/javascript">
		$(".request").click(function(){
			if (!$(this).hasClass('selected')) {
				var code = $(this).find($(".hiddenCode")).val();
			    $("#submit").prop("disabled", false);
	        }else{
			    $("#submit").prop("disabled", true);
	        }
		});
	</script>
	<script type="text/javascript">
		function sendMessageToParent() {
			var code = $("tr.selected").find($(".hiddenCode")).val();
	        window.opener.postMessage({ code: code, conditionMet: true }, '*');
	        window.close();
	    }
	</script>
</body>
</html>