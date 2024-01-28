<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<html>
<head>
<%@ include file="../include/head.jsp"%>
<style>
  .table th,
  .table td {
    text-align: center;
  }
    .back {
  background-color: white !important;
}
#whCode{
margin-left:100px;
margin-right:50px;
}
#manager{
margin-left:20px;
margin-right:20px;
}
</style>
<title>재고 관리</title>
</head>
<body>
	<!----------------- 공통, css 및 js 추가 시 /include/header, footer에서 삽입 ----------------->
	<%@ include file="../include/header.jsp"%>
	<%@ include file="../include/right-side-bar.jsp"%>
	<%@ include file="../include/left-side-bar.jsp"%>
	
	<!------------------------------ 메인 컨테이너 ------------------------------>
	<div class="main-container" id="main-container">
	<div class="pd-ltr-20 xs-pd-20-10">
	<div class="row">
           <div class="col-md-12">
               <a href="${pageContext.request.contextPath}/stock/stockList"><h1>재고 관리</h1></a>
            </div>
            
            <div class="col-md-12">
               <nav aria-label="breadcrumb" role="navigation">
                  <ol class="breadcrumb">
                     <li class="breadcrumb-item">자재 관리</li>
                     <li class="breadcrumb-item active" aria-current="page"><b>재고 관리</b></li>
                  </ol>
               </nav>
            </div>
	</div>				
				
	<!------------------------- 추가 / 수정 / 삭제 버튼 ------------------------->
	<div class="pd-20 mb-20 card-box">
		<div class="tab">
		<ul class="nav nav-pills mb-20" role="tablist">
			<li class="nav-item"><a class="nav-link text-blue active" data-toggle="tab" href="#materialTab" role="tab" id="mat" aria-selected="true">원자재</a></li>
			<li class="nav-item" id="fac"><a class="nav-link text-blue" data-toggle="tab" href="#facilityTab" role="tab" id="fac" aria-selected="false">설비</a></li>
			<li class="nav-item" id="pro"><a class="nav-link text-blue" data-toggle="tab" href="#productTab" role="tab" id="pro" aria-selected="false">완제품</a></li>
		</ul>
				
<script>
$(document).ready(function() {

	fetchData("원자재"); //초기화
	
	$("#mat").click(function() {
        fetchData("원자재");
        console.log("원자재 탭 클릭됨");
    });

	$("#fac").click(function() {
        fetchData("설비");
        console.log("설비 탭 클릭됨");
    });
	
	$("#pro").click(function() {
        fetchData("완제품");
        console.log("완제품 탭 클릭됨");
    });

});

