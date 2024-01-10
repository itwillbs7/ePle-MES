package com.production.domain;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class resultVO {
	private String code;
	private String emp_code;
	private int amount;
	private String status;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss", timezone="Asia/Seoul")
	private Timestamp reg_date;
	private String reg_emp;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss", timezone="Asia/Seoul")
	private Timestamp update_date;
	private String update_emp;
	private String inst_code;
	
	private instructionVO vo;
	private int failedCount;
}
