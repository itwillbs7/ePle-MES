package com.itwillbs.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class RequestVO {
	// Request 테이블
	private String code;
	private String client_code;
	private String date;
	private String deadline;
	private String manager;
	private String product;
	private int amount;
	private String unit;
	private int stock;
	private int currency;
	private String status;
	private int returns;
	private String reg_date;
	private String reg_emp;
	private String update_date;
	private String update_emp;
	
	private String clientName;
	private String productName;
	private String managerName;

}
