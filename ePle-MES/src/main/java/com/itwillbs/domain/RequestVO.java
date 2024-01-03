package com.itwillbs.domain;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class RequestVO {
	// Request 테이블
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
	private int amount;
	private String unit;
	private int stock;
	private int currency;
	private String status;
	private int returns;
	private String reg_date;
	private String reg_emp;
	private String update_date;
	private String update_emp;
	
	private String clientName;
	private String productName;
	private String managerName;
	private String ware_code;
	private String stock_code;
	
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
