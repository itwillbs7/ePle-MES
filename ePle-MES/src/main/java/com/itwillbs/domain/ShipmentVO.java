package com.itwillbs.domain;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class ShipmentVO {
	private String code; 
	private String reqs_code;
	
	private String date; // 출하일자
	private String StartDate;
	private String endDate;
	
	private String ware_code;
	private int amount; //출하량
	private String status;
	private String reg_date;
	private String reg_emp;
	private String update_date;
	private String update_emp;
	private String stock_code;
	
	private String stock; // 재고량
	private String reqsdate;
	private int reqsamount;
	private String unit;
	private String product;
	private String clientName;
	
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
