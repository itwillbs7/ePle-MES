package com.itwillbs.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class HistoryVO {
	private String code;
	private String order_num;
	private String warehouse_code;
	private String io;
	private String category;
	private int amount;
	private String mapd_code;
	private String emp_code;
	private Date date;
}
