package com.production.domain;

import java.sql.Date;
import java.sql.Timestamp;

public class requestVO {
	private String code;
	private String client_code;
	private Date deadline;
	private Date date;
	private String manager;
	private String product;
	private int amount;
	private String unit;
	private int stock;
	private int currency;
	private String status;
	private int returns;
	private Timestamp reg_date;
	private String reg_emp;
	private Timestamp update_date;
	private String update_emp;
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getClient_code() {
		return client_code;
	}
	public void setClient_code(String client_code) {
		this.client_code = client_code;
	}
	public Date getDeadline() {
		return deadline;
	}
	public void setDeadline(Date deadline) {
		this.deadline = deadline;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getManager() {
		return manager;
	}
	public void setManager(String manager) {
		this.manager = manager;
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
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public int getCurrency() {
		return currency;
	}
	public void setCurrency(int currency) {
		this.currency = currency;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getReturns() {
		return returns;
	}
	public void setReturns(int returns) {
		this.returns = returns;
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
		return "requestVO [code=" + code + ", client_code=" + client_code + ", deadline=" + deadline + ", date=" + date
				+ ", manager=" + manager + ", product=" + product + ", amount=" + amount + ", unit=" + unit + ", stock="
				+ stock + ", currency=" + currency + ", status=" + status + ", returns=" + returns + ", reg_date="
				+ reg_date + ", reg_emp=" + reg_emp + ", update_date=" + update_date + ", update_emp=" + update_emp
				+ "]";
	}
}
