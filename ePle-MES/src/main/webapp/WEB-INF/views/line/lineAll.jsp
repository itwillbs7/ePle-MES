<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<%@ include file="../include/head.jsp"%>
<title>라인 관리</title>
</head>
<body>
	<!-- 공통, css 및 js 추가 시 /include/header, footer에서 삽입 -->
	<%@ include file="../include/header.jsp"%>
	<%@ include file="../include/right-side-bar.jsp"%>
	<%@ include file="../include/left-side-bar.jsp"%>
	<!-- 메인 컨테이너 -->
	<div class="main-container">
		<div class="pd-ltr-20 xs-pd-20-10">
			<div class="title" style="margin-bottom: 10px;">
				<h1>라인 관리</h1>
			</div>
			<div class="min-height-200px">

				<!-- Checkbox select Datatable start -->
				<div class="card-box mb-30">
					<div class="pd-20">
						<div class="btn-group pull-right" style="margin-bottom: 10px">
							<button type="button" class="btn btn-success" id="add">
								<b>추가</b>
							</button>
							<button type="button" class="btn btn-warning" id="update">
								<b>수정</b>
							</button>
							<button type="button" class="btn btn-danger" id="delete">
								<b>삭제</b>
							</button>
						</div>
					</div>
					<div class="pb-20">
						<div class="col-sm-30">
							<form class="table" id="table">
								<table class="table table-striped">
									<tr>
										<td style="width: 100px;">
											<div class="custom-control custom-checkbox mb-5">
												<input type="checkbox" class="custom-control-input" id="tableCheckAll"> <label class="custom-control-label" for="tableCheckAll"></label>
											</div>
										</td>
										<th>라인 코드</th>
										<th>라인명</th>
										<th>공정</th>
										<th>작업장</th>
										<th>설비상태</th>
										<th>비고</th>
										<th>사용여부</th>
										<th>상세보기</th>
									</tr>
									<c:forEach var="line" items="${lineList}" varStatus="loop">
									    <tr>
											<!-- 리스트 표, 1페이지에 몇개 조회 가능하게 할 지는 정해도 될 거 같음 -->
											<td>
									            <div class="custom-control custom-checkbox mb-5">
									                <!-- id에 뒤에 el식으로 테이블 인덱스나, 번호 추가, value에 primary 붙이기  -->
									                <input type="checkbox" class="custom-control-input" id="checkTable${loop.index + 1}" name="tableCheck" value="${line.code}"> 
									                <label class="custom-control-label" for="checkTable${loop.index + 1}"></label>
									            </div>
									        </td>
									        <th>${line.code}</th>
									        <th>${line.name}</th>
									        <th>${line.process}</th>
									        <th>${line.place}</th>
									        
									        <th>
	 										   <c:choose>
		      									   <c:when test="${line.status}">
		      									      Y
		  										   </c:when>
		  										   
		      									   <c:otherwise>
		     										    N
											       </c:otherwise>
											   </c:choose>
									        </th>
									       
									        <th>${line.note}</th>
									        
									        <th>
	 										   <c:choose>
		      									   <c:when test="${line.active}">
		      									      Y
		  										   </c:when>
		  										   
		      									   <c:otherwise>
		     										    N
											       </c:otherwise>
											   </c:choose>
									       </th>
									       
									        <td>
												<button type="button" class="btn btn-info btn-sm" id="lineInfo">
													<b>...</b>
												</button>
											</td>
									    </tr>
									</c:forEach>
								</table>
							</form>

							<div class="btn-toolbar justify-content-center mb-15">
								<c:if test="${pageVO.totalCount > 1}">
									<div class="btn-group">
										<c:if test="${pageVO.prev}">
											<a href="javascript:pageMove(${pageVO.startPage - 1})" class="btn btn-outline-primary prev"> <i class="fa fa-angle-double-left"></i>
											</a>
										</c:if>
										<c:forEach begin="${pageVO.startPage}" end="${pageVO.endPage}" var="i">
											<c:if test="${pageVO.cri.page == i}">
												<span class="btn btn-primary current">${i}</span>
											</c:if>
											<c:if test="${pageVO.cri.page != i}">
												<a href="javascript:pageMove(${i})" class="btn btn-outline-primary">${i}</a>
											</c:if>
										</c:forEach>
										<c:if test="${pageVO.next}">
											<a href="javascript:pageMove(${pageVO.endPage + 1})" class="btn btn-outline-primary next"> <i class="fa fa-angle-double-right"></i>
											</a>
										</c:if>
									</div>
								</c:if>
							</div>
						</div>
					</div>
				</div>
				<!-- Checkbox select Datatable End -->
				<!-- 푸터 -->
				<div class="footer-wrap pd-20 mb-20 card-box">
					ePle MES made by <a href="https://github.com/dropways" target="_blank">아이티윌 부산 2023년 7월 프로젝트 2차 1조</a>
				</div>
				<%@ include file="../include/footer.jsp"%>
				<%@ include file="../include/datatable.jsp"%>
			</div>
		</div>
	</div>

	<!-- 추가, 수정, 삭제 -->
	<script type="text/javascript">
		var popupWidth, popupHeight, popupX, popupY, link;
		var set;

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

		$(document).ready(function() {
		    // 추가
		    $("#add").click(function() {
		        // 가로, 세로 설정
		        openPage("/line/add", 400, 700);
		    });

			// 수정
		    $("#update").click(function() {
		        // 체크된 체크박스의 값을 저장할 배열
		        var selectedCodes = [];

		        // 체크된 체크박스의 개수를 확인
		        var checkedCount = $("input[name='tableCheck']:checked").length;

		        // 체크된 체크박스가 하나 이상인 경우에만 처리
		        if (checkedCount > 0) {
		            // 체크된 체크박스의 값을 읽어와서 배열에 저장
		            $("input[name='tableCheck']:checked").each(function() {
		                selectedCodes.push($(this).val());
		            });

		            // 선택된 체크박스의 개수가 1인 경우에만 가로, 세로 설정 및 URL에 코드 추가하여 팝업 열기
		            if (selectedCodes.length === 1) {
		                openPage("/line/update?code=" + selectedCodes[0], 400, 700);
		            } else {
		                // 선택된 체크박스가 1개가 아니면 경고 메시지 출력 또는 원하는 동작 수행
		                alert("수정할 항목을 1개만 선택해주세요.");
		            }
		        } else {
		            // 체크박스를 선택하지 않았을 때 경고 메시지 출력 또는 원하는 동작 수행
		            alert("수정할 항목을 선택해주세요.");
		        }
		    });

		 	// 삭제
		    $("#delete").click(function() {
		        // 체크된 체크박스의 값을 저장할 배열
		        var selectedCodes = [];

		        // 체크된 체크박스의 개수를 확인
		        var checkedCount = $("input[name='tableCheck']:checked").length;

		        // 체크된 체크박스가 하나 이상인 경우에만 처리
		        if (checkedCount > 0) {
		            // 체크된 체크박스의 값을 읽어와서 배열에 저장
		            $("input[name='tableCheck']:checked").each(function() {
		                selectedCodes.push($(this).val());
		            });

		            // Here, you can call openPage or perform any other actions before deletion
		            openPage("/line/delete?code=" + selectedCodes.join(","), 400, 300);
		            
		            // Note: Use window.location.replace() for a more reliable redirect after confirmation
		            // window.location.replace(deleteUrl);
		        } else {
		            // 체크박스를 선택하지 않았을 때 경고 메시지 출력 또는 원하는 동작 수행
		            alert("삭제할 항목을 선택해주세요.");
		        }
		    });
		 	
			// 상세보기
		    $(".btn-info").click(function() {
		        // 현재 클릭된 버튼이 속한 행에서 코드 값을 읽어와서 상세보기 페이지로 이동
		        var code = $(this).closest("tr").find("input[name='tableCheck']").val();

		        if (code) {
		            openPage("/line/lineInfo?code=" + code, 400, 700);
		        } else {
		            alert("코드를 찾을 수 없습니다.");
		        }
		    });
		 	
		});

	</script>
</body>
</html>
