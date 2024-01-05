package com.itwillbs.domain;

import lombok.Data;

@Data
public class ReturnsVO {
	//returns 
	private String code;
	private String request_code;
	private String ship_code;
	private String lot; //lot번호
	private String date; //반품일자
	private int amount; //반품수량
	private String unit;
	private String reason;
	private String status; //반품상태 (반품, 폐기)
	private int dispose; // 폐기여부
	
	private String reg_date;
	private String reg_emp;
	private String update_date;
	private String update_emp;
	
	
}
