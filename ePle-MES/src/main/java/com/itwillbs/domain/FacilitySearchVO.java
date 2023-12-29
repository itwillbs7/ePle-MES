package com.itwillbs.domain;

import lombok.Data;

@Data
public class FacilitySearchVO extends SearchVO{
	// 정렬
	private int activeSortCategory;
	private String sortValue;
	
	public FacilitySearchVO() {
		activeSortCategory = 0;
		sortValue = "asc";
	}
	
	private final String[] eng = {"code", "category", "model", "name", "line_code"};
	private final String[] kor = {"코드", "카테고리", "모델", "이름", "라인"};
	
	private final String[] searchMenu = {"code", "model", "name"};
	private final String[] searchKor = {"코드", "모델", "이름"};

	public boolean getIsnull() {
		if(getSearchKeyword() == null && getFormCheck() == null && getBetweenDateLeft() == null && getBetweenDateRight() == null) return true;
		else return false;
	}
}