function fetchData(searchValue) {
	
    $.ajax({
        url: "/stock/stockList",
        type: "GET",
        data: {
            searchCode: searchValue,
            searchName: searchValue
        },
        success: function(data) {
            console.log(searchValue)
        	$("#materialTab").html($(data).find("#materialTab").html());
        	$("#facilityTab").html($(data).find("#facilityTab").html());
        	$("#productTab").html($(data).find("#productTab").html());
        },
        error: function(error) {
            console.error(error);
        }
    });
}
</script>
	<!----------------------------- 재고 리스트 출력 ---------------------------->
		<div class="tab-content">
	
				<!----------------------------- 자재탭 ---------------------------->
				<div class="tab-pane fade active show" id="materialTab" role="tabpanel">
					<table class="table" id="content">
						<tr>
							<th>구분</th>
							<th>품목코드</th>
							<th>품명</th>
							<th>현재고</th>
							<th>발주요청</th>
						</tr>

						<c:forEach items="${stockList}" var="vo">
						<c:if test="${vo.group_display eq '원자재'}">
						<tr>
							<th>${vo.group_display }</th>
							<th style="color: #FF1493; ">${vo.code }</th>
							<th>${vo.name }</th>
							<th>
								<c:if test="${vo.total < 100 and vo.total >= 0}">
									<b style="color: red;">${vo.total }</b>
								</c:if>
								<c:if test="${vo.total >= 100 }">
									${vo.total }
								</c:if>
								<c:if test="${vo.total < 0 }">
									<b style="color: red;">0</b>
								</c:if>
							</th>
							
							<th class="inInfo" data-code="${vo.code}">
    							<c:if test="${vo.total < 11}">
        							<button type="button" class="btn btn-primary btn-sm" value="${vo.code}"><b>발주요청</b></button>
    							</c:if>
							</th>

						</tr>
						</c:if>
						</c:forEach>
							
					</table>

				<div class="btn-toolbar justify-content-center mb-15">
    				<div class="btn-group">
        				<c:if test="${pageVO.prev}">
            				<a href="#" data-page="${pageVO.startPage - 1}" class="btn btn-outline-primary page-btn prev"><i class="fa fa-angle-double-left"></i></a>
        				</c:if>
        
        				<c:forEach begin="${pageVO.startPage}" end="${pageVO.endPage}" var="i">
            				<a href="#" data-page="${i}" class="btn btn-outline-primary page-btn ${pageVO.cri.page == i ? 'active' : ''}">${i}</a>
        				</c:forEach>
        
        				<c:if test="${pageVO.next}">
            				<a href="#" data-page="${pageVO.endPage + 1}" class="btn btn-outline-primary page-btn next"><i class="fa fa-angle-double-right"></i></a>
       				 </c:if>
    				</div>
				</div>

				<script>
				$(document).ready(function() {
    				$('.page-btn').click(function(e) {
        				e.preventDefault();
        				var pageNum = $(this).data('page');
        		        var searchCode = "${param.searchCode}";
        				var searchName = "${param.searchName}";
        				
        				var dataObject = {
            				"page": pageNum
        				};
        
        				if (searchCode) {
        				    dataObject.searchCode = searchCode;
        				}
        				if (searchName) {
        				    dataObject.searchName = searchName;
        				}
        				
        				$.ajax({
            				url: "/stock/stockList",
            				type: "GET",
            				data: dataObject,
            				success: function(data) {
                				$("#materialTab").html($(data).find("#materialTab").html());
            				},
            				error: function(error) {
                				console.error(error);
            				}
        				});
    				});
				});

				</script>
						
		</div>
				
				<!----------------------------- 설비탭 ---------------------------->
				<div class="tab-pane fade" id="facilityTab" role="tabpanel">
					<table class="table">
						<tr>
							<th>구분</th>
							<th>품목코드</th>
							<th>품명</th>
							<th>현재고</th>
							<th>발주요청</th>
						</tr>

						<c:forEach items="${stockList}" var="vo">
						<c:if test="${vo.group_display eq '생산설비' or vo.group_display eq '비생산설비' or vo.group_display eq '기타설비'}">
						<tr>
							<th>${vo.group_display }</th>
							<th style="color: #FF1493; ">${vo.code }</th>
							<th>${vo.name }</th>
							<th>
								<c:if test="${vo.total < 11 and vo.total >= 0}">
									<b style="color: red;">${vo.total }</b>
								</c:if>
								<c:if test="${vo.total >= 11 }">
									${vo.total }
								</c:if>
								<c:if test="${vo.total < 0 }">
									<b style="color: red;">0</b>
								</c:if>
							</th>
							
							<th class="inInfo" data-code="${vo.code}">
    							<c:if test="${vo.total < 11}">
        							<button type="button" class="btn btn-primary btn-sm" value="${vo.code}"><b>발주요청</b></button>
    							</c:if>
							</th>

						</tr>
						</c:if>
						</c:forEach>
							
					</table>

				<div class="btn-toolbar justify-content-center mb-15">
    				<div class="btn-group">
        				<c:if test="${pageVO.prev}">
            				<a href="#" data-page="${pageVO.startPage - 1}" class="btn btn-outline-primary page-btn prev"><i class="fa fa-angle-double-left"></i></a>
        				</c:if>
        
        				<c:forEach begin="${pageVO.startPage}" end="${pageVO.endPage}" var="i">
            				<a href="#" data-page="${i}" class="btn btn-outline-primary page-btn ${pageVO.cri.page == i ? 'active' : ''}">${i}</a>
        				</c:forEach>
        
        				<c:if test="${pageVO.next}">
            				<a href="#" data-page="${pageVO.endPage + 1}" class="btn btn-outline-primary page-btn next"><i class="fa fa-angle-double-right"></i></a>
       				 </c:if>
    				</div>
				</div>

				<script>
				$(document).ready(function() {
    				$('.page-btn').click(function(e) {
        				e.preventDefault();
        				var pageNum = $(this).data('page');
        		        var searchCode = "${param.searchCode}";
        				var searchName = "${param.searchName}";
        				
        				var dataObject = {
            				"page": pageNum
        				};
        
        				if (searchCode) {
        				    dataObject.searchCode = searchCode;
        				}
        				if (searchName) {
        				    dataObject.searchName = searchName;
        				}
        				
        				$.ajax({
            				url: "/stock/stockList",
            				type: "GET",
            				data: dataObject,
            				success: function(data) {
                				$("#facilityTab").html($(data).find("#facilityTab").html());
            				},
            				error: function(error) {
                				console.error(error);
            				}
        				});
    				});
				});

				</script>
						
		</div>
				<!----------------------------- 완제탭 ---------------------------->
				<div class="tab-pane fade" id="productTab" role="tabpanel">
					<table class="table">
						<tr>
							<th>구분</th>
							<th>품목코드</th>
							<th>품명</th>
							<th>현재고</th>
						</tr>

						<c:forEach items="${stockList}" var="vo">
						<c:if test="${vo.group_display eq '완제품'}">
						<tr>
							<th>${vo.group_display }</th>
							<th style="color: #FF1493; ">${vo.code }</th>
							<th>${vo.name }</th>
							<th>
								<c:if test="${vo.total < 11 and vo.total >= 0}">
									<b style="color: red;">${vo.total }</b>
								</c:if>
								<c:if test="${vo.total >= 11 }">
									${vo.total }
								</c:if>
								<c:if test="${vo.total < 0 }">
									<b style="color: red;">0</b>
								</c:if>
							</th>
							
						</tr>
						</c:if>
						</c:forEach>
							
					</table>

				<div class="btn-toolbar justify-content-center mb-15">
    				<div class="btn-group">
        				<c:if test="${pageVO.prev}">
            				<a href="#" data-page="${pageVO.startPage - 1}" class="btn btn-outline-primary page-btn prev"><i class="fa fa-angle-double-left"></i></a>
        				</c:if>
        
        				<c:forEach begin="${pageVO.startPage}" end="${pageVO.endPage}" var="i">
            				<a href="#" data-page="${i}" class="btn btn-outline-primary page-btn ${pageVO.cri.page == i ? 'active' : ''}">${i}</a>
        				</c:forEach>
        
        				<c:if test="${pageVO.next}">
            				<a href="#" data-page="${pageVO.endPage + 1}" class="btn btn-outline-primary page-btn next"><i class="fa fa-angle-double-right"></i></a>
       				 </c:if>
    				</div>
				</div>

				<script>
				$(document).ready(function() {
    				$('.page-btn').click(function(e) {
        				e.preventDefault();
        				var pageNum = $(this).data('page');
        		        var searchCode = "${param.searchCode}";
        				var searchName = "${param.searchName}";
        				
        				var dataObject = {
            				"page": pageNum
        				};
        
        				if (searchCode) {
        				    dataObject.searchCode = searchCode;
        				}
        				if (searchName) {
        				    dataObject.searchName = searchName;
        				}
        				
        				$.ajax({
            				url: "/stock/stockList",
            				type: "GET",
            				data: dataObject,
            				success: function(data) {
                				$("#productTab").html($(data).find("#productTab").html());
            				},
            				error: function(error) {
                				console.error(error);
            				}
        				});
    				});
				});

				</script>
						
		</div>
				
				
				
				
			</div>
		</div>
	</div>
