package com.itwillbs.domain;
/**
 * 페이징 처리에 필요한 정보를 저장
 * 	=> 데이터의 총 개수, 시작페이지 번호, 끝 페이지 번호, 이전페이지 링크, 다음페이지 링크, 블럭크기(사이즈)
 * 	=> cri라는 객체를 가져올거임(페이지번호, 페이지 사이즈 저장)
 * 
 * 
 * 	데이터의 총 개수 = totalCount; (DB조회)
 *  끝 페이지 : endPage = 올림(현재 페이지 번호 / 블럭의 크기) * 블럭의 크기
 *  시작페이지 : startPage = (endPage - 블럭의 크기) + 1;
 *  이전 링크 : 젤 처음에만 없으면 됨 = 젤 첫번째 페이지 보고 있을때 없으면 됨
 *  		=> prev(boolean) = startPage != 1 
 *  다음 링크 : next(boolean) = endPage*페이지사이즈 < totalCount
 * 
 */

public class PageVO {
	
	private int totalCount; // 총 개수
	private int startPage;  // 페이지블럭 시작번호
	private int endPage;    // 페이지 블럭 끝번호
	
	private boolean prev;   // 이전링크
	private boolean next;   // 다음링크
	private int displayPageNum = 10; // 페이지 블럭의 크기
	
	private Criteria cri; //page, pageSize
	// 검색용
	private SearchVO search;
	
	// => 페이지번호, 페이지 사이즈 저장
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
		// 페이징처리 정보를 모두 계산
		
		// 끝페이지 번호
		endPage = (int)(Math.ceil(cri.getPage() / (double)displayPageNum)) * displayPageNum;
		// 시작페이지 번호
		startPage = (endPage - displayPageNum)+1;
		
		// 끝 페이지 번호 체크하기(글이 없는 경우) 기존방식
		// 122개 = 122/ 10개씩 -> 12페이지? ㄴㄴ 13페이지
//		int tmpEndPage = totalCount / cri.getPageSize() +(totalCount%cri.getPageSize()==0?0:1);
		
		// 지금(위와 결과값은 동일함) 
		int tmpEndPage = (int)(Math.ceil((double)totalCount / cri.getPageSize()));
		
		if(endPage > tmpEndPage) {
			endPage = tmpEndPage;
		}
		
		// 이전페이지 링크
		prev = startPage != 1;
//		prev = startPage == 1?false:true; // 위와 같은 의미(1이 아닐 때 true)
		
		
		// 다음페이지 링크
		next = endPage * cri.getPageSize() < totalCount;
		
		// 페이징처리 정보를 계산 완료
		
	}// calcData()

	

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
	
	public SearchVO getSearch() {
		return search;
	}
	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}

	public Criteria getCri() {
		return cri;
	}

	public int getTotalPageCount() {
		return (int)(Math.ceil((double)totalCount / cri.getPageSize()));
	}

	@Override
	public String toString() {
		return "PageVO [totalCount=" + totalCount + ", startPage=" + startPage + ", endPage=" + endPage + ", prev="
				+ prev + ", next=" + next + ", displayPageNum=" + displayPageNum + ", cri=" + cri + ", search=" + search
				+ ", toString()=" + super.toString() + "]";
	}
}
