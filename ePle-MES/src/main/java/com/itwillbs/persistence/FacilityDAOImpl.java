package com.itwillbs.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.FacilityVO;

@Repository
public class FacilityDAOImpl implements FacilityDAO {
	
	private final String NAMESPACE = "com.itwillbs.mapper.FacilityMapper";
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void insertFacility(FacilityVO vo) {
		
	}
	
	@Override
	public int getFacilityCount() throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getFacilityCount");
	}
}
