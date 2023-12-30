package com.itwillbs.domain;

import lombok.Data;

@Data
public class FacilityOrderSearchVO extends SearchVO{
	// 정렬
		private int activeSortCategory;
		private String sortValue;
		
		public FacilityOrderSearchVO () {
			activeSortCategory = 0;
			sortValue = "asc";
		}
		
		private final String[] eng = {"code", "date", "group_name", "code_name", "cilent_name", "amount"};
		private final String[] kor = {"코드", "일자", "종류", "설비명", "등록자", "개수"};
}
