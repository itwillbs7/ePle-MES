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
	
	
	
	// 창고 리스트 (페이징)
	@Override
	public List<WarehouseVO> warehouseList(WarehouseVO vo) throws Exception {
		logger.debug("D - warehouseList(WarehouseVO vo)");
		return sqlSession.selectList(NAMESPACE + ".warehouseList", vo);
	}
	// 전체 창고 데이터 수
	@Override
	public int warehouseListCount(WarehouseVO vo) throws Exception {
		logger.debug("D - warehouseListCount(WarehouseVO vo)");
		return sqlSession.selectOne(NAMESPACE + ".warehouseListCount", vo);
	}
	// 창고 등록
	@Override
	public int warehouseAdd(WarehouseVO vo) throws Exception {
		logger.debug("D - warehouseAdd(WarehouseVO vo)");
		return sqlSession.insert(NAMESPACE + ".warehouseAdd", vo);
	}
	// 창고 상세
	@Override
	public WarehouseVO warehouseInfo(String code) throws Exception {
		logger.debug("D - warehouseInfo(String code)");
		return sqlSession.selectOne(NAMESPACE + ".warehouseInfo", code); 
	}	
	// 창고 수정
	@Override
	public int warehouseEdit(WarehouseVO vo)throws Exception {
		logger.debug("D - warehouseEdit(WarehouseVO vo)");
		return sqlSession.update(NAMESPACE+".warehouseEdit", vo);
	}
	// 창고 삭제
	@Override
	public List<WarehouseVO> delInfo(String[] code_arr)throws Exception {
		Map<String, Object> data = new HashMap<>();
		data.put("code_arr", code_arr);
		List<WarehouseVO> delInfo = sqlSession.selectList(NAMESPACE+".delInfo", data);		
	    return delInfo;
	}
	@Override
	public void warehouseDel(String[] code_arr) throws Exception {
		Map<String,String[]>data = new HashMap<String,String[]>();
		data.put("code_arr", code_arr);
		sqlSession.delete(NAMESPACE + ".warehouseDel", data);
	}		
	// 창고등록) 사원 목록  
	@Override
	public List<WarehouseVO> searchEmployees(WarehouseVO vo) throws Exception {
		logger.debug("D - searchEmployees(WarehouseVO vo)");
		return sqlSession.selectList(NAMESPACE + ".searchEmployees", vo);
	}
	// 창고등록) 사원 목록 데이터 수
	@Override
	public int searchEmployeesCount(WarehouseVO vo) throws Exception {
		logger.debug("D - searchEmployeesCount(WarehouseVO vo)");
		return sqlSession.selectOne(NAMESPACE + ".searchEmployeesCount", vo);
	}
	
	 /*-----------------------------------------------------------------*/
	
	// 재고 리스트 (페이징)
	@Override
	public List<WarehouseVO> stockList(WarehouseVO vo) throws Exception {
		logger.debug("D - stockList(WarehouseVO vo)");
		return sqlSession.selectList(NAMESPACE + ".stockList", vo);
	}
	// 전체 재고 데이터 수
	@Override
	public int stockListCount(WarehouseVO vo) throws Exception {
		logger.debug("D - stockListCount(WarehouseVO vo)");
		return sqlSession.selectOne(NAMESPACE + ".stockListCount", vo);
	}
	// 재고 상세
	@Override
	public WarehouseVO stockInfo(String code) throws Exception {
		logger.debug("D - stockInfo(String code)");
		return sqlSession.selectOne(NAMESPACE + ".stockInfo", code); 
	}	
	// 재고 수정
	@Override
	public int stockEdit(WarehouseVO vo) throws Exception {
		logger.debug("D - stockEdit(WarehouseVO vo)");
		return sqlSession.update(NAMESPACE+".stockEdit", vo);
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
