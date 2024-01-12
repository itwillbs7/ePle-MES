package com.production.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.production.domain.BOMVO;
import com.production.domain.instructionVO;
import com.production.domain.requestVO;

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
	public List<instructionVO> ajaxSearch(String[] product,String[] line_code,String[] request, String[] dateRange) throws Exception {
		Map<String,String[]>map = new HashMap<String,String[]>();
		map.put("product", product);
		map.put("line_code", line_code);
		map.put("request", request);
		map.put("dateRange", dateRange);
		return sqlSession.selectList(NAMESPACE + ".ajaxSearch",map);
	}

	@Override
	public List<requestVO> getRequestList() throws Exception {
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
		sqlSession.insert(NAMESPACE + ".insertResult", instVO);
	}

	@Override
	public instructionVO getInstruction(int code) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getInstructionUpdate", code);
	}

	@Override
	public void updateInstruction(instructionVO instVO) throws Exception {
		logger.debug("DAO : updateInstruction(instructionVO instVO) 호출");
		sqlSession.update(NAMESPACE + ".updateInstruction", instVO);
	}

	@Override
	public void disableInstruction(String[] code_arr) throws Exception {
		logger.debug("DAO : disableInstruction(int[] code_arr) 호출");
		Map<String,String[]>map = new HashMap<String,String[]>();
		map.put("code_arr", code_arr);
		sqlSession.delete(NAMESPACE + ".disableInstruction", map);
	}

	@Override
	public requestVO getRequest(String code) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getRequestAll", code);
	}

	@Override
	public List<BOMVO> getBOM(String mapd_code) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getBOM", mapd_code);
	}

}