</div>
				<!---------------------------------- 푸터 ----------------------------------->
				<div class="footer-wrap pd-20 mb-20 card-box"> ePle MES made by 
					<a href="https://github.com/dropways" target="_blank">아이티윌 부산 2023년 7월 프로젝트 2차 1조</a>
				</div>
				<%@ include file="../include/footer.jsp"%>
				<%@ include file="../include/datatable.jsp"%>
				
				
			</div>
	<!-- 메인 컨테이너 끝 -->





	<!-- 모달 창 -->
	<div class="modal fade" id="warning-modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm modal-dialog-centered">
			<div class="modal-content bg-warning">
				<div class="modal-body text-center">
					<h3 class="mb-15">
						<i class="fa fa-exclamation-triangle"></i> 주의
					</h3>
					<p><b>선택된 데이터</b>가 없습니다!</p>
					<button type="button" class="btn btn-dark" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 모달 창 -->
	
	

	<!-- 추가, 수정, 삭제, 상세보기 -->
	<script type="text/javascript">
	
	var result ="${result}"
		if(result == "AddDone"){
			$("#success").css("display","block")
		}else if(result =="UpdateDone"){
			alert("글 수정 완료");
		}else if(result == "DeleteDone"){
			alert("글 삭제 완료");
		}
	
	
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
		    // 발주요청 O
		    $('body').on('click', '.inInfo', function(){
		        var code = $(this).data('code');
		        openPage("${pageContext.request.contextPath}/material/stockOrderMAPD?code=" + code, 400, 700);
		    });
		});

		
		
		
		
		

 		// 검색하기
  		function doSearch() {
		        var query = {"searchCode" : $("#whCode").val(), "searchName" : $("#manager").val()};
		        
		        console.log("searchCode:", query.searchCode);
		        console.log("searchName:", query.searchName);
		        
		        $.ajax({
		            url : "${pageContext.request.contextPath}/warehouse/list",
		            type : "get",
		            data : query,
		            dataType : "text",
		            success : function(data){
		                 if (query.searchCode == "" && query.searchName == "") {
		                    location.href = "${pageContext.request.contextPath}/warehouse/list";
		                } else {
		                    location.href = "${pageContext.request.contextPath}/warehouse/list?searchCode=" + $("#whCode").val() + "&searchName=" + $("#manager").val();
		                } 
		                 
		                if (data) {
		                    alert("완료");
		                } else {
		                    alert("전송된 값 없음");
		                }
		                
		            },
		            
		            error: function() {
		                alert("에러 발생");
		            }

		        });
		} 
		

		// 검색 초기화 , placeholder 재지정 
		function resetSearch() {
			$("#manager").val("");
			$("#managerName").val("");
		    $("#manager").attr("placeholder", "관리자코드");
		    $("#managerName").attr("placeholder", "관리자이름");
		}



		    
	</script>
	
	
</body>
</html>
