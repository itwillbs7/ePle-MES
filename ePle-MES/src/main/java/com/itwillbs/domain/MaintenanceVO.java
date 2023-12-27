package com.itwillbs.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MaintenanceVO {
	/*
	 	공통 코드 FK
		일상보전 : DM
		(정기/예지)
		예방보전 : PM
		사후보전 : BM
		개량보전 : CM
		보전예방 : MP
		긴급보전 : EM 
	 */
	private String code;
	private Timestamp reg_date;
	private String emp_code;
	private String mt_subject;
	private String mt_content;
	private boolean complete;
	private String manager;
	private String res_info;
	private String res_content;
	private Timestamp comp_date;
}