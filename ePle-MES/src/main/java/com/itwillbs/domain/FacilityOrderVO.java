package com.itwillbs.domain;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Data;

// 주문만 진행
@Data
public class FacilityOrderVO {
	private String code;		// 코드 작성방식은 다음주에 논의
	private String group_id;
	private String code_id;
	private String group_name;
	private String code_name;
	private Date date;			// 등록일자
	private String client_code;	// 회사 코드
	private String client_name; // 회사 이름
	private int amount;			// 개수
	private Timestamp reg_date;	
	private String reg_emp;
	private String reg_name;
	private Timestamp update_date;
	private String update_emp;
	private String update_name;
	private String status;
}
