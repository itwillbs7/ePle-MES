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
						<li><a href="/production/instruction">작업지시 관리</a></li>
						<li><a href="/production/result">실적 관리</a></li>
					</ul></li>

				<!-- 드롭다운 -->
				<li class="dropdown"><a href="javascript:;" class="dropdown-toggle"> <span class="micon bi bi-archive"></span><span class="mtext">자재 관리</span>
				</a>
					<ul class="submenu">
						<li><a href="/material/orderList">발주 관리</a></li>
						<li><a href="/material/inList">입출고 관리</a></li>
						<li><a href="/stock/list">재고 관리</a></li>
						<li><a href="/stock/warehouseList">창고 목록</a></li>
					</ul></li>

				<!-- 드롭다운 -->
				<li class="dropdown"><a href="javascript:;" class="dropdown-toggle"> <span class="micon bi bi-file-bar-graph"></span><span class="mtext">영업 관리</span>
				</a>
					<ul class="submenu">
						<li><a href="/request/list">수주관리</a></li>
						<li><a href="/shipment/list">출하관리</a></li>
						<li><a href="/returns/list">반품관리</a></li>
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
				<li class="dropdown"><a href="javascript:;" class="dropdown-toggle"> <span class="micon bi bi-briefcase"></span><span class="mtext">기준정보 관리</span>
				</a>
				
					<ul class="submenu">
						<li><a href="/product/productAll">품목 정보 관리</a></li>
						<li><a href="/requirement/requirementAll">소요량 관리</a></li>
						<li><a href="/line/lineAll">라인 정보 관리</a></li>
						<li><a href="/client/clientAll">거래처 정보 관리</a></li>
					</ul></li>
					
				<!-- 드롭다운 -->
				<li class="dropdown"><a href="javascript:;" class="dropdown-toggle"> <span class="micon bi bi-server"></span><span class="mtext">시스템 관리</span>
				</a>
					<ul class="submenu">
						<li><a href="/system/common/main">공통코드 관리</a></li>
						<li><a href="/system/user/main">사용자 관리</a></li>
					</ul></li>
				
				<li><a href="/line/status" class="dropdown-toggle no-arrow"> <span class="micon bi bi-command"></span> <span class="mtext">라인 관리</span>
				</a></li>
			</ul>
		</div>
	</div>
</div>
<div class="mobile-menu-overlay"></div>
