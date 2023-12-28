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
	
	public LineVO(String code, String name, String process, String place, String status, String note, boolean active) {
		super();
		this.code = code;
		this.name = name;
		this.process = process;
		this.place = place;
		this.status = status;
		this.note = note;
		this.active = active;
	}

	public int getLineId() {
		
		return 0;
	}

	public void setLineId(int i) {
		
	}
	
}
