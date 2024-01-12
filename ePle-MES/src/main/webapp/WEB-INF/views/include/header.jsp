<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 헤더 -->
<div class="header">
	<!-- 헤더 왼쪽 구간, 검색 -->
	<div class="header-left">
	
		<!-- 메뉴 펼치기 아이콘 -->
		<div class="menu-icon bi bi-list"></div>
	</div>
	
	<!-- 헤더 오른쪽 구간, 프로필&알림 등 -->
	<div class="header-right">
		<div class="dashboard-setting user-notification">
			<div class="dropdown">
				<a class="dropdown-toggle no-arrow" href="javascript:;"
					data-toggle="right-sidebar"> <i class="dw dw-settings2"></i>
				</a>
			</div>
		</div>
		<!-- 회원 정보 (드롭다운 포함) -->
		<div class="user-info-dropdown">
			<div class="dropdown">
				<a class="dropdown-toggle" href="#" role="button" data-toggle="dropdown">
					<span class="user-icon">
							<img src="${pageContext.request.contextPath}/resources/images/user.png" alt="" />
					</span> 
					<span class="user-name">직원명(부서나 사번 표시)</span>
				</a>
				<!-- 회원 드롭다운 -->
				<div class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list">
					<a class="dropdown-item" href="login.html">
						<i class="dw dw-logout"></i> 로그아웃</a>
				</div>
			</div>
		</div>
	</div>
</div>