package com.itwillbs.service.facility;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.FacilityVO;
import com.itwillbs.domain.HistoryVO;
import com.itwillbs.domain.LineVO;
import com.itwillbs.domain.PageVO;
import com.itwillbs.domain.StockVO;
import com.itwillbs.domain.StockView;
import com.itwillbs.persistence.facility.FacilityDAO;

@Service
public class FailityServiceImpl implements FacilityService {

	@Inject
	private FacilityDAO dao;

	// 검색
	@Override
	public int getFacilityCount(PageVO vo) throws Exception{
		return dao.getFacilityCount(vo);
	}
	
	@Override
	public List<FacilityVO> getFacilityList(PageVO vo) throws Exception{
		return dao.getFacilityList(vo);
	}

	// 상세 정보
	@Override
	public FacilityVO getFacility(String code) throws Exception{
		return dao.getFacility(code);
	}

	// 창고에 저장된 설비 목록 가져오기(1개 이상)
	// 없는 경우 설비 발주 페이지로 이동!
	@Override
	public List<StockView> getStockList(String group_id) throws Exception{
		return dao.getStockList(group_id);
	}

	// 주문 번호 get(1개만!)
	@Override
	public String getOrderCode(String material) throws Exception{
		return dao.getOrderCode(material);
	}

	// 최근 창고내역 코드 불러오기
	@Override
	public String getRecentHistory() throws Exception{
		return dao.getRecentHistory();
	}

	// 최근 설비 불러오기
	@Override
	public String findLastFacility() throws Exception{
		return dao.findLastFacility();
	}

	// 생성
	@Override
	public int insertFacility(FacilityVO vo) throws Exception{
		return dao.insertFacility(vo);
	}

	// 내역 삽입
	@Override
	public int insertHistory(HistoryVO vo) throws Exception{
		return dao.insertHistory(vo);
	}

	// 재고 수정
	@Override
	public int updateStock(StockVO vo) throws Exception{
		return dao.updateStock(vo);
	}

	// 설비 수정
	@Override
	public int updateFacility(FacilityVO vo) throws Exception{
		return dao.updateFacility(vo);
	}

	// 설비 삭제
	@Override
	public int deleteFacility(String[] code) throws Exception{
		return dao.deleteFacility(code);
	}

	// 설비 목록 불러오기
	@Override
	public List<FacilityVO> getFacListManager() throws Exception{
		return dao.getFacListManager();
	}

	// 라인 목록 불러오기
	@Override
	public List<LineVO> getLineList() throws Exception{
		return dao.getLineList();
	}
	
	// 창고 목록 중
	@Override
	public String getWarehouseOne(String material) throws Exception{
		return dao.getWarehouseOne(material);
	}
}
