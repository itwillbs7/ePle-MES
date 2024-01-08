package com.production.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class resultVO {
	private String code;
	private String emp_code;
	private int amount;
	private String status;
	private Timestamp reg_date;
	private String reg_emp;
	private Timestamp update_date;
	private String update_emp;
	private String inst_code;
	
	private instructionVO vo;
}
