package com.itwillbs.persistence.facility;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.FacilityVO;
import com.itwillbs.domain.MaintenanceVO;
import com.itwillbs.domain.PageVO;

@Repository
public class MaintenanceDAOImpl implements MaintenanceDAO{
	
	private final String NAMESPACE = "com.itwillbs.mapper.MaintenanceMapper";
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public String getRecentCode(String code) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getRecentCode", code);
	}
	
	@Override
	public int insert(MaintenanceVO vo) throws Exception {
		return sqlSession.insert(NAMESPACE + ".insertMT", vo);
	}
	
	@Override
	public int updateMT(MaintenanceVO vo) throws Exception {
		return sqlSession.update(NAMESPACE + ".updateMT", vo);
	}
	
	@Override
	public int updateResult(MaintenanceVO vo) throws Exception {
		return sqlSession.update(NAMESPACE + ".updateResult", vo);
	}
	
	@Override
	public int delete(String[] codeList) throws Exception {
		return sqlSession.delete(NAMESPACE + ".deleteMT", codeList);
	}
	
	@Override
	public List<MaintenanceVO> getList(PageVO vo) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getList", vo);
	}
	
	@Override
	public int getListCount(PageVO vo) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getListCount", vo);
	}
	
	@Override
	public MaintenanceVO getDetail(String code) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getMain", code);
	}
	
	@Override
	public List<MaintenanceVO> getFacilityInfo(String code) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getFacilityInfo", code);
	}
	
	@Override
	public int getFacilityInfoCount(String code) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getFacilityInfoCount", code);
	}
	
	@Override
	public List<MaintenanceVO> getDailyRM(String emp_code) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getDailyRM", emp_code);
	}
	
	@Override
	public int getDailyRMCount(String emp_code) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getDailyRMCount", emp_code);
	}
	
	@Override
	public List<MaintenanceVO> getAjax(PageVO vo) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getAjax", vo);
	}
}
