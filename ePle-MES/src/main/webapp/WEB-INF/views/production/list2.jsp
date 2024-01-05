<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<%@ include file="../include/head.jsp"%>
<title>수주 관리</title>
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
				<h1>수주 관리</h1>
			</div>
			<div class="min-height-200px">
				<br>
				<!-- Checkbox select Datatable start -->
				<div class="card-box mb-30">
					<div class="pb-20">
						<div class="col-sm-30">
							<form class="table" id="table">
								<table class="table table-striped">
									<thead>
										<tr>
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
						</div>
					</div>
				</div>
				<!-- 푸터 -->
				<%@ include file="../include/footer.jsp"%>
				<%@ include file="../include/datatable.jsp"%>
			</div>
		</div>
	</div>

	<!-- list 내 처리 -->
	<script type="text/javascript">
	
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
        	if(data == null || data == ''){						
				  alert('검색결과가 없습니다');
				  return;
			}
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
