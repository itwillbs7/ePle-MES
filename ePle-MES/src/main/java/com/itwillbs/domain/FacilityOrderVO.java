package com.itwillbs.domain;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Data;

@Data
public class FacilityOrderVO {
	private String code;
	private String material;
	private Date date;
	private String client_code;
	private int amount;
	private boolean complete;
	private Date order_date;
	private Timestamp reg_date;
	private String reg_emp;
	private Timestamp update_date;
	private String update_emp;
	private String status;
}
