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
	
	private final String[] eng = {"code", "f.group_name", "f.code_name", "model", "name", "line_code"};
	private final String[] kor = {"코드", "카테고리", "제품 종류", "모델", "이름", "라인"};
	
	private final String[] searchMenu = {"code", "f.group_name", "f.code_name", "model", "name"};
	private final String[] searchKor = {"코드", "카테고리", "물품 종류" ,"모델", "이름"};

	public boolean getIsnull() {
		if(getSearchKeyword() == null && getFormCheck() == null && getBetweenDateLeft() == null && getBetweenDateRight() == null) return true;
		else return false;
	}
}