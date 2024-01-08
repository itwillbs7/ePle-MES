package com.production.persistence;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.production.domain.BOMVO;
import com.production.domain.failedVO;
import com.production.domain.resultVO;

@Repository
public class resultDAOImpl implements resultDAO{
	
	private static final Logger logger = LoggerFactory.getLogger(resultDAOImpl.class);
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.itwillbs.mapper.resultMapper";

	@Override
	public List<resultVO> getResultList(String date, String[] line_code, Boolean isFinish) throws Exception {
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("date", date);
		map.put("line_code", line_code);
		map.put("isFinish", isFinish);
		return sqlSession.selectList(NAMESPACE + ".getResultList");
	}

	@Override
	public resultVO getResult(String code) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getResult",code);
	}

	@Override
	public List<failedVO> getFailedList(String code) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getFailedList",code);
	}

	@Override
	public BOMVO getBOM(String code) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getBOM",code);
	}

	@Override
	public List<String> getLine_codeList() throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getLine_codeList");
	}

}
