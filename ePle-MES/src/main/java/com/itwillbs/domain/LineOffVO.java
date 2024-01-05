package com.itwillbs.domain;

import java.sql.Timestamp;
import java.util.List;

import lombok.Data;

@Data
public class LineOffVO {
	private String index;
	private Timestamp start_time;
	private Timestamp end_time;
	private String line_code;
	private String line_name;
	private String group_id;
	private String group_name;
	private String code_id;
	private String code_name;
	
	private List<FacilityVO> facList;
	private List<FacMtVO> mainList; //
}
