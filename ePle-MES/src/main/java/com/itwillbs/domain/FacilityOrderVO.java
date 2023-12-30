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
	private String client_code;	// 직원사번(신청한 사람)
	private String client_name;	// 직원 이름(join)
	private int amount;			// 개수
}
