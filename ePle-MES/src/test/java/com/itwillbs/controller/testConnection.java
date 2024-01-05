package com.itwillbs.controller;

import java.util.Date;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.itwillbs.domain.FacilityVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class testConnection {
	
	private final String NAMESPACE = "com.itwillbs.mapper.systemMapper";
	@Inject
	private SqlSession sqlSession;
	
	private final String FacilityMapper = "com.itwillbs.mapper.FacilityMapper";
	private final String MainMapper = "com.itwillbs.mapper.MaintenanceMapper";
	
	private static final Logger logger = LoggerFactory.getLogger(testConnection.class);
	
	@Test
	public void DB연결확인() {
		logger.debug("testststststststststtest");
		logger.debug("SqlSession : " + sqlSession);
	}
	
}
