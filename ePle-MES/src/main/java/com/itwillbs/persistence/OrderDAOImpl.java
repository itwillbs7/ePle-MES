package com.itwillbs.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.OrderVO;

@Repository
public class OrderDAOImpl implements OrderDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(OrderDAOImpl.class);

	private static final String NAMESPACE="com.itwillbs.mapper.OrderMapper";
	
	@Inject
	private SqlSession sqlSession;
	
	
	@Override
	public List<OrderVO> getOrderListAll(Criteria cri) throws Exception {
		logger.debug("getOrderListAll(Criteria cri) ");
		return sqlSession.selectList(NAMESPACE+".getOrderList", cri);
	}

	@Override
	public int getOrderCount() throws Exception {
		logger.debug(" DAO : getOrderCount() ");
		return sqlSession.selectOne(NAMESPACE + ".countOrder");
	}
	
	
	
	
}
