package com.itwillbs.domain;

import lombok.Data;

@Data
public class FacilitySearchVO extends SearchVO{
	private String[] order;
	private final String[] kor = {"코드", "카테고리", "모델", "이름", "위치"};
	public void orderSet(int count) {
		order = new String[count];
		for(int i = 0; i<order.length; i++) order[i] = "asc";
	}
}
