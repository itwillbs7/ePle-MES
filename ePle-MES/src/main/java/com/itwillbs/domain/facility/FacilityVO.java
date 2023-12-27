package com.itwillbs.domain.facility;

import java.sql.Date;

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
	private String location;
	private String line_code;
	private int uph;
	private String image;
	private boolean active;
}