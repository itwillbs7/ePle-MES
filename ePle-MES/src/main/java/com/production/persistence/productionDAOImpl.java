package com.production.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.production.domain.ajaxSearchVO;
import com.production.domain.instructionVO;

@Repository
public class productionDAOImpl implements productionDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(productionDAOImpl.class);
	
	@Inject
	private SqlSession sqlSession;
	
	private final static String NAMESPACE = "com.itwillbs.mapper.productionMapper";

	@Override
	public List<instructionVO> getInstruction() throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getInstruction");
	}

	@Override
	public List<String> getProduct() throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getProduct");
	}

	@Override
	public List<String> getLine_code() throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getLine_code");
	}

	@Override
	public List<String> getRequest() throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getRequest");
	}

	@Override
	public List<instructionVO> ajaxSearch(ajaxSearchVO vo) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".ajaxSearch",vo);
	}

}
