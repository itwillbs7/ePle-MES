package com.itwillbs.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.FacilitySearchVO;
import com.itwillbs.domain.FacilityVO;
import com.itwillbs.domain.PageVO;

@Repository
public class FacilityDAOImpl implements FacilityDAO {
	
	private final String NAMESPACE = "com.itwillbs.mapper.FacilityMapper";
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public int insertFacility(FacilityVO vo) throws Exception {
		return sqlSession.insert(NAMESPACE + "", vo);
	}
	
	@Override
	public int getFacilityCount(PageVO vo) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "", vo);
	}
	
	@Override
	public List<FacilityVO> getFacilityList(PageVO vo) throws Exception {
		return sqlSession.selectList(NAMESPACE + "", vo);
	}
	
}
