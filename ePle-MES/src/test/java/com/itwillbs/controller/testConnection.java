package com.itwillbs.controller;

import java.sql.Date;

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
	
	@Inject
	private SqlSession sqlSession;
	
	private final String FacilityMapper = "com.itwillbs.mapper.FacilityMapper";
	private final String MainMapper = "com.itwillbs.mapper.MaintenanceMapper";
	
	private static final Logger logger = LoggerFactory.getLogger(testConnection.class);
	
	@Test
	public void 설비추가테스트() {
		FacilityVO vo = new FacilityVO();
		vo.setCode("FAC2023122901");
		vo.setCategory("etc");
		vo.setName("실험");
		vo.setModel("TEST-01");
		vo.setLine_code("testCode1");
		vo.setLocation("제1공장");
		vo.setInprice(500000);
		Date dt = new Date(2023-1999, 11, 29);
		vo.setPurchase_date(dt);
		sqlSession.insert(FacilityMapper + ".insertFacility", vo);
	}
}
