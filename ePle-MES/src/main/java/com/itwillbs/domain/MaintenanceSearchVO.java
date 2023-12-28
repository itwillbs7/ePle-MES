package com.itwillbs.domain;

import lombok.Data;

@Data
public class MaintenanceSearchVO extends SearchVO{
	private String[] order;
	private final String[] kor = {"순번", "등록일", "직원명", "설비 코드", "제목"};
	public void orderSet(int count) {
		order = new String[count];
		for(int i = 0; i<order.length; i++) order[i] = "asc";
	}
}