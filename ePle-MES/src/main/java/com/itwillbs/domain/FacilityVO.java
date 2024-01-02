package com.itwillbs.domain;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class FacilityVO {
	private String code;
	private String group_id;
	private String group_name;
	private String code_id;
	private String code_name;
	private String model;
	private String name;
	private String client_code;
	private String client_name;
	private Date purchase_date;
	private int inprice;
	private String line_code;
	private String line_name;
	private int uph;
	private boolean active;
	
	// 설비 보전 리스트
	private List<MaintenanceVO> mainList;
}