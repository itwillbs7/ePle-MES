<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<%@ include file="../include/head.jsp"%>
<%-- <link href="${pageContext.requeset.contextPath }/resources/css/default.css" rel="stylesheet" type"text/css"> --%>
<title>수주 관리</title>
</head>
<body>
	<!-- 공통, css 및 js 추가 시 /include/header, footer에서 삽입 -->
	<%@ include file="../include/header.jsp"%>
	<%@ include file="../include/right-side-bar.jsp"%>
	<%@ include file="../include/left-side-bar.jsp"%>
	<!-- 비로그인 거름망 -->
<%-- <c:if test="${empty id}" > --%>
<%-- 	<c:redirect url="/main/login"/> --%>
<%-- </c:if> --%>
	<!-- 메인 컨테이너 -->
	<div class="main-container">
		<div class="pd-ltr-20 xs-pd-20-10">
			<div class="title" style="margin-bottom: 10px;">
				<h1>수주 관리</h1>
			</div>
			<div class="min-height-200px">
				<br>
				<div class="alert alert-success alert-dismissible fade show" role="alert" style="display:none" id="successalert">
					<strong>수주 등록</strong>이 완료되었습니다!
					<button type="button" class="close" data-dismiss="alert" aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="alert alert-info alert-dismissible fade show" role="alert" style="display:none" id="updatealert">
					<strong>수주 수정</strong>이 완료되었습니다!
					<button type="button" class="close" data-dismiss="alert" aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="alert alert-warning alert-dismissible fade show" role="alert" style="display:none" id="notdelete">
					<strong>수주 삭제</strong>가 완료되지 않았습니다!
					<button type="button" class="close" data-dismiss="alert" aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="alert alert-warning alert-dismissible fade show" role="alert" style="display:none" id="deletealert">
					<strong>수주 삭제</strong>가 완료되었습니다!
					<button type="button" class="close" data-dismiss="alert" aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<!-- 아코디언 시작 -->
				<div class="faq-wrap">
					<div id="accordion">
						<div class="card">
							<div class="card-header">
								<button class="btn btn-block collapsed" data-toggle="collapse" data-target="#faq1" aria-expanded="false">
									<b>검색</b>
								</button>
							</div>
							<div id="faq1" class="collapse" data-parent="#accordion" style="">
								<div class="card-body">
								
									<form id="accordion-search" method="get" action="/request/search">
										<div class="col-md-12">
											<div class="form-group">
												<div class="row">
													<h4 class="text-blue h4">기본 검색</h4>
													<div class="col-md-5 col-sm-12 btn-group" style="margin-left: auto;">
														<label>업체명</label> 
														<input type="hidden"  name="client_code" id="client_code"> 
														<input type="text" name="clientName" class="form-control"  id="searchCompany"
														style="width: 100%;" placeholder="업체명 찾아보기" autocomplete="off" readonly>
													</div>
													<div class="col-md-5 col-sm-12 btn-group" style="margin-left: auto;">
														<label>품명</label> 
														<input type="hidden" name="product" id="product"> 
														<input type="text" name="productName" class="form-control" id="searchProduct" 
														style="width: 100%;" placeholder="품명 찾아보기" autocomplete="off" readonly>
													</div>
													<div class="col-md-5 col-sm-12 btn-group" style="margin-left: auto;">
														<label>담당자</label> 
														<input type="hidden" name="manager" id="manager"> 
														<input type="text" name="managerName" class="form-control"  id="searchManager" 
														style="width: 100%;" placeholder="담당자 찾아보기" autocomplete="off" readonly>
													</div>
												</div>
												<div class="row">
													<div class="col-md-1 col-sm-12">
														<label class="weight-600">수주 상태</label>
													<div class="col-md-1 col-sm-12" style="margin-top: auto;">
														<div class="custom-control custom-checkbox mb-5">
															<input type="checkbox" class="custom-control-input" id="formCheck1" name="statusList" value="등록"> 
															<label class="custom-control-label" for="formCheck1">등록</label>
														</div>
														<div class="custom-control custom-checkbox mb-5">
															<input type="checkbox" class="custom-control-input" id="formCheck2" name="statusList" value="생산진행"> 
															<label class="custom-control-label" for="formCheck2">생산진행</label>
														</div>
													</div>
													<div class="col-md-1 col-sm-12" style="margin-top: auto;">
														<div class="custom-control custom-checkbox mb-5">
															<input type="checkbox" class="custom-control-input" id="formCheck3" name="statusList" value="출하대기"> 
															<label class="custom-control-label" for="formCheck3">출하대기</label>
														</div>
														<div class="custom-control custom-checkbox mb-5">
															<input type="checkbox" class="custom-control-input" id="formCheck4" name="statusList" value="출하완료"> 
															<label class="custom-control-label" for="formCheck4">출하완료</label>
														</div>
													</div>	
													<div class="col-md-1 col-sm-12" style="margin-top: auto;">
														<div class="custom-control custom-checkbox mb-5">
															<input type="checkbox" class="custom-control-input" id="formCheck5" name="statusList" value="수령"> 
															<label class="custom-control-label" for="formCheck5">수령</label>
														</div>
														<div class="custom-control custom-checkbox mb-5">
															<input type="checkbox" class="custom-control-input" id="formCheck6" name="statusList" value="반품"> 
															<label class="custom-control-label" for="formCheck6">반품</label>
														</div>
													</div>										
													</div>
													<div class="col-md-2 col-sm-12">
														<div class="form-group">
															<label>수주일자</label> 
															<input class="form-control " placeholder="Select Month" 
															type="date" name="startDate" autocomplete="off" id="startDate"> ~ 
															<input class="form-control " placeholder="Select Month" 
															type="date" name="endDate" autocomplete="off" id="endDate">
														</div>
														<div class="form-group">
															<label>납품예정일</label> 
															<input class="form-control " placeholder="Select Month" 
															type="date" name="startDead" autocomplete="off" id="deadline"> ~ 
															<input class="form-control" placeholder="Select Month" 
															type="date" name="endDead" autocomplete="off" id="deadline">
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="btn-group pull-right" style="margin-bottom: 10px">
											<button type="submit" class="btn btn-primary" id="search">
												<b>검색</b>
											</button>
											<button type="reset" class="btn btn-secondary" id="reset">
												<b>초기화</b>
											</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 아코디언 끝 -->
				
				<!-- Checkbox select Datatable start -->
				<div class="card-box mb-30">
					<div class="pd-20">
						<div class="btn-group pull-right" style="margin-bottom: 10px">
							<button type="button" class="btn btn-success" id="add">
								<b>추가</b>
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
								<thead>
									<tr>
										<td style="width: 100px;">
											<div class="custom-control custom-checkbox mb-5">
												<input type="checkbox" class="custom-control-input" id="tableCheckAll"> 
												<label class="custom-control-label" for="tableCheckAll"></label>
											</div>
										</td>
										<th>수주번호</th>
										<th>수주업체명</th>
										<th>수주일자</th>
										<th>납품예정일</th>
										<th>품번</th>
										<th>품명</th>
										<th>수주수량</th>
										<th>재고량</th>
										<th>과부족</th>
										<th>수주상태</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach items="${List}" var="List" varStatus="status">
									<tr>
										<!-- 리스트 표, 1페이지에 몇개 조회 가능하게 할 지는 정해도 될 거 같음 -->
							<c:choose>
							<c:when test="${List.status eq '등록'}">
							<td><div class="custom-control custom-checkbox mb-5">
							<!-- id에 뒤에 el식으로 테이블 인덱스나, 번호 추가, value에 primary 붙이기  -->
									<input type="checkbox" class="custom-control-input" id="checkTable${status.index}" 
									name="tableCheck" value="${List.code }"> 
									<label class="custom-control-label" for="checkTable${status.index}"></label>
									</div></td>
							</c:when>
							<c:otherwise>
							<td></td>
							</c:otherwise>
							</c:choose>
										<!-- 상세 정보 이동! -->
										<th class="info${status.index}" style="color: blue; text-decoration: underline;">${List.code }</th> 
										<th>${List.clientName }</th> 
										<th>${List.date }</th> 
										<th>${List.deadline }</th> 
 										<th>${List.product }</th> 
 										<th>${List.productName }</th> 
										<th>${List.amount }</th> 
										<th>${List.stock }</th>
 										<th class="diff">${List.stock - List.amount }</th>
										<th>${List.status }</th> 
										
									</tr>
								</c:forEach>
								</tbody>
								</table>
							</form>
							<div class="row">
								<div class="col-sm-12 col-md-5">
									<div class="dataTables_info" id="DataTables_Table_0_info" role="status" aria-live="polite">
									전체 수주 ${pageVO.totalCount}개 중 (검색 결과) 개</div>
								</div>
							</div>
							<div class="btn-toolbar justify-content-center mb-15">
								<div class="btn-group">
								<c:if test="${pageVo.prev }">
									<a href="/request/list?page=${pageVO.startPage - 1 }" class="btn btn-outline-primary prev"><i class="fa fa-angle-double-left"></i></a> 
								</c:if>
								<c:forEach begin="${pageVO.startPage }" end="${pageVO.endPage }" step="1" var="i"> 
						
									<a href="#"  ${pageVO.cri.page == i? "class='btn btn-primary'" :""}>${i}</a> 
									
								</c:forEach>
								<c:if test="${pageVO.next }">
									<a href="/request/list?page=${pageVO.endPage + 1 }" class="btn btn-outline-primary next"><i class="fa fa-angle-double-right"></i></a>
								</c:if>
								</div>
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
	
