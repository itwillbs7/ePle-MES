<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../../include/head.jsp"%>
<title>신청 삭제</title>
</head>
<body>
	<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10">
		<button type="button" class="close" onclick="closePopup();">×</button>
			<!-- 타이틀 -->
			<div class="login-title">
				<h1 class="text-center text-primary">신청 삭제</h1>
				<h3 class="text-center">삭제 하시겠습니까?</h3>
			</div>
			<!-- 폼 -->
			<form method="post">
				<input type="hidden" name="code" value="${code}">
				<!-- 삭제 리스트 목록 -->
				<!-- 버튼 -->
				<div class="row">
					<div
						class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
						<button type="button" class="btn btn-secondary"
							onclick="closePopup();">
							<b>취소</b>
						</button>
						<button type="submit" class="btn btn-danger">
							<b>삭제</b>
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
					$("form").append("<input type='hidden' name='codeList' value='" + delList[i].value +"'>");
				}
			}
			// 닫기 진행!
			if (delCheckedCount == 0)
				closePopup();
			else {
				window.resizeTo(outerWidth - innerWidth + 500, outerHeight - innerHeight + $(".login-box").outerHeight() + 12);
			}
		}
		else{
			window.resizeTo(outerWidth - innerWidth + 500, outerHeight - innerHeight + $(".login-box").outerHeight() + 12);
		}
	</script>
</body>
</html>