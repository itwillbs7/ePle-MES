package com.itwillbs.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	// 입고검색) 품목 목록 (전체)
	@Override
	public List<OrderVO> searchMAPD(OrderVO vo) throws Exception {
		logger.debug("D - searchMAPD(OrderVO vo)");
		return sqlSession.selectList(NAMESPACE + ".searchMAPD", vo);
	}
	// 입고검색) 품목 데이터 수 (전체)
	@Override
	public int searchMAPDCount(OrderVO vo) throws Exception {
		logger.debug("D - searchMAPDCount(OrderVO vo)");
		return sqlSession.selectOne(NAMESPACE + ".searchMAPDCount", vo);
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
	// 발주요청 삭제 
	@Override
	public List<OrderVO> delAskInfo(String[] code_arr) throws Exception{
		Map<String, Object> data = new HashMap<>();
		data.put("code_arr", code_arr);
		List<OrderVO> delAskInfo = sqlSession.selectList(NAMESPACE+".delAskInfo", data);		
	    return delAskInfo;
	}
	@Override
	public void askOrderDel(String[] code_arr) throws Exception {
		Map<String,String[]>data = new HashMap<String,String[]>();
		data.put("code_arr", code_arr);
		sqlSession.delete(NAMESPACE + ".askOrderDel", data);
	}		
	// 발주요청등록) 품목 목록 (원자재) 
	@Override
	public List<OrderVO> searchMaterial(OrderVO vo) throws Exception {
		logger.debug("D - searchMaterial(OrderVO vo)");
		return sqlSession.selectList(NAMESPACE + ".searchMaterial", vo);
	}
	// 발주요청등록) 품목 데이터 수 (원자재) 
	@Override
	public int searchMaterialCount(OrderVO vo) throws Exception {
		logger.debug("D - searchMaterialCount(OrderVO vo)");
		return sqlSession.selectOne(NAMESPACE + ".searchMaterialCount", vo);
	}	
	// 발주관리 등록
	@Override
	public int orderAdd(OrderVO vo) throws Exception {
		logger.debug("D - orderAdd(OrderVO vo)");
		return sqlSession.update(NAMESPACE+".orderAdd", vo);
	}
	// 발주관리 리스트 (페이징)
	@Override
	public List<OrderVO> orderList(OrderVO vo) throws Exception {
		logger.debug("D - orderList(OrderVO vo)");
		return sqlSession.selectList(NAMESPACE + ".orderList", vo);
	}
	// 전체 발주관리 데이터 수
	@Override
	public int orderListCount2(OrderVO vo) throws Exception {
		logger.debug("D - orderListCount2(OrderVO vo)");
		return sqlSession.selectOne(NAMESPACE + ".orderListCount2", vo);
	}
	// 발주관리 상세
	@Override
	public OrderVO orderInfo(String code) throws Exception {
		logger.debug("D - orderInfo(String code)");
		return sqlSession.selectOne(NAMESPACE + ".orderInfo", code); 
	}	
	// 발주관리 수정
	@Override
	public int orderEdit(OrderVO vo)throws Exception {
		logger.debug("D - orderEdit(OrderVO vo)");
		return sqlSession.update(NAMESPACE+".orderEdit", vo);
	}
	// 발주관리 삭제 
	@Override
	public List<OrderVO> delOrderInfo(String[] code_arr) throws Exception{
		Map<String, Object> data = new HashMap<>();
		data.put("code_arr", code_arr);
		List<OrderVO> delOrderInfo = sqlSession.selectList(NAMESPACE+".delOrderInfo", data);		
	    return delOrderInfo;
	}
	@Override
	public void orderDel(String[] code_arr) throws Exception {
		Map<String,String[]>data = new HashMap<String,String[]>();
		data.put("code_arr", code_arr);
		sqlSession.delete(NAMESPACE + ".orderDel", data);
	}	
	// 발주등록) 거래처 목록 
	@Override
	public List<OrderVO> searchClient(OrderVO vo) throws Exception {
		logger.debug("D - searchClient(OrderVO vo)");
		return sqlSession.selectList(NAMESPACE + ".searchClient", vo);
	}
	// 발주등록) 거래처 데이터 수 
	@Override
	public int searchClientCount(OrderVO vo) throws Exception {
		logger.debug("D - searchClientCount(OrderVO vo)");
		return sqlSession.selectOne(NAMESPACE + ".searchClientCount", vo);
	}	
	
	
	
	// 출고 리스트 (페이징)
	@Override
	public List<Warehouse_HistoryVO> outList(Warehouse_HistoryVO vo) throws Exception {
		logger.debug("D - outList(Warehouse_HistoryVO vo)");
		return sqlSession.selectList(NAMESPACE + ".outList", vo);
	}
	// 전체 출고 데이터 수
	@Override
	public int outListCount(Warehouse_HistoryVO vo) throws Exception {
		logger.debug("D - outListCount(Warehouse_HistoryVO vo)");
		return sqlSession.selectOne(NAMESPACE + ".outListCount", vo);
	}
	// 출고 상세
	@Override
	public Warehouse_HistoryVO outInfo(String code) throws Exception {
		logger.debug("D - outInfo(String code)");
		return sqlSession.selectOne(NAMESPACE + ".outInfo", code); // 코드!
	}	
	
	
	
	// 출고 등록
	@Override
	public int outAdd(Warehouse_HistoryVO vo) throws Exception {
		logger.debug("D - outAdd(Warehouse_HistoryVO vo)");
		return sqlSession.update(NAMESPACE + ".outAdd", vo);
	}
	// 출고 최신코드 가져오기
	@Override
	public String outRecentCode() throws Exception {
		logger.debug("D - outRecentCode()");
		return sqlSession.selectOne(NAMESPACE + ".outRecentCode");
	}	
	
	
	
	
}
