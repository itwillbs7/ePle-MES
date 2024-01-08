package com.production.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class instructionVO {
	private int code;
	private String request;
	private String product;
	private int amount;
	private String line_code;
	private String content;
	private Timestamp production_date;
	private Timestamp reg_date;
	private String reg_emp;
	private Timestamp update_date;
	private String update_emp;
}
