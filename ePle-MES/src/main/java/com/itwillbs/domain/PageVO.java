package com.itwillbs.domain;

/** 페이징 처리에 필요한 정보를 저장 
		=> 총 개수, 시작 페이지, 끝 페이지 번호, 이전, 다음 페이지 링크, 
			블럭의 크기 + Cri(페이지번호, 페이지 사이즈)
**/

public class PageVO {
	private int totalCount;
	private int startPage;
	private int endPage;

	private boolean prev;
	private boolean next;

	private int displayPageNum = 5;

	// 페이지 현재 정보
	private Criteria cri;
	// 검색용
	private SearchVO search;

	public void setCri(Criteria cri) {
		this.cri = cri;
	}
	
	public void setSearch(SearchVO search) {
		this.search = search;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}

	private void calcData() {
		// 페이징 처리 정보를 모두 계산
		endPage = (int) (Math.ceil((double) cri.getPage() / (double) displayPageNum)) * displayPageNum;

		// 끝 페이지 번호 체크 (글이 없는 경우)
		int tmpEndPage = (int) (Math.ceil((double) totalCount / (double) cri.getPageSize()));
		if (endPage > tmpEndPage)
			endPage = tmpEndPage;

		startPage = (endPage - displayPageNum) + 1;
		if (startPage <= 0) startPage = 1;
		prev = startPage != 1;
		next = endPage * cri.getPageSize() < totalCount;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public int getStartPage() {
		return startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public boolean isNext() {
		return next;
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public Criteria getCri() {
		return cri;
	}
	
	public SearchVO getSearch() {
		return search;
	}

	@Override
	public String toString() {
		return "PageVO [totalCount=" + totalCount + ", startPage=" + startPage + ", endPage=" + endPage + ", prev="
				+ prev + ", next=" + next + ", displayPageNum=" + displayPageNum + ", cri=" + cri + ", search=" + search
				+ ", toString()=" + super.toString() + "]";
	}
}