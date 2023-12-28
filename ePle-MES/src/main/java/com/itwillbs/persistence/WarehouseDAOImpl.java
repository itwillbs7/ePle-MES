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
	public List<WarehouseVO> getWarehouseListAll(Criteria cri) throws Exception {
		logger.debug(" DAO : getWarehouseListAll(Criteria cri) ");
		return sqlSession.selectList(NAMESPACE+".getWarehouseList", cri);
	}

	@Override
	public int getWarehouseCount() throws Exception {
		logger.debug(" DAO : getWarehouseCount() ");
		return sqlSession.selectOne(NAMESPACE + ".countWarehouse");
	}
	
	@Override
	public List<WarehouseVO> getEmployees() throws Exception {
		logger.debug(" DAO : getEmployees() ");
		return sqlSession.selectList(NAMESPACE + ".getEmployees");
	}
	
	@Override
	public List<WarehouseVO> SearchEmployees(String manager, String managerName) throws Exception {
		logger.debug("DAO : SearchEmployees(String manager, String managerName) : "+manager+managerName);
		Map<String,String> paramMap = new HashMap<String,String>();
		paramMap.put("manager", manager);
		paramMap.put("managerName", managerName);
		return sqlSession.selectList(NAMESPACE + ".SearchEmployees",paramMap);
	}
	
	@Override
	public void insertWarehouse(WarehouseVO vo) throws Exception {
		logger.debug(" DAO : insertWarehouse(WarehouseVO vo) : "+vo);
		sqlSession.insert(NAMESPACE+".insertWarehouse", vo);
	}

	@Override
	public void deleteWarehouse(String code) throws Exception {
		logger.debug(" DAO : deleteWarehouse(String code) ");
		sqlSession.delete(NAMESPACE + ".deleteWarehouse", code);
	}
	
	
	
	
	
}