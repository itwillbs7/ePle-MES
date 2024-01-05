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
	private Date date;			// 접수 일자
	private String client_code;	// 회사 코드
	private String client_name; // 회사 이름
	private int amount;			// 개수
	private Timestamp reg_date;	// 작성일
	private String reg_emp;		// 작성자
	private String reg_name;	// 작성자 이름
	private Timestamp update_date;	// 수정 일자
	private String update_emp;		// 수정자
	private String update_name;		// 수정자 이름
	private String status;			// 상태
}
