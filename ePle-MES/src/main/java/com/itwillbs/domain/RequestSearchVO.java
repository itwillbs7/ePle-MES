package com.itwillbs.domain;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;

@Data
public class RequestSearchVO {
	// 검색조건 전부넣기
	// 업체코드, 품번코드, 담당자코드(사원번호), 수주일자, 납품일자, 
	// 수주상태(등록, 생산진행, 출하대기, 출하완료, 수령, 반품)
	
	private String code;
	private String client_code;
	
	private String date;
	private String startDate;
	private String endDate;
	
	private String deadline;
	private String startDead;
	private String endDead;
	
	private String manager;
	private String product;
	
	private String clientName;
	private String productName;
	private String managerName;
	
	public String getNewStartDate(String date) {
        return convertDateFormat(date);
    }

    public String getNewEndDate(String date) {
        return convertDateFormat(date);
    }

    private String convertDateFormat(String originalDate) {
        SimpleDateFormat originalFormat = new SimpleDateFormat("MM/dd/yyyy");
        SimpleDateFormat targetFormat = new SimpleDateFormat("yyyy-MM-dd");
        try {
            Date date = originalFormat.parse(originalDate);
            return targetFormat.format(date);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
	
	
}
