package com.production.domain;

import java.sql.Date;
import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class instructionVO {
	private int code;
	private String request;
	private String product;
	private int amount;
	private String line_code;
	private String content;
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone="Asia/Seoul")
	private Date production_date;
	
	private Timestamp reg_date;
	private String reg_emp;
	private Timestamp update_date;
	private String update_emp;
}
