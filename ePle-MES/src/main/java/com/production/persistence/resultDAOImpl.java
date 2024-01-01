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

import com.production.domain.resultVO;

@Repository
public class resultDAOImpl implements resultDAO{
	
	private static final Logger logger = LoggerFactory.getLogger(resultDAOImpl.class);
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.itwillbs.mapper.resultMapper";

	@Override
	public List<resultVO> getResultList(Timestamp date, String line_code, Boolean isFinish) throws Exception {
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("date", date);
		map.put("line_code", line_code);
		map.put("isFinish", isFinish);
		return sqlSession.selectList(NAMESPACE + ".getResultList");
	}

}
