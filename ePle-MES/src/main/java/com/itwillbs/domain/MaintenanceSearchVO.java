package com.itwillbs.domain;

import lombok.Data;

@Data
public class MaintenanceSearchVO extends SearchVO{
	private String[] order;
	
	private final String[] eng = {"m.code", "reg_date", "e.name", "fac_code", "mt_subject"};
	private final String[] kor = {"보전 번호", "등록일", "직원명", "설비 코드", "제목"};
	
	public void orderSet(int count) {
		order = new String[count];
		for(int i = 0; i<order.length; i++) order[i] = "asc";
	}
	
	// 정렬
	private int activeSortCategory;
	private String sortValue;
		
	public MaintenanceSearchVO() {
		activeSortCategory = 0;
		sortValue = "asc";
	}
		
	private final String[] searchMenu = {"m.code", "e.name", "f.name","mt_subject"};
	private final String[] searchKor = {"보전 번호", "직원명", "설비 이름","제목"};

	public boolean getIsnull() {
		if(getSearchKeyword() == null && getFormCheck() == null && getBetweenDateLeft() == null && getBetweenDateRight() == null) return true;
		else return false;
	}
}