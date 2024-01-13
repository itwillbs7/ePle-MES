<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../../include/head.jsp"%>
<title>라인 가동</title>
</head>
<body>
<c:if test="${sessionScope.id eq null}">
	<c:redirect url="/" />
</c:if>
	<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10">
		<button type="button" class="close" onclick="closePopup();">×</button>
			<!-- 타이틀 -->
			<div class="login-title">
				<h1 class="text-center text-primary">라인 가동</h1>
			</div>
			<!-- 폼 -->
			<form action="/line/manage/on" method="post">
				<!-- 리스트 목록 -->
				<div class="row">
					<div class="col-sm-12 mb-3">
						<div class="form-group">
							<ul class="list-group">
								<c:if test="${!empty info}">
									<li class="list-group-item">${info.code} : ${info.name}(${info.place})</li>
									<input type="hidden" name="code" value="${info.code}">
								</c:if>
							</ul>
						</div>
					</div>
				</div>
				<!-- 리스트 목록 -->
				
				<!-- 버튼 -->
				<div class="row">
					<div
						class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
						<button type="button" class="btn btn-secondary"
							onclick="closePopup();">
							<b>취소</b>
						</button>
						<button type="submit" class="btn btn-primary">
							<b>가동</b>
						</button>
					</div>
				</div>
				<!-- 버튼 -->
			</form>
			<!-- 폼 -->
		</div>
	</div>
	<!-- 콘텐츠 끝 -->
	<%@ include file="../../include/footer.jsp"%>
	<script type="text/javascript">
		var listHtml = "<li class='list-group-item'>"
		// get으로 불러온 인덱스가 있는 경우 인덱스 우선 진행

		var del = "<c:out value='${info}'/>";
		if(del == null || del == ''){
			// 부모의 체크박스 목록 불러오기
			var delList = opener.document.getElementsByName('tableCheck');
			
			// 체크박스 checked 개수
			var delCheckedCount = 0;

			for (var i = 0; i < delList.length; i++) {
				if (delList[i].checked) { // == true
					delCheckedCount++;
					let title = opener.document.getElementById('tableTitle' + delList[i].value);
					let info = opener.document.getElementById('tableinfo' + delList[i].value);
					$(".list-group").append(listHtml + delList[i].value + "&nbsp;:&nbsp;"+title.innerText + "(" + info.innerText + ")" + "</li>");
					$("form").append("<input type='hidden' name='code' value='" + delList[i].value +"'>");
				}
			}
			// 닫기 진행!
			if (delCheckedCount == 0)
				closePopup();
			else {
				window.resizeTo(outerWidth - innerWidth + 500, outerHeight - innerHeight + $(".login-box").outerHeight() + 11);
			}
		}
		else{
			window.resizeTo(outerWidth - innerWidth + 500, outerHeight - innerHeight + $(".login-box").outerHeight() + 11);
		}
	</script>
</body>
</html>