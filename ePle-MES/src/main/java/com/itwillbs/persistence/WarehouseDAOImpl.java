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
import com.itwillbs.domain.WarehouseVO;


@Repository
public class WarehouseDAOImpl implements WarehouseDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(WarehouseDAOImpl.class);

	private static final String NAMESPACE="com.itwillbs.mapper.WarehouseMapper";
	
	@Inject
	private SqlSession sqlSession;
	
	
	
	@Override
	public List<WarehouseVO> getInList(Criteria cri, String searchCode, String searchName) throws Exception {
	    Map<String, Object> data = new HashMap<String, Object>(); 
	    data.put("cri", cri);
	    data.put("searchCode", searchCode);
	    data.put("searchName", searchName);
	    List<WarehouseVO> inList = sqlSession.selectList(NAMESPACE + ".selectInList", data);
	    return inList;
	}

	@Override
	public int getInListCount(String searchCode, String searchName) throws Exception {
		Map<String, Object> data = new HashMap<String, Object>(); 
	    data.put("searchCode", searchCode);
	    data.put("searchName", searchName);
		return sqlSession.selectOne(NAMESPACE+ ".countInList", data);
	}
	
	@Override
	public List<WarehouseVO> getOutList(Criteria cri, String searchCode, String searchName) throws Exception {
		Map<String, Object> data = new HashMap<String, Object>(); 
		data.put("cri", cri);
		data.put("searchCode", searchCode);
		data.put("searchName", searchName);
		List<WarehouseVO> outList = sqlSession.selectList(NAMESPACE + ".selectOutList", data);
		return outList;
	}
	
	@Override
	public int getOutListCount(String searchCode, String searchName) throws Exception {
		Map<String, Object> data = new HashMap<String, Object>(); 
		data.put("searchCode", searchCode);
		data.put("searchName", searchName);
		return sqlSession.selectOne(NAMESPACE+ ".countInList", data);
	}
	

	
	
	@Override
	public List<WarehouseVO> getWarehouseList(Criteria cri, String searchCode, String searchName) throws Exception {
	    Map<String, Object> data = new HashMap<String, Object>(); 
	    data.put("cri", cri);
	    data.put("searchCode", searchCode);
	    data.put("searchName", searchName);
	    List<WarehouseVO> warehouseList = sqlSession.selectList(NAMESPACE + ".selectWarehouseList", data);
	    return warehouseList;
	}

	// 모든 창고 수
	@Override
	public int getWarehouseCount(String searchCode, String searchName) throws Exception {
		Map<String, Object> data = new HashMap<String, Object>(); 
	    data.put("searchCode", searchCode);
	    data.put("searchName", searchName);
		return sqlSession.selectOne(NAMESPACE+ ".countWarehouse", data);
	}
	
	// 사원 검색 팝업 
	@Override
	public List<WarehouseVO> SearchEmployees(Criteria cri, String empCode, String empName) throws Exception {
		Map<String,Object> data = new HashMap<String,Object>();
		data.put("cri", cri);
		data.put("empCode", empCode);
		data.put("empName", empName);
		List<WarehouseVO> SearchEmployees = sqlSession.selectList(NAMESPACE + ".SearchEmployees",data);
		return SearchEmployees;
	}
	
	// 모든 사원 수
	@Override
	public int getEmployeesCount(String empCode, String empName) throws Exception {
		Map<String,Object> data = new HashMap<String,Object>();
		data.put("empCode", empCode);
		data.put("empName", empName);
		return sqlSession.selectOne(NAMESPACE + ".countEmployees",data);
	}
	
	// 창고 삭제	
	@Override
	public List<WarehouseVO> getDelInfo(String[] code_arr) throws Exception{
		Map<String, Object> data = new HashMap<>();
		data.put("code_arr", code_arr);
		List<WarehouseVO> delInfo = sqlSession.selectList(NAMESPACE+".getDelInfo", data);		
	    return delInfo;
	}

	@Override
	public void getDeleteWarehouse(String[] code_arr) throws Exception {
		Map<String,String[]>data = new HashMap<String,String[]>();
		data.put("code_arr", code_arr);
		sqlSession.delete(NAMESPACE + ".deleteWarehouse", data);
	}	
	
	
	
	
	
	
	@Override
	public void insertWarehouse(WarehouseVO vo) throws Exception {
		logger.debug("DAO : insertWarehouse(WarehouseVO vo) : "+vo);
		sqlSession.insert(NAMESPACE+".insertWarehouse", vo);
	}


	
	
	
}