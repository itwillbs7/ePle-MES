package com.production.domain;

import lombok.Data;

@Data
public class proPageVO {
	private int totalCount; // 총 개수
	private int startPage;  // 페이지 블럭 시작번호
	private int endPage;    // 페이지 블럭 끝번호
	
	private boolean prev;   // 이전링크존재 여부
	private boolean next;   // 다음링크존재 여부
	private int displayPageNum = 10; //페이지 블럭 크기
	private int page = 1;//현재 페이지 번호
	private int pageSize = 10;//페이지 크기
	private int limit;//페이지 크기
	
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}
	private void calcData() {
		// 페이징처리 정보를 모두 계산
		
		// 끝페이지 번호
		endPage = (int)(Math.ceil(page / (double)displayPageNum)) * displayPageNum;
		// 시작페이지 번호
		startPage = (endPage - displayPageNum)+1;
		
		// 끝 페이지 번호 체크하기(글이 없는 경우) 기존방식
		// 122개 = 122/ 10개씩 -> 12페이지? ㄴㄴ 13페이지
//		int tmpEndPage = totalCount / cri.getPageSize() +(totalCount%cri.getPageSize()==0?0:1);
		
		// 지금(위와 결과값은 동일함) 
		int tmpEndPage = (int)(Math.ceil((double)totalCount / pageSize));
		
		if(endPage > tmpEndPage) {
			endPage = tmpEndPage;
		}
		
		// 이전페이지 링크
		prev = startPage != 1;
//		prev = startPage == 1?false:true; // 위와 같은 의미(1이 아닐 때 true)
		
		
		// 다음페이지 링크
		next = endPage * pageSize < totalCount;
		
		// 페이징처리 정보를 계산 완료
		limit = ((page - 1) * pageSize); 
	}// calcData()
}
