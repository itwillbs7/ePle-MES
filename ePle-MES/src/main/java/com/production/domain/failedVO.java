package com.production.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class failedVO {
	private String code;
	private String emp_code;
	private String group_id;
	private String code_id;
	private String content;
	private String action;
	private int amount;
	private Timestamp reg_date;
	private String reg_emp;
	private Timestamp update_date;
	private String update_emp;
	private String inst_code;
}
