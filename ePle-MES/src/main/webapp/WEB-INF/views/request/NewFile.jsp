<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
			<c:forEach items="${List}" var="List" varStatus="status">
									<tr>
										<!-- 리스트 표, 1페이지에 몇개 조회 가능하게 할 지는 정해도 될 거 같음 -->
							<td><div class="custom-control custom-checkbox mb-5">
							<!-- id에 뒤에 el식으로 테이블 인덱스나, 번호 추가, value에 primary 붙이기  -->
									<input type="checkbox" class="custom-control-input" id="checkTable${status.index}" 
									name="tableCheck" value="${List.code }"> 
									<label class="custom-control-label" for="checkTable${status.index}"></label>
									</div></td>
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
										<td style="">
										<!-- 옵션 -->
											<div class="dropdown">
												<a class="btn btn-link font-24 p-0 line-height-1 no-arrow dropdown-toggle" href="#" role="button" data-toggle="dropdown"> <i class="dw dw-more"></i>
												</a>
												<div class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list">
													<!-- 링크 설정 -->
													<!-- 상세 보기 -->
													<a class="dropdown-item" href="#"><i class="dw dw-eye"></i> 상세 보기</a>
													<!-- 수정 -->
													<a class="dropdown-item" href="javascript:openPage('/request/update?index=1', 400, 600)"><i class="dw dw-edit2"></i> 수정</a>
													<!-- 삭제 -->
													<a class="dropdown-item" href="javascript:openPage('/request/delete?index=1', 400, 600)"><i class="dw dw-delete-3"></i> 삭제</a>
												</div>
											</div>
										</td>
									</tr>
								</c:forEach>
</body>
</html>