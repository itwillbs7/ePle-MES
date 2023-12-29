package com.itwillbs.domain;
import java.util.LinkedList;
import java.util.List;

import lombok.Data;

@Data
public class FacilitySearchVO extends SearchVO{
	// 정렬
	private List<Sort> sort;
	private String[] order;
	private final String[] eng = {"code", "category", "model", "name", "location"};
	private final String[] kor = {"코드", "카테고리", "모델", "이름", "위치"};
	public void sortSet(int count) {
		sort = new LinkedList<Sort>();
		if (order == null) {
			order = new String[count];
			for(int i = 0; i<kor.length; i++) {
				order[i] = "asc";
				Sort e = new Sort();
				e.setName(eng[i]);
				e.setValue(order[i]);
				sort.add(e);
			}
		}
		else {
			for(int i = 0; i<kor.length; i++) {
				Sort e = new Sort();
				e.setName(eng[i]);
				e.setValue(order[i]);
				sort.add(e);
			}
		}
	}
	
	private final String[] searchMenu = {"code", "model", "name", "location"};
	private final String[] searchKor = {"코드", "모델", "이름", "위치"};

	public boolean getIsnull() {
		if(getSearchKeyword() == null && getFormCheck() == null && getBetweenDateLeft() == null && getBetweenDateRight() == null) return true;
		else return false;
	}
}