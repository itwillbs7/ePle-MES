package com.itwillbs.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class FacMtVO {
	/*
	 	공통 코드 FK
	 	
		일상보전 : DM
		(정기/예지)
		예방보전 : PM
		사후보전 : BM
		개량보전 : CM
		
	 */
	private String code;
	
	private String fac_code;
	private Timestamp reg_date;
	private String emp_code;
	private String emp_name;
	
	private String group_id;
	private String group_name;
	private String code_id;
	private String code_name;
	
	private String mt_subject;
	private String mt_content;
	private boolean complete;
	
	private String manager;
	private String manager_name;
	
	private String res_info;
	private String res_content;
	private Timestamp comp_date;
	
	private FacilityVO facility;
	private LineVO line;
}