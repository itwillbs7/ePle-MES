package com.itwillbs.persistence;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.UserVO;

@Repository
public class MainDAOImpl implements MainDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(MainDAOImpl.class);
	@Inject
	private SqlSession sqlsession;
	private static final String NAMESPACE="com.itwillbs.mapper.mainMapper";
	
	@Override
	public UserVO getUserInfo(UserVO uvo) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(NAMESPACE+".selectUserInfo", uvo);
	}
	
	@Override
	public List<HashMap<String, Object>> getWeeklyProduction() throws Exception {
		return sqlsession.selectList(NAMESPACE + ".getWeeklyProduction");
	}
}
