package com.itwillbs.persistence.facility;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.FacilityVO;
import com.itwillbs.domain.LineVO;
import com.itwillbs.domain.PageVO;

@Repository
public class FacilityDAOImpl implements FacilityDAO {
	
	private final String NAMESPACE = "com.itwillbs.mapper.FacilityMapper";
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public int insertFacility(FacilityVO vo) throws Exception {
		return sqlSession.insert(NAMESPACE + ".insertFacility", vo);
	}
	
	@Override
	public int updateFacility(FacilityVO vo) throws Exception {
		return sqlSession.update(NAMESPACE + ".updateFacility", vo);
	}
	
	@Override
	public int deleteFacility(String[] code) throws Exception {
		return sqlSession.delete(NAMESPACE + ".deleteFacility", code);
	}
	
	@Override
	public int getFacilityCount(PageVO vo) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getFacilityCount", vo);
	}
	
	@Override
	public List<FacilityVO> getFacilityList(PageVO vo) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getFacilityList", vo);
	}
	
	@Override
	public List<FacilityVO> getExportList(PageVO vo) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getExportList", vo);
	}
	
	@Override
	public FacilityVO getFacility(FacilityVO vo) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getFacility", vo);
	}
	
	@Override
	public String getRecentFacility() throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".findLastFacility");
	}
	
	@Override
	public List<LineVO> getLineList() throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getLineList");
	}
}
