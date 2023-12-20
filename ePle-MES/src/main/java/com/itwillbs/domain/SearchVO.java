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
	
	// 카테고리
	private String[] category;
}
