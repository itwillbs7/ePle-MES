<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<html>
<head>
<%@ include file="../include/head.jsp"%>
<style>
.con:hover{
	background-color : #e1e1e1;
	cursor:pointer;
}
.click {
    color: blue;
}
</style>
<title>발주 요청 목록</title>
</head>
<body>

	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10">
		<button type="button" class="close" onclick="window.close();">×</button>

			<div class="login-title">
				<h1 class="text-center">발주 요청 목록</h1>
			</div>
			
			<div class="tab">
                <br>
                <h6 class="text-center click">발주코드를 선택해주세요!</h6>
                <br>
				
				<div class="tab-content">
			<!------------------------------- 목록 시작 ------------------------------->
			<table class="table table-striped" id="tableId">
			<thead>
				<tr>
					<th>발주코드</th>
					<th>품명</th>
					<th>발주량</th>
					<th>요청일</th>
				</tr>
			</thead>
			
			<tbody>
				<c:forEach items="${askOrderList}" var="vo" varStatus="loop">
				<tr>
					<td class="inInfo${vo.code} con"> ${vo.code }</td>
					<td class=""> ${vo.name }</td>
					<td class=""> ${vo.amount } ${vo.unit }</td>
					<td class=""> <fmt:formatDate value="${vo.date }" dateStyle="short" pattern="yyyy-MM-dd"/></td>
				</tr>
				</c:forEach>
				
			</tbody>
			</table>
			
		    <!------------------------------ 페이징 시작 ------------------------------>
				<div class="btn-toolbar justify-content-center mb-15">
				<c:if test="${pageVO.totalCount > 1}">
					<div class="btn-group">
						<c:if test="${pageVO.prev}">
							<a href="/material/orderBeforeAdd?page=${pageVO.startPage - 1}" class="btn btn-outline-primary prev"> 
								<i class="fa fa-angle-double-left"></i>
							</a>
						</c:if>
						<c:forEach begin="${pageVO.startPage}" end="${pageVO.endPage}" var="i" step="1">
							<a href="/material/orderBeforeAdd?page=${i}" class="btn btn-outline-primary ${pageVO.cri.page == i ? 'active' : ''}">
								${i} </a>
						</c:forEach>
						<c:if test="${pageVO.next}">
							<a href="/material/orderBeforeAdd?page=${pageVO.endPage + 1}" class="btn btn-outline-primary next"> 
								<i class="fa fa-angle-double-right"></i>
							</a>
						</c:if>
					</div>
				</c:if>
				</div>
					
				</div>
				<!------------------------------ 콘텐츠 끝 ------------------------------>
			</div>
		</div>
	</div>

	<%@ include file="../include/footer.jsp"%>
	<script type="text/javascript">
	
	function retPopupSetting(width, height){
		// 만들 팝업창 width 크기의 1/2 만큼 보정값으로 빼주기
		popupX = Math.ceil((window.screen.width - width) / 2);
		// 만들 팝업창 height 크기의 1/2 만큼 보정값으로 빼주기
		popupY = Math.ceil((window.screen.height - height) / 2);

		var setting = "";
		setting += "toolbar=0,";
		setting += "scrollbars=0,";
		setting += "statusbar=0,";
		setting += "menubar=0,";
		setting += "resizeable=0,";
		setting += "width=" + width + ",";
		setting += "height=" + height + ",";
		setting += "top=" + popupY + ",";
		setting += "left=" + popupX;
		return setting;
	}

	function openPage(i, width, height) {
		set = retPopupSetting(width, height);
		return window.open(i, 'Popup_Window', set);
	}
		
	// 
$('body').on('click', '[class^="inInfo"]', function(){
    var code = $(this).text().trim();
    openPage("${pageContext.request.contextPath}/material/orderAdd?code=" + code, 800, 1000);
});

			
	
	
	
	</script>
</body>
</html>