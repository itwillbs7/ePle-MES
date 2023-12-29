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
	private String betweenDateLeft;
	private String betweenDateRight;
	
	private String[] category;

	public int getIndex() {
		if(searchCategory == null || searchCategory.equals("")) return -1;
		else return Integer.parseInt(searchCategory);
	}
	
	private boolean isajax;
}