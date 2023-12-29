package com.itwillbs.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class LineOffVO {
	private String index;
	private Timestamp start_time;
	private Timestamp end_time;
	private String line_code;
	private String group_id;
	private String code_id;
}
