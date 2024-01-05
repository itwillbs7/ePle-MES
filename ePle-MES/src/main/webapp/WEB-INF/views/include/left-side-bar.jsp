<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!-- 좌측 사이드 바(메뉴) -->
<div class="left-side-bar">

	<!-- 로고(메인 페이지 이동) -->
	<div class="brand-logo">
		<a href="/"> <!-- 로고 이미지 svg --> <img src="${pageContext.request.contextPath}/resources/vendors/images/deskapp-logo.svg" alt="" class="dark-logo" /> <img src="${pageContext.request.contextPath}/resources/vendors/images/deskapp-logo-white.svg" alt="" class="light-logo" />
		</a>

		<!-- 메뉴 사이드바 닫기 -->
		<div class="close-sidebar" data-toggle="left-sidebar-close">
			<i class="ion-close-round"></i>
		</div>
	</div>

	<!-- 메뉴 블록 -->
	<div class="menu-block customscroll">
		<div class="sidebar-menu">
			<ul id="accordion-menu">

				<!-- 메뉴 -->

				<!-- 단일 메뉴 -->
				<li><a href="/" class="dropdown-toggle no-arrow"> <span class="micon bi bi-house"></span> <span class="mtext">메인</span>
				</a></li>

				<!-- 드롭다운 -->
				<li class="dropdown"><a href="javascript:;" class="dropdown-toggle"> <span class="micon bi bi-gear-wide-connected"></span><span class="mtext">생산 관리</span>
				</a>
					<ul class="submenu">
						<li><a href="index.html">Dashboard style 1</a></li>
						<li><a href="index2.html">Dashboard style 2</a></li>
						<li><a href="index3.html">Dashboard style 3</a></li>
					</ul></li>
				<!-- 드롭다운 -->
				<li class="dropdown"><a href="javascript:;" class="dropdown-toggle"> <span class="micon bi bi-clipboard2-plus"></span><span class="mtext">발주 관리</span>
				</a>
					<ul class="submenu">
						<li><a href="index.html">Dashboard style 1</a></li>
						<li><a href="index2.html">Dashboard style 2</a></li>
						<li><a href="index3.html">Dashboard style 3</a></li>
					</ul></li>

				<!-- 드롭다운 -->
				<li class="dropdown"><a href="javascript:;" class="dropdown-toggle"> <span class="micon bi bi-archive"></span><span class="mtext">자재 관리</span>
				</a>
					<ul class="submenu">
						<li><a href="index.html">Dashboard style 1</a></li>
						<li><a href="index2.html">Dashboard style 2</a></li>
						<li><a href="index3.html">Dashboard style 3</a></li>
					</ul></li>

				<!-- 드롭다운 -->
				<li class="dropdown"><a href="javascript:;" class="dropdown-toggle"> <span class="micon bi bi-file-bar-graph"></span><span class="mtext">영업 관리</span>
				</a>
					<ul class="submenu">
						<li><a href="index.html">Dashboard style 1</a></li>
						<li><a href="index2.html">Dashboard style 2</a></li>
						<li><a href="index3.html">Dashboard style 3</a></li>
					</ul></li>
				<!-- 드롭다운 -->
				<li class="dropdown"><a href="javascript:;" class="dropdown-toggle"> <span class="micon bi bi-wrench-adjustable-circle"></span><span class="mtext">설비 관리</span>
				</a>
					<ul class="submenu">
						<li><a href="/facility/info/list">설비 정보</a></li>
						<li><a href="/facility/mt/main">보전</a></li>
						<li><a href="/facility/order/list">발주 신청</a></li>
					</ul></li>

				<!-- 드롭다운 -->
				<li class="dropdown"><a href="javascript:;" class="dropdown-toggle"> <span class="micon bi bi-server"></span><span class="mtext">시스템 관리</span>
				</a>
					<ul class="submenu">
						<li><a href="index.html">Dashboard style 1</a></li>
						<li><a href="index2.html">Dashboard style 2</a></li>
						<li><a href="index3.html">Dashboard style 3</a></li>
					</ul></li>

			</ul>
		</div>
	</div>
</div>
<div class="mobile-menu-overlay"></div>
