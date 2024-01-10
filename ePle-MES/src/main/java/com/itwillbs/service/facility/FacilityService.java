package com.itwillbs.service.facility;

import java.util.List;

import com.itwillbs.domain.FacilityVO;
import com.itwillbs.domain.HistoryVO;
import com.itwillbs.domain.LineVO;
import com.itwillbs.domain.PageVO;
import com.itwillbs.domain.StockView;

public interface FacilityService {
	// 검색
	public int getFacilityCount(PageVO vo) throws Exception;
	public List<FacilityVO> getFacilityList(PageVO vo) throws Exception;
		
	// 상세 정보
	public FacilityVO getFacility(String code) throws Exception;
		
	// 창고에 저장된 설비 목록 가져오기(1개 이상)
	// 없는 경우 설비 발주 페이지로 이동!
	public List<StockView> getStockList(String group_id) throws Exception;
		
	// 주문 번호 get(1개만!)
	public String getOrderCode(String material) throws Exception;
		
	// 최근 창고내역 코드 불러오기
	public String getRecentHistory() throws Exception;

	// 최근 설비 불러오기
	public String findLastFacility() throws Exception;
		
	// 생성
	public int insertFacility(FacilityVO vo) throws Exception;
		
	// 내역 삽입
	public int insertHistory(HistoryVO vo) throws Exception;

	// 설비 수정
	public int updateFacility(FacilityVO vo) throws Exception;
		
	// 설비 삭제
	public int deleteFacility(String[] code) throws Exception;
		
	// 설비 목록 불러오기
	public List<FacilityVO> getFacListManager() throws Exception;

	// 라인 목록 불러오기
	public List<LineVO> getLineList() throws Exception;

	// 창고 목록 중 
	public String getWarehouseOne(String material) throws Exception;
}