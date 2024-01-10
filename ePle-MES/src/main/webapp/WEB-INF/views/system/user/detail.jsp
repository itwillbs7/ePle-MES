<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../../include/head.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<title>사용자(사원) 상세정보</title>
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
			<!-- 타이틀 -->
			<div class="login-title">
				<h1 class="text-center text-primary">사용자(사원) 상세정보</h1>
			</div>
			<!-- 폼 -->
			<form action="/system/user/update" method="post">
				<input type="hidden" value="${vo.dep_id }" name="dep_id">
				<input type="hidden" value="${vo.pos_id }" name="pos_id">
				<!-- 입력 구간 -->
				<div class="row">
					<div class="col-sm-12 mb-3">
						<!-- examples -->
						<div class="form-group">
							<label>사원코드</label> <input class="form-control" name="code" type="text" value="${vo.code }" readonly="readonly">
						</div>
						<div class="form-group">
							<label>권한</label> 
							<c:if test="${vo.auth==1 }"><input class="form-control" name="auth" type="text" value="사원" readonly></c:if>
							<c:if test="${vo.auth==2 }"><input class="form-control" name="auth" type="text" value="매니저" readonly></c:if>
							<c:if test="${vo.auth==3 }"><input class="form-control" name="auth" type="text" value="관리자" readonly></c:if>
						</div>
						<div class="form-group">
							<label>이름</label> <input class="form-control" name="name" value="${vo.name }" type="text" readonly>
						</div>
						<div class="form-group">
							<label>아이디</label> <input class="form-control" name="id" value="${vo.id }" type="text" readonly>
						</div>
						<div class="form-group">
							<label>비밀번호</label> <input class="form-control" name="pw" value="${vo.pw }" type="text" readonly>
						</div>
						<div class="form-group">
							<label>부서</label> <input class="form-control" name="dep_group" value="${vo.dep_group }" type="text" readonly>
						</div>
						<div class="form-group">
							<label>직책</label> <input class="form-control" name="pos_group" value="${vo.pos_group }" type="text" readonly>
						</div>
						<div class="form-group">
							<label>입사일</label> <input class="form-control" name="hiredate" value="${vo.hiredate }" type="text" readonly>
						</div>
						<div class="form-group">
							<label>휴대전화번호</label> <input class="form-control" name="phone" value="${vo.phone }" type="text" readonly>
						</div>
						<div class="form-group">
							<label>이메일</label> <input class="form-control" name="email" value="${vo.email }" type="text" readonly>
						</div>
						<div class="form-group">
							<label>주소</label> <input class="form-control" name="address" value="${vo.address }" type="text" readonly>
						</div>
						<div class="form-group">
							<label>사용여부</label> <input class="form-control" name="active" value="${vo.active }" type="text" readonly>
						</div>
					</div>
				</div>
				<!-- 입력 구간 -->

				<!-- 버튼 -->
				<div class="row">
					<div class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
						<button type="button" class="btn btn-secondary" onclick="window.close();">
							<b>취소</b>
						</button>
						<button type="button" class="btn btn-success" onclick="updateUser();">
							<b>수정</b>
						</button>
						<button type="button" class="btn btn-danger" onclick="deleteUser();">
							<b>삭제</b>
						</button>
					</div>
				</div>
				<!-- 버튼 -->
			</form>
			<!-- 폼 -->
		</div>
	</div>
	<!-- 콘텐츠 끝> -->
	<%@ include file="../../include/footer.jsp"%>
	<script type="text/javascript">
		function updateUser() {
			openPage("/system/user/update?index=${vo.code }",400, 700);
		}
		function deleteUser() {
			openPage("/system/user/delete?indexes=${vo.code }",400, 700);
		}
	</script>
</body>
</html>