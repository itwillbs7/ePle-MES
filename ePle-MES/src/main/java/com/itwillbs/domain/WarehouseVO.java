package com.itwillbs.domain;

import lombok.Data;

@Data
public class WarehouseVO {

	private String code;
	private String location;
	private String group_id;
	private String group_name;
	private String manager;
	private String mng_phone;
	private int active;
}
