package com.itwillbs.domain;

import lombok.Data;

@Data
public class LineVO {

	private String code;
	private String name;
	private String process;
	private String place;
	private String status;
	private String note;
	private boolean active;
	
}