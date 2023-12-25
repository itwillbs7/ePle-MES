package com.itwillbs.domain;

import lombok.Data;

@Data
public class RequestSearchVO {
	// 검색조건 전부넣기
	// 업체코드, 품번코드, 담당자코드(사원번호), 수주일자, 납품일자, 
	// 수주상태(등록, 생산진행, 출하대기, 출하완료, 수령, 반품)
	
	private String client_code;
	private String product;
	private String manager;
	private String date;
	private String deadline;
	
	private String clientName;
	private String managerName;
	private String productName;
	
	private String statusInput; // 등록
	private String statusProduction; // 생산진행
	private String statusWait; // 출하대기
	private String statusShip; // 출하완료
	private String statusRecipt; // 수령
	private String statusReturns; // 반품
	
	
	String[] dates = date.split("-");

	private String startDate = dates[0]; // 수주일 검색 시작일
	private String endDate = dates[1];  //  수주일 검색 끝일

	String[] deadlines = deadline.split("-");

	private String startDeadline = deadlines[0]; // 납품예정일 검색 시작일
	private String endDeadline = deadlines[1];  // 납품예정일 검색 끝일
	
	
	
	
}