<!-- list 내 처리 -->
	<script type="text/javascript" >
	
	window.onload = function() {
	    if (localStorage.getItem('success') === 'true') {
	        var successAlert = document.getElementById('successalert');
	        if (successAlert) {
	            successAlert.style.display = 'block';
	        }
	        // 'success' 키의 값을 삭제하여, 다음 페이지 로드에 'successalert' 요소가 표시되지 않도록 합니다.
	        localStorage.removeItem('success');
	    }
	    if (localStorage.getItem('updateDone') === 'true') {
	        var updateAlert = document.getElementById('updatealert');
	        if (updateAlert) {
	        	updateAlert.style.display = 'block';
	        }
	        // 'success' 키의 값을 삭제하여, 다음 페이지 로드에 'successalert' 요소가 표시되지 않도록 합니다.
	        localStorage.removeItem('updateDone');
	    }
	    
	};
	</script>
		
	<!-- 추가, 수정, 삭제, 상세보기 -->
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
			return window.open(i, 'Popup_Window', set); // 가운데거가 이름이 똑같으면 같은창에서 열림
		}

			// .diff = 과부족
			$(".diff").each(function() {
			    var diff = parseInt($(this).text());
			    if (diff < 0) {
			      $(this).css("color", "red");
			    } else if (diff > 0) {
			      $(this).prepend("+");
			      $(this).css("color", "green");
			    }
			  });
			
		$(document).ready(function() {
	    	 
			// 추가
			$("#add").click(function() {openPage("/request/add", 400, 700);});

			// 수정
			$("#update").click(function() {openPage("/request/update", 400, 700);});

			// 삭제
			 $("#delete").click(function() {
				var deleteList = [];
			    $("input:checkbox[name=tableCheck]:checked").each(function() {
			        deleteList.push($(this).val());
			    });
			    if (deleteList.length > 0) {
			        openPage("/request/delete?code="+deleteList.join(','), 400, 700);
			    } else {
			    	alert('삭제 실패');
			    }
			});
				
			

			// 상세보기
			$('body').on('click', '[class^="info"]', function(){
        		var code = $(this).text().trim();
      		  openPage("/request/info?code=" + code, 400, 700); });
			

			
			// 각각의 검색창
			// 업체검색
			$("#searchCompany").click(function() {openPage("/request/searchClient", 400,700); });
			
			// 제품검색
			$("#searchProduct").click(function() {openPage("/request/searchProduct", 400,700); });
			
			// 사원검색
			$("#searchManager").click(function() {openPage("/request/searchManager", 400,700); });
			
			
		});	
		
	</script>
	<!-- 검색은 ajax -->
	
