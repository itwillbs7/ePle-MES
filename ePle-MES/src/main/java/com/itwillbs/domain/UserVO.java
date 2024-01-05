package com.itwillbs.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class UserVO {

	private String code;
	private String id;
	private String dep_group;
	private String pos_group;
	private String dep_id;
	private String pos_id;
	private String pw;
	private String name;
	private Date hiredate;
	private String phone;
	private String email;
	private String address;
	private Integer active;
	private String auth;
	
}
