package com.itwillbs.domain;

import lombok.Data;

@Data
public class SearchVO {
	// 검색 카테고리(컬럼)
	private String searchCategory;
	private String searchKeyword;

	// 체크박스
	private String[] formCheck;

	// 라디오
	private String formRadio;

	// 날짜
	private String date;

	// 기간
	private String between;
	private String betweenDateLeft;
	private String betweenDateRight;
	
	private String[] category;

	public int getIndex() {
		if(searchCategory == null || searchCategory.equals("")) return -1;
		else return Integer.parseInt(searchCategory);
	}
	
	public void setBetweenDates() {
		if(between == null || between.equals("")) return;
		//2023-12-10 - 2023-12-11
		betweenDateLeft = between.substring(0, 10);
		betweenDateRight = between.substring(13);
	}
	
	private boolean isajax;
}