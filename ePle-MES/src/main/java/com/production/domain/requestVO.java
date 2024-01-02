package com.production.domain;

import java.sql.Date;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class requestVO {
	private String code;
	private String client_code;
	private Date deadline;
	private Date date;
	private String manager;
	private String product;
	private int amount;
	private String unit;
	private int stock;
	private int currency;
	private String status;
	private int returns;
	private Timestamp reg_date;
	private String reg_emp;
	private Timestamp update_date;
	private String update_emp;
}
