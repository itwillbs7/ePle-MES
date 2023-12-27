package com.itwillbs.domain.facility;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MaintenanceVO {
	private String index;
	private Timestamp reg_date;
	private String emp_code;
	private String group_id;
	private String code_id;
	private String group_name;
	private String code_name;
	private String mt_content;
	private boolean complete;
	private String manager;
	private String res_info;
	private String res_content;
	private Timestamp comp_date;
}