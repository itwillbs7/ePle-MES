package com.itwillbs.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MaintenanceDAOImpl implements MaintenanceDAO{
	private final String NAMESPACE = "com.itwillbs.mapper.MaintenanceMapper";
	@Inject
	private SqlSession sqlSession;
}
