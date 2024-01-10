<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../../include/head.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<title>사용자(사원) 수정</title>
</head>
<body>
	<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10">
			<!-- 타이틀 -->
			<div class="login-title">
				<h1 class="text-center text-primary">사용자(사원) 수정</h1>
			</div>
			<!-- 폼 -->
			<form action="/system/user/update" method="post" class="userForm">
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
							<label>권한</label><br>
							<select class="custom-select col-sm-12 mb-3" name="auth">
								<c:if test="${vo.auth == 1 }">
								<option selected value="${vo.auth }">현재 : 사원</option>
								</c:if>
								<c:if test="${vo.auth == 2 }">
								<option selected value="${vo.auth }">현재 : 매니저</option>
								</c:if>
								<c:if test="${vo.auth == 3 }">
								<option selected value="${vo.auth }">현재 : 관리자</option>
								</c:if>
								<option value="1">사원</option>
								<option value="2">매니저</option>
								<option value="3">관리자</option>
							</select>
						</div>
						<div class="form-group">
							<label>이름</label> <input class="form-control" name="name" value="${vo.name }" type="text">
						</div>
						<div class="form-group">
							<label>아이디</label> <input class="form-control" name="id" value="${vo.id }" type="text">
						</div>
						<div class="form-group">
							<label>비밀번호</label> <input class="form-control" name="pw" value="${vo.pw }" type="text">
						</div>
						<div class="form-group">
							<label>부서</label><br>
							<select class="custom-select col-sm-12 mb-3" name="dep">
									<option value="${vo.dep_group },${vo.dep_id}">현재 : ${vo.dep_group }</option>
								<c:forEach items="${DepList }" var="dep">
									<option value="${dep.code_name },${dep.code_id}">${dep.code_name }</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label>직책</label><br>
							<select class="custom-select col-sm-12 mb-3" name="pos">
									<option value="${vo.pos_group },${vo.pos_id}">현재 : ${vo.pos_group }</option>
								<c:forEach items="${PosList }" var="pos">
									<option value="${pos.code_name },${pos.code_id}">${pos.code_name }</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label for="date">입사일</label> 
							<input class="form-control " name="hiredate" type="date" id="date" 
							value="${vo.hiredate }" autocomplete="on" required="required">
						</div>
						<div class="form-group">
							<label>휴대전화번호</label> <input class="form-control" name="phone" value="${vo.phone }" type="text">
						</div>
						<div class="form-group">
							<label>이메일</label> <input class="form-control" name="email" value="${vo.email }" type="text">
						</div>
                        <!-- 우편번호 검색 버튼 및 결과 표시 -->
                        <div class="form-group">
                            <label>우편번호</label>
                            <input type="text" id="sample6_postcode" name="postcode" class="form-control" value="${postcode }">
                            <input type="button" onclick="sample6_execDaumPostcode()" class="btn btn-primary" value="주소 찾기">
                        </div>
                        <div class="form-group">
                            <label>주소</label>
                            <input type="text" id="sample6_address" name="address1" class="form-control" value="${address1 }">
                        </div>
                        <div class="form-group">
                            <label>상세주소</label>
                            <input type="text" id="sample6_detailAddress" name="address2" class="form-control" value="${address2 }">
                        </div>
						<div class="form-group">
							<label>사용여부</label><br>
							<c:if test="${vo.active==1 }">
								<input type="checkbox" checked="checked" class="switch-btn" data-color="#26bf36" data-size="large" name="activeCheckbox">
							</c:if>
							<c:if test="${vo.active==0 }">
								<input type="checkbox" class="switch-btn" data-color="#26bf36" data-size="large" name="activeCheckbox">
							</c:if>
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
						<button type="submit" class="btn btn-success">
							<b>확인</b>
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
</body>
</html>