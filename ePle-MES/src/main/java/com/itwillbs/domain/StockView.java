package com.itwillbs.domain;

import lombok.Data;

@Data
public class StockView {
	private String code;
	private String name;
	private String warehouse;
	private int total;
}
