package com.itwillbs.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class FacilityDAOImpl implements FacilityDAO {
	private final String NAMESPACE = "com.itwillbs.mapper.FacilityMapper";
	@Inject
	private SqlSession sqlSession;
}
