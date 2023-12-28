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
	public int insertMaintenance(MaintenanceVO vo) throws Exception{
		return sqlSession.insert(NAMESPACE + ".insertMain", vo);
	}
	
	@Override
	public int insertRM(MaintenanceVO vo) throws Exception {
		return sqlSession.insert(NAMESPACE + ".insertRM", vo);
	}
	
	@Override
	public int updateMaintenance(MaintenanceVO vo) throws Exception {
		return sqlSession.update(NAMESPACE + ".updateMaintenance", vo);
	}
	
	@Override
	public int deleteMaintenance(MaintenanceVO vo) throws Exception {
		return sqlSession.delete(NAMESPACE + ".deleteMaintenance", vo);
	}
	
	@Override
	public int getMaintenanceCount(PageVO vo) throws Exception{
		return sqlSession.selectOne(NAMESPACE + ".getMaintenanceCount", vo);
	}
	
	@Override
	public List<MaintenanceVO> getMaintenanceList(PageVO vo) throws Exception{
		return sqlSession.selectList(NAMESPACE + ".getMaintenanceList", vo);
	}
	
	@Override
	public List<MaintenanceVO> getFacilityInfo(FacilityVO vo) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getFacilityList", vo);
	}
	
	@Override
	public MaintenanceVO getDetail(MaintenanceVO vo) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getDetail", vo);
	}
	
	@Override
	public List<MaintenanceVO> getRMList(String emp) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getRMList", emp);
	}
}
