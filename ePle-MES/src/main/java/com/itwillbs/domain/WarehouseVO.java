package com.itwillbs.domain;

import lombok.Data;

@Data
public class WarehouseVO {

	private String w_code;		// 창고코드
	private String location;	// 위치
	private String group_id;	// 구분 (원자재/완제품)
	private String group_name;	// 창고이름
	private String manager;		// 담당자 코드
	private String mng_phone;	// 담당자 연락처
	private int active;			// 사용여부 (1:사용중/0:미사용)
	
	// employees 
	private String emp_code;	
	private String name;
	private String phone;

	// Criteria 
	private Criteria cri;
	
	// 입출고 테이블
	private int io_code;	 // 입출고 이력코드
	private String wh_code;  // 창고코드
	private String io;		 // 입출고구분
	private String category; // 구분 (원자재/완제품)
	private int amount;		 // 수량
	private String order_num;// 발주,출하번호
	private String date;	 // 일자

}
