package com.itwillbs.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MAPDVO {

	private String code;
	private String group_id;
	private String group_name;
	private String code_id;
	private String code_name;
	private String name;
	private String size;
	private String unit;
	private int inprice;
	private int outprice;
	private String reg_emp;
	private String reg_date;
	private String update_emp;
	private String update_date;
	private String requirement;
	private boolean active;
	
	private String material;

	// Search
	private String searchCode;
	private String searchName;
		
	// Criteria 
	private Criteria cri;	
}
