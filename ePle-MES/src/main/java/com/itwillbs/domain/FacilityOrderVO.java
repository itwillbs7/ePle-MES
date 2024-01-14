package com.itwillbs.domain;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Data;

// 주문만 진행
@Data
public class FacilityOrderVO {
	private String code;		// 코드 작성방식은 다음주에 논의
	private String group_name;
	private String code_name;
	private String material;
	private String ask_emp;
	private String emp_name;
	private Date date;			// 등록 일자
	private int amount;			// 개수
	private String status;
	
	private MAPDVO mapd; 
}
