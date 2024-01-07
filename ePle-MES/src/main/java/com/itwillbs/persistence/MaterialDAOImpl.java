package com.itwillbs.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.OrderVO;
import com.itwillbs.domain.WarehouseVO;
import com.itwillbs.domain.Warehouse_HistoryVO;

@Repository
public class MaterialDAOImpl implements MaterialDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(MaterialDAOImpl.class);

	private static final String NAMESPACE="com.itwillbs.mapper.MaterialMapper";
	
	@Inject
	private SqlSession sqlSession;
	
	// 입고 리스트 (페이징)
	@Override
	public List<Warehouse_HistoryVO> getInList(Warehouse_HistoryVO vo) throws Exception {
		logger.debug("D - getInList(Warehouse_HistoryVO vo)");
		return sqlSession.selectList(NAMESPACE + ".InList", vo);
	}
	// 전체 입고 데이터 수
	@Override
	public int getInListCount(Warehouse_HistoryVO vo) throws Exception {
		logger.debug("D - getInListCount(Warehouse_HistoryVO vo)");
		return sqlSession.selectOne(NAMESPACE + ".InListCount", vo);
	}
	// 입고 등록
	@Override
	public int inAdd(Warehouse_HistoryVO vo) throws Exception {
		logger.debug("D - inAdd(Warehouse_HistoryVO vo)");
		return sqlSession.insert(NAMESPACE + ".InAdd", vo);
	}
	// 최신코드 가져오기
	@Override
	public String getRecentCode() throws Exception {
		logger.debug("D - getRecentCode()");
		return sqlSession.selectOne(NAMESPACE + ".getRecentCode");
	}
	// 입고 상세
	@Override
	public Warehouse_HistoryVO inInfo(String code) throws Exception {
		logger.debug("D - inInfo(String code)");
		return sqlSession.selectOne(NAMESPACE + ".inInfo", code); // 코드!
	}	
	// 입고 수정
	@Override
	public int inEdit(Warehouse_HistoryVO vo) throws Exception {
		logger.debug("D - inEdit(Warehouse_HistoryVO vo)");
		return sqlSession.update(NAMESPACE+".inEdit", vo);
	}
	
	
	
	// 입고등록) 발주 목록 
	@Override
	public List<OrderVO> searchOrder(OrderVO vo) throws Exception {
		logger.debug("D - searchOrder(OrderVO vo)");
		return sqlSession.selectList(NAMESPACE + ".SearchOrder", vo);
	}
	// 입고등록) 발주 목록 데이터 수
	@Override
	public int orderListCount(OrderVO vo) throws Exception {
		logger.debug("D - orderListCount(OrderVO vo)");
		return sqlSession.selectOne(NAMESPACE + ".OrderListCount", vo);
	}
	// 입고등록) 발주 상태 업데이트	
	@Override
	public int updateComplete(OrderVO vo) throws Exception {
		logger.debug("D - updateComplete(OrderVO vo)");
		return sqlSession.update(NAMESPACE + ".updateComplete", vo);
	}
	// 입고등록) 창고 목록 (원자재)
	@Override
	public List<WarehouseVO> orderWarehouse(WarehouseVO vo) throws Exception {
		logger.debug("D - orderWarehouse(WarehouseVO vo)");
		return sqlSession.selectList(NAMESPACE + ".orderWarehouse", vo);
	}
	// 입고등록) 창고 데이터 수 (원자재)
	@Override
	public int warehouseListCount(WarehouseVO vo) throws Exception {
		logger.debug("D - warehouseListCount(WarehouseVO vo)");
		return sqlSession.selectOne(NAMESPACE + ".warehouseListCount", vo);
	}	
	
	
	
	// 발주요청 리스트 (페이징)
	@Override
	public List<OrderVO> askOrderList(OrderVO vo) throws Exception {
		logger.debug("D - askOrderList(OrderVO vo)");
		return sqlSession.selectList(NAMESPACE + ".askOrderList", vo);
	}
	// 전체 발주요청 데이터 수
	@Override
	public int askOrderListCount(OrderVO vo) throws Exception {
		logger.debug("D - askOrderListCount(OrderVO vo)");
		return sqlSession.selectOne(NAMESPACE + ".askOrderListCount", vo);
	}
	// 발주요청 등록
	@Override
	public int askOrderAdd(OrderVO vo) throws Exception {
		logger.debug("D - askOrderAdd(OrderVO vo)");
		return sqlSession.insert(NAMESPACE + ".askOrderAdd", vo);
	}
	// 발주 최신코드 가져오기
	@Override
	public String orderRecentCode() throws Exception {
		logger.debug("D - orderRecentCode()");
		return sqlSession.selectOne(NAMESPACE + ".orderRecentCode");
	}
	// 발주요청 상세
	@Override
	public OrderVO askOrderInfo(String code) throws Exception {
		logger.debug("D - askOrderInfo(String code)");
		return sqlSession.selectOne(NAMESPACE + ".askOrderInfo", code); 
	}	
	// 발주요청 수정
	@Override
	public int askOrderEdit(OrderVO vo) throws Exception {
		logger.debug("D - askOrderEdit(OrderVO vo)");
		return sqlSession.update(NAMESPACE+".askOrderEdit", vo);
	}
	
	
	
	// 발주요청등록) 품목 목록 (원자재) 
	@Override
	public List<OrderVO> searchMAPD(OrderVO vo) throws Exception {
		logger.debug("D - searchMAPD(OrderVO vo)");
		return sqlSession.selectList(NAMESPACE + ".searchMAPD", vo);
	}
	// 발주요청등록) 품목 데이터 수 (원자재) 
	@Override
	public int searchMAPDCount(OrderVO vo) throws Exception {
		logger.debug("D - searchMAPDCount(OrderVO vo)");
		return sqlSession.selectOne(NAMESPACE + ".searchMAPDCount", vo);
	}	
	

	
	
}
