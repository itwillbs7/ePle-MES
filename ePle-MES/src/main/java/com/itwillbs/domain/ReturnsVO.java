package com.itwillbs.domain;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class ReturnsVO {
	//returns 
	private String code;
	private String request_code;
	private String ship_code;
	private String lot; //lot번호
	
	private String date; //반품일자
	private String StartDate;
	private String endDate;
	
	private int amount; //반품수량
	private String unit;
	private String reason;
	private String status; //반품상태 (반품, 폐기)
	private int dispose; // 폐기여부
	
	private String reg_date;
	private String reg_emp;
	private String update_date;
	private String update_emp;
	
	private String reqsdate;
	private String clientName;
	private String client_code;
	private String product;
	private String productName;
	private String manager;
	private String managerName;
	
	private List<String> statusList;

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