<script type="text/javascript"> 
$('#accordion-search').on('submit', function(e) {
	alert('ajax 시작 전');
	e.preventDefault();  // form의 기본 submit 이벤트를 막습니다.
	let statusList = [];
	$('input[name="statusList"]:checked').each(function() {
	    statusList.push($(this).val());
	});

	let statusListJson = JSON.stringify(statusList);


    $.ajax({
        url: $(this).attr('action'),  
        type: $(this).attr('method'),  
        data: $(this).serialize(),  
        success: function(data) {
        	alert(data);
        	 var table = '';
	            $.each(data, function(index, item) {			
	                table += '<tr>';
	                table += '<td><div class="custom-control custom-checkbox mb-5">';
	                table += '<input type="checkbox" class="custom-control-input" id="checkTable'+index+'" name="tableCheck" value="'+item.code+'"></label>';
	                table += '<label class="custom-control-label" for="checkTable'+index+'"></label></div></td>';
	                table += '<th class="info'+index+'" style="color: blue; text-decoration: underline;">'+item.code+'</th> ';
	                table += '<th>'+item.clientName+'</th>';
	                table += '<th>'+item.date+'</th>';
	                table += '<th>'+item.deadline+'</th>';
	                table += '<th>'+item.product+'</th>';
	                table += '<th>'+item.productName+'</th>';
	                table += '<th>'+item.amount+'</th>';
	                table += '<th>'+item.stock+'</th>';
	                table += '<th class="diff">'+(item.stock - item.amount)+'</th>';
	                table += '<th>'+item.status+'</th>';
	                table += '</tr>';

	            });
	            
	            $('#table tbody').html(table);  
	            $(".diff").each(function() {
				    var diff = parseInt($(this).text());
				    if (diff < 0) {
				      $(this).css("color", "red");
				    } else if (diff > 0) {
				      $(this).prepend("+");
				      $(this).css("color", "green");
				    }
				  });
        },
        error: function(jqXHR, textStatus, errorThrown) {
            
        }
    });
});

</script>
</body>
</html>
