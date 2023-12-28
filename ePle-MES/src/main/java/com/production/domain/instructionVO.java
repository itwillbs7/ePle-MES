package com.production.domain;

import java.sql.Timestamp;

public class instructionVO {
	private int code;
	private String request;
	private String product;
	private int amount;
	private String line_code;
	private String content;
	private Timestamp reg_date;
	private String reg_emp;
	private Timestamp update_date;
	private String update_emp;
	
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getRequest() {
		return request;
	}
	public void setRequest(String request) {
		this.request = request;
	}
	public String getProduct() {
		return product;
	}
	public void setProduct(String product) {
		this.product = product;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getLine_code() {
		return line_code;
	}
	public void setLine_code(String line_code) {
		this.line_code = line_code;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public String getReg_emp() {
		return reg_emp;
	}
	public void setReg_emp(String reg_emp) {
		this.reg_emp = reg_emp;
	}
	public Timestamp getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(Timestamp update_date) {
		this.update_date = update_date;
	}
	public String getUpdate_emp() {
		return update_emp;
	}
	public void setUpdate_emp(String update_emp) {
		this.update_emp = update_emp;
	}
	
	@Override
	public String toString() {
		return "instructionVO [code=" + code + ", request=" + request + ", product=" + product + ", amount=" + amount
				+ ", line_code=" + line_code + ", content=" + content + ", reg_date=" + reg_date + ", reg_emp="
				+ reg_emp + ", update_date=" + update_date + ", update_emp=" + update_emp + "]";
	}
}
