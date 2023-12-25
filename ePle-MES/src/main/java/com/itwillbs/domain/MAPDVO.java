package com.itwillbs.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MAPDVO {

	private String code;
	private String category;
	private String name;
	private String size;
	private String unit;
	private int inprice;
	private int outprice;
	private String image;
	private String reg_emp;
	private Timestamp reg_date;
	private String update_emp;
	private Timestamp update_date;
	private boolean active;
	
}
