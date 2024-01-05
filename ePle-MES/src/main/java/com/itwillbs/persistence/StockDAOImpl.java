package com.itwillbs.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.OrderVO;
import com.itwillbs.domain.StockVO;
import com.itwillbs.domain.WarehouseVO;

@Repository
public class StockDAOImpl implements StockDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(StockDAOImpl.class);

	private static final String NAMESPACE="com.itwillbs.mapper.StockMapper";
	
	@Inject
	private SqlSession sqlSession;
	
	
	// 재고 목록 ~ 재고 검색 
	@Override
	public List<StockVO> getStockList(Criteria cri, String searchWarehouse, String searchMapd) throws Exception {
	    Map<String, Object> data = new HashMap<String, Object>(); 
	    data.put("cri", cri);
	    data.put("searchWarehouse", searchWarehouse);
	    data.put("searchMapd", searchMapd);
	    List<StockVO> stockList = sqlSession.selectList(NAMESPACE + ".selectStockList", data);
	    return stockList;
	}

	// 모든 재고 데이터 수
	@Override
	public int getStockCount(String searchWarehouse, String searchMapd) throws Exception {
		Map<String, Object> data = new HashMap<String, Object>(); 
	    data.put("searchWarehouse", searchWarehouse);
	    data.put("searchMapd", searchMapd);
		return sqlSession.selectOne(NAMESPACE+ ".countStock", data);
	}
	
	// 품목 검색 팝업 
	@Override
	public List<StockVO> SearchMAPD(Criteria cri, String mapdCode, String mapdName) throws Exception {
		Map<String,Object> data = new HashMap<String,Object>();
		data.put("cri", cri);
		data.put("mapdCode", mapdCode);
		data.put("mapdName", mapdName);
		List<StockVO> SearchMAPD = sqlSession.selectList(NAMESPACE + ".SearchMAPD",data);
		return SearchMAPD;
	}
	
	// 모든 품목 수
	@Override
	public int getMAPDCount(String mapdCode, String mapdName) throws Exception {
		Map<String,Object> data = new HashMap<String,Object>();
		data.put("mapdCode", mapdCode);
		data.put("mapdName", mapdName);
		return sqlSession.selectOne(NAMESPACE + ".countMAPD",data);
	}
	
	// 창고 검색 팝업 
	@Override
	public List<StockVO> searchWarehouse(Criteria cri, String whCode, String WhName) throws Exception {
		Map<String,Object> data = new HashMap<String,Object>();
		data.put("cri", cri);
		data.put("whCode", whCode);
		data.put("WhName", WhName);
		List<StockVO> SearchMAPD = sqlSession.selectList(NAMESPACE + ".SearchWarehouse",data);
		return SearchMAPD;
	}
	
	// 모든 창고 수
	@Override
	public int getWarehouseCount(String whCode, String WhName) throws Exception {
		Map<String,Object> data = new HashMap<String,Object>();
		data.put("whCode", whCode);
		data.put("WhName", WhName);
		return sqlSession.selectOne(NAMESPACE + ".countWarehouse",data);
	}
		
	
	
	
	
	
}
