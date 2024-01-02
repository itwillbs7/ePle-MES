package com.itwillbs.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.RequestVO;

@Repository
public class ShipmentDAOImpl implements ShipmentDAO {
	private static final Logger logger = LoggerFactory.getLogger(ShipmentDAOImpl.class);
	
	private static final String NAMESPACE="com.itwillbs.mapper.shipmentMapper";
	
	@Inject
	private SqlSession sqlSession;

	@Override
	public List<RequestVO> getShipmentListPage(Criteria cri) throws Exception {
		logger.debug("DAO 페이징 처리 getRequestListPage(Criteria cri) + "+ cri);

		return sqlSession.selectList(NAMESPACE+".listPage", cri);
	}
	
	@Override
	public List<RequestVO> getShipmentListPage(int page) throws Exception {
		// 페이징 처리 계산
		// page 1 => 1 ~ 10   => limit 0, 10 이라고 해야함
		// page 2 => 11 ~ 20  => limit 10, 10
		// page 3 => 21 ~ 30  => limit 20, 10		return null;
		
		page = (page-1)*10;
		return sqlSession.selectList(NAMESPACE+".listPage",page);
	}
	
	
}
