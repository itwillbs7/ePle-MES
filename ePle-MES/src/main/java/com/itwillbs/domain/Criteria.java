package com.itwillbs.domain;
/**
 * 페이징 처리 & 검색 처리!
 */
public class Criteria {
	private int page;
	private int pageSize;

	
	public Criteria() {
		this.page = 1;
		this.pageSize = 6;
	}
	
	//GETTER
	public int getPage() {
		return page;
	}
	public int getPageSize() {
		return pageSize;
	}
	
	//SETTER
	public void setPage(int page) {
		if(page<=0) {
			this.page=1;
			return;
		}
		
		this.page = page;
	}
	public void setPageSize(int pageSize) {
		if(pageSize <= 0 || pageSize > 100) {
			this.pageSize = 6;
			return;
		}
		this.pageSize = pageSize;
	}

	public int getStartPage() {
		return (page - 1) * pageSize;
	}

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", pageSize=" + pageSize + ", toString()=" + super.toString() + "]";
	}
}
