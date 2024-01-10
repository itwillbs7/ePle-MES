package com.production.domain;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

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
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss", timezone="Asia/Seoul")
	private Timestamp reg_date;
	private String reg_emp;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss", timezone="Asia/Seoul")
	private Timestamp update_date;
	private String update_emp;
	private String result_code;
}
