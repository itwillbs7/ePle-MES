package com.itwillbs.domain;

import java.sql.Timestamp;
import java.util.List;

import lombok.Data;

@Data
public class LineOffVO {
	private String code;
	private Timestamp start_time;
	private Timestamp end_time;
	private String group_id;
	private String group_name;
	private String code_id;
	private String code_name;
	
	private LineVO line;
}
