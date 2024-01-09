package com.itwillbs.persistence.facility;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.FacilityVO;
import com.itwillbs.domain.HistoryVO;
import com.itwillbs.domain.LineVO;
import com.itwillbs.domain.PageVO;
import com.itwillbs.domain.StockVO;
import com.itwillbs.domain.StockView;

@Repository
public class FacilityDAOImpl implements FacilityDAO {

	private final String NAMESPACE = "com.itwillbs.mapper.FacilityMapper";
	@Inject
	private SqlSession sqlSession;

	// 설비 목록 검색
	@Override
	public int getFacilityCount(PageVO vo) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getFacilityCount", vo);
	}

	@Override
	public List<FacilityVO> getFacilityList(PageVO vo) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getFacilityList", vo);
	}

	// 상세 정보
	@Override
	public FacilityVO getFacility(String code) throws Exception{
		return sqlSession.selectOne(NAMESPACE + ".getFacility", code);
	}

	// 창고에 저장된 설비 목록 가져오기(1개 이상)
	// 없는 경우 설비 발주 페이지로 이동!
	@Override
	public List<StockView> getStockList(String group_id) throws Exception{
		return sqlSession.selectList(NAMESPACE + ".getStockList", group_id);
	}

	// 주문 번호 get(1개만!)
	@Override
	public String getOrderCode(String material) throws Exception{
		return sqlSession.selectOne(NAMESPACE + ".getOrderCode", material);
	}

	// 최근 창고내역 코드 불러오기
	public String getRecentHistory() throws Exception{
		return sqlSession.selectOne(NAMESPACE + ".getRecentHistory");
	}

	// 최근 설비 불러오기
	@Override
	public String findLastFacility() throws Exception{
		return sqlSession.selectOne(NAMESPACE + ".findLastFacility");
	}

	// 생성
	@Override
	public int insertFacility(FacilityVO vo) throws Exception{
		return sqlSession.insert(NAMESPACE + ".insertFacility", vo);
	}

	// 내역 삽입
	@Override
	public int insertHistory(HistoryVO vo) throws Exception{
		return sqlSession.insert(NAMESPACE + ".insertHistory", vo);
	}

	// 재고 수정
	@Override
	public int updateStock(StockVO vo) throws Exception{
		return sqlSession.update(NAMESPACE + ".updateStock", vo);
	}

	// 설비 수정
	@Override
	public int updateFacility(FacilityVO vo) throws Exception{
		return sqlSession.update(NAMESPACE + ".updateFacility", vo);
	}

	// 설비 삭제
	@Override
	public int deleteFacility(String[] code) throws Exception{
		return sqlSession.delete(NAMESPACE + ".deleteFacility", code);
	}

	// 설비 목록 불러오기
	@Override
	public List<FacilityVO> getFacListManager() throws Exception{
		return sqlSession.selectList(NAMESPACE + ".getFacListManager");
	}

	// 라인 목록 불러오기
	@Override
	public List<LineVO> getLineList() throws Exception{
		return sqlSession.selectList(NAMESPACE + ".getLineList");
	}
	
	@Override
	public String getWarehouseOne(String material) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getWarehouseOne", material);
	}
}
