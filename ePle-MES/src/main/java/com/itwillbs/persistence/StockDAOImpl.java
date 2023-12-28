package com.itwillbs.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.StockVO;
import com.itwillbs.domain.WarehouseVO;

public class StockDAOImpl implements StockDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(StockDAOImpl.class);

	private static final String NAMESPACE="com.itwillbs.mapper.StockMapper";
	
	@Inject
	private SqlSession sqlSession;
	
	
	@Override
	public List<StockVO> stockList(Criteria cri) throws Exception {
		logger.debug(" DAO : stockList(Criteria cri) ");
		return sqlSession.selectList(NAMESPACE+".getStockList", cri);
	}

	@Override
	public int getStockCount() throws Exception {
		logger.debug(" DAO : getStockCount() ");
		return sqlSession.selectOne(NAMESPACE + ".countStock");
	}
	
	@Override
	public void insertStock(StockVO vo) throws Exception {
		logger.debug("insertStock(StockVO vo) : "+vo);
		sqlSession.insert(NAMESPACE+".insertStock", vo);
	}
	
	
}
