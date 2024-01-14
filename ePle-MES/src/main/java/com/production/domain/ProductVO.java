package com.production.domain;

import java.util.List;

import lombok.Data;

@Data
public class ProductVO {
	private String code;
	private String name;
	private int count;
	private List<BOMVO> list;
}