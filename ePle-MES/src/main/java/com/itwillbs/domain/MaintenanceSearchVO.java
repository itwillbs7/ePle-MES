package com.itwillbs.domain;

import java.util.Arrays;

public class MaintenanceSearchVO implements SearchVO{
	// 검색 카테고리(컬럼)
	private String searchCategory;
	private String searchKeyword;
	
	// 체크박스
	private String[] formCheck;
	
	// 라디오
	private String formRadio;
	
	// 카테고리
	private String[] category;
	
	// 날짜
	private String date;
	
	// 기간
	private String betweenDateLeft;
	private String betweenDateRight;
	
	public String getResult() {
		// 검색(where 지문 뒤에 작성될 코드)
		StringBuffer sb = new StringBuffer();
		if(searchKeyword.isBlank() || searchKeyword.isEmpty());
		else {
			if(searchCategory.isEmpty() || searchCategory.isBlank()) {
				sb.append("(index =" + searchKeyword + " or ");
				sb.append("emp_code = " + searchKeyword + " or ");
				sb.append("fac_code = " + searchKeyword + " or ");
				sb.append("manager = " + searchKeyword + " or ");
				sb.append("res_info = " + searchKeyword + " ) and ");
			}
			else {
				sb.append(searchCategory + " = " + searchKeyword + " and ");
			}
		}
		
		// 체크박스
		if(formCheck.length > 0) {
			sb.append("(group_id = 0 and (");
			for(int i = 0; i<formCheck.length; i++) {
				sb.append("code_id = " + formCheck[i]);
				if(i < formCheck.length - 1) sb.append(" or ");
			}
			sb.append(") and ");
		}
		
		
		// 라디오
		if(formRadio.equals("complete")) {
			sb.append("complete = true and");
		}
		else if(formRadio.equals("imcomplete")) {
			sb.append("complete = false and");
		}
		
		// 기간
		
		
		return sb.toString();
	}

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

	public String[] getCategory() {
		return category;
	}

	public void setCategory(String[] category) {
		this.category = category;
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
		return "MaintenanceSearchVO [searchCategory=" + searchCategory + ", searchKeyword=" + searchKeyword
				+ ", formCheck=" + Arrays.toString(formCheck) + ", formRadio=" + formRadio + ", category="
				+ Arrays.toString(category) + ", date=" + date + ", betweenDateLeft=" + betweenDateLeft
				+ ", betweenDateRight=" + betweenDateRight + ", toString()=" + super.toString() + "]";
	}
}
