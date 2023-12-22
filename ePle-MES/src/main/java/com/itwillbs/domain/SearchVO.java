package com.itwillbs.domain;

import java.util.Arrays;

public class SearchVO {
	// 검색 카테고리(컬럼)
	private String searchCategory;
	private String searchKeyword;

	// 체크박스
	private String[] formCheck;

	// 라디오
	private String formRadio;

	// 날짜
	private String date;

	// 기간
	private String betweenDateLeft;
	private String betweenDateRight;

	public String getSearchCategory() {
		return searchCategory;
	}

	public void setSearchCategory(String searchCategory) {
		this.searchCategory = searchCategory;
	}

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	public String[] getFormCheck() {
		return formCheck;
	}

	public void setFormCheck(String[] formCheck) {
		this.formCheck = formCheck;
	}

	public String getFormRadio() {
		return formRadio;
	}

	public void setFormRadio(String formRadio) {
		this.formRadio = formRadio;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getBetweenDateLeft() {
		return betweenDateLeft;
	}

	public void setBetweenDateLeft(String betweenDateLeft) {
		this.betweenDateLeft = betweenDateLeft;
	}

	public String getBetweenDateRight() {
		return betweenDateRight;
	}

	public void setBetweenDateRight(String betweenDateRight) {
		this.betweenDateRight = betweenDateRight;
	}

	@Override
	public String toString() {
		return "FacilitySearchVO [searchCategory=" + searchCategory + ", searchKeyword=" + searchKeyword
				+ ", formCheck=" + Arrays.toString(formCheck) + ", formRadio=" + formRadio + ", date=" + date
				+ ", betweenDateLeft=" + betweenDateLeft + ", betweenDateRight=" + betweenDateRight + ", toString()="
				+ super.toString() + "]";
	}
}
