package com.itwillbs.domain;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class FacilityVO {
	private String code;
	// 설비 카테고리 : 생산, 비생산, 기타
	private String category;
	private String name;
	private String model;
	private Date purchase_date;
	private int inprice;
	private String line_code;
	private int uph;
	private boolean active;
	
	// 설비 보전 리스트
	private List<MaintenanceVO> mainList;
	
	// join
	private String line_name;
}