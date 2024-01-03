package com.itwillbs.domain;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Data;

@Data
public class OrderVO {
	private String code; 			// 발주번호 
	private String material; 		// 재료품번
	private Date date; 				// 접수일자
	private String client_code; 	// 거래처코드
	private int amount; 			// 주문량
	private int complete; 			// 입고확인 
	private Date order_date; 		// 납품일자
	private Timestamp reg_date; 	// 등록일
	private String reg_emp;			// 등록자
	private Timestamp update_date; 	// 변경일
	private String update_emp; 		// 변경자
	private String status; 			// 상태


	private String category; 	
	private String name; 	

}
