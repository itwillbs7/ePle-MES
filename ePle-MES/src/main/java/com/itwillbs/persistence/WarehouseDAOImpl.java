package com.itwillbs.persistence;

import java.util.List;

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
		logger.debug("getWarehouseListAll(Criteria cri) ");
		return sqlSession.selectList(NAMESPACE+".getWarehouseList", cri);
	}

	@Override
	public int getWarehouseCount() throws Exception {
		logger.debug(" DAO : getWarehouseCount() ");
		return sqlSession.selectOne(NAMESPACE + ".countWarehouse");
	}
	
	
	
	@Override
	public void insertWarehouse(WarehouseVO vo) throws Exception {
		logger.debug("insertWarehouse(WarehouseVO vo) : "+vo);
		sqlSession.insert(NAMESPACE+".insertWarehouse", vo);
	}


	
}