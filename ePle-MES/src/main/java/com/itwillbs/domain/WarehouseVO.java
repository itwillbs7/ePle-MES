package com.itwillbs.domain;

import lombok.Data;

@Data
public class WarehouseVO {
	// 창고
	private String code;	
	private String location;	
	private String category;	
	private String name;	
	private String manager;		
	private String mng_phone;	
	private int active;			
	 
	// employees 
	private String phone;

	// stock
	private String warehouse_code;
	private String mapd_code;
	private String amount;
	private String code_id;

	// Search
	private String searchCode;
	private String searchName;
		
	// Criteria 
	private Criteria cri;

	private String w_code;	
	private String wh_code;	
	private String wh_name;	

}
