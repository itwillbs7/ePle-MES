package com.production.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

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
	public List<instructionVO> ajaxSearch(String[] product,String[] line_code,String[] request) throws Exception {
		Map<String,String[]>map = new HashMap<String,String[]>();
		map.put("product", product);
		map.put("line_code", line_code);
		map.put("request", request);
		return sqlSession.selectList(NAMESPACE + ".ajaxSearch",map);
	}

	@Override
	public List<String> getRequestList() throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getRequestList");
	}

	@Override
	public List<String> getProductList(String request) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getProductList",request);
	}

	@Override
	public int getAmount() throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getAmount");
	}

	@Override
	public List<String> getLine_codeList() throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getLine_codeList");
	}

	@Override
	public void insertInstruction(instructionVO instVO) throws Exception {
		logger.debug("DAO : insertInstruction(instructionVO instVO) 호출");
		sqlSession.insert(NAMESPACE + ".insertInstruction", instVO);
	}

}
