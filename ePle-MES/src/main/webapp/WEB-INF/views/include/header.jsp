<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${sessionScope.id eq null}">
	<c:redirect url="/" />
</c:if>
<!-- 헤더 -->
<div class="header">
	<!-- 헤더 왼쪽 구간, 검색 -->
	<div class="header-left">
		<!-- 메뉴 펼치기 아이콘 -->
		<div class="menu-icon bi bi-list"></div>
	</div>
	<!-- 헤더 오른쪽 구간, 프로필&알림 등 -->
	<div class="header-right">
		<!-- 회원 정보 (드롭다운 포함) -->
		<div class="user-info-dropdown">
			<div class="dropdown">
				<a class="dropdown-toggle" href="#" role="button" data-toggle="dropdown">
					<span class="user-icon">
							<img src="${pageContext.request.contextPath}/resources/images/user.png" alt="" />
					</span> 
					<span class="user-name">${name}(${dep_group})</span>
				</a>
				<!-- 회원 드롭다운 -->
				<div class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list">
					<!-- 계정 로그인 되었을 때 -->	
					<a class="dropdown-item" href="/logout">
						<i class="dw dw-logout"></i> 로그아웃</a>
					<!-- 계정 로그인 되었을 때 -->	
				</div>
			</div>
		</div>
	</div>
</div>