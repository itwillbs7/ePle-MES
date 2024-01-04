package com.itwillbs.domain;

import lombok.Data;

@Data
public class StockVO {
	private String stock_code;		// 재고코드
	private String warehouse_code;	// 창고코드
	private String mapd_code;		// 자재코드
	private int amount;				// 재고수량
	private String group_id;		// 공통코드
	private String code_id;			// 코드ID
	
	
	private String wh_code;
	private String wh_name;
	
}
