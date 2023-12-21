package com.production.domain;

public class ajaxSearchVO {
	private String product;
	private String line_code;
	private String request;
	
	public String getProduct() {
		return product;
	}
	public void setProduct(String product) {
		this.product = product;
	}
	public String getLine_code() {
		return line_code;
	}
	public void setLine_code(String line_code) {
		this.line_code = line_code;
	}
	public String getRequest() {
		return request;
	}
	public void setRequest(String request) {
		this.request = request;
	}
	
	@Override
	public String toString() {
		return "ajaxSearchVO [product=" + product + ", line_code=" + line_code + ", request=" + request + "]";
	}
}
