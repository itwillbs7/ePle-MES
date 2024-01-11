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
	
	private final String[] eng = {"code", "c.group_name", "c.code_name", "m.name", "l.name"};
	private final String[] kor = {"코드", "카테고리", "물품 종류", "이름", "라인"};
	
	private final String[] searchMenu = {"code", "c.group_name", "c.code_name", "m.name"};
	private final String[] searchKor = {"코드", "카테고리", "물품 종류" , "이름"};

	public boolean getIsnull() {
		if(getSearchKeyword() == null && getFormCheck() == null && getBetweenDateLeft() == null && getBetweenDateRight() == null) return true;
		else return false;
	}
}