package com.itwillbs.controller;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class testConnection {
	
	private final String NAMESPACE = "com.itwillbs.mapper.MemberMapper";
	@Inject
	private SqlSession sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(testConnection.class);
	
	@Test
	public void DB연결확인() {
		logger.debug("SqlSession : " + sqlSession);
		logger.debug(sqlSession.selectOne(NAMESPACE + ".getTime"));
	}
}
