package com.production.domain;

import lombok.Data;

@Data
public class BOMVO {
	private String bno;
	
	private int amount;
	private String material;
	private String content;
	private String mapd_code;
	
	private String mapdName;
	private String materialName;
}