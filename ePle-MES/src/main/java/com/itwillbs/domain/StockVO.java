package com.itwillbs.domain;

import lombok.Data;

@Data
public class StockVO {
	private String code;
	private String warehouse_code;
	private String mapd_code;
	private int amount;
	private String group_id;
	private String code_id;
}
