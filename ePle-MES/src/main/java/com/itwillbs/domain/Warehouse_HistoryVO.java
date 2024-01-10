package com.itwillbs.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Warehouse_HistoryVO {

	
	// 입출고 테이블 (Warehouse_History)
	private String code;
	private String warehouse_code;
	private String io;
	private String category;
	private int amount;
	private String order_num;
	private Date date;
	private String mapd_code;
	private String emp_code;
	private String status;

	// join
	private String empName;
	private String mapdName;
	private String unit;
	
	
	// Search
	private String searchCode;
	private String searchName;
		
	// Criteria 
	private Criteria cri;	
	
}
