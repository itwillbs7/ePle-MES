package com.itwillbs.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class OrderVO {
	private String code;
	private String material;
	private String date;
	private String client_code;
	private int amount;
	private int complete;
	private String order_date;
	private Timestamp reg_date;
	private String reg_emp;
	private Timestamp update_date;
	private String update_emp;
	private String status;
}
