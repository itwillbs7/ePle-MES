package com.itwillbs.domain;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Data;

@Data
public class OrderVO {
	
	private String code; 			// 발주코드
	private String material; 		// 품목코드
	private Date date; 				// 신청일 O
	private String client_code; 	// 거래처코드 
	private int amount; 			// 주문량 O
	private int price;				// 발주금액
	private int complete; 			// 입고확인 
	private Date order_date; 		// 납품일자
	private Timestamp reg_date; 	// 등록일
	private String reg_emp;			// 등록자코드
	private Timestamp update_date; 	// 변경일
	private String update_emp; 		// 변경자코드
	private String status; 			// 발주상태 
	
	private String client_name; 	// 거래처명 
	private String reg_name;		// 등록자이름
	private String update_name;		// 변경자이름
	
	// Search
	private String searchCode;
	private String searchName;
	private String searchAmount;
	private String order_num;
		
	// Criteria 
	private Criteria cri;	
	
	// MAPD
	private String name;
	private String group_id;
	private String code_id;
	private String size;
	private String unit;
	private int inprice;
	private int outprice;
	private String image;
	private boolean active;
	
}
