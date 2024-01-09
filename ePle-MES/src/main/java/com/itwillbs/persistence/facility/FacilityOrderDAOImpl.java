package com.itwillbs.persistence.facility;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.FacilityOrderVO;
import com.itwillbs.domain.MAPDVO;
import com.itwillbs.domain.PageVO;

@Repository
public class FacilityOrderDAOImpl implements FacilityOrderDAO{
	
	private final static String NAMESPACE = "com.itwillbs.mapper.FacilityOrderMapper";
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public int getFacilityOrderCount(PageVO vo) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getOrderCount", vo);
	}
	
	@Override
	public List<FacilityOrderVO> getFacilityOrderList(PageVO vo) throws Exception{
		return sqlSession.selectList(NAMESPACE + ".getOrderList", vo);
	}
	
	@Override
	public int insertFacilityOrder(FacilityOrderVO vo) throws Exception{
		return sqlSession.insert(NAMESPACE + ".insertOrder", vo);
	}
	
	@Override
	public int updateFacilityOrder(FacilityOrderVO vo) throws Exception{
		return sqlSession.update(NAMESPACE + ".updateOrder", vo);
	}
	
	@Override
	public int deleteFacilityOrder(String[] codeList) throws Exception{
		return sqlSession.delete(NAMESPACE + ".deleteOrder", codeList);
	}
	
	@Override
	public List<MAPDVO> getMapdList(String group_id) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getMapdList", group_id);
	}
	
	@Override
	public String getRecentCode() throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getRecentCode");
	}
	
	@Override
	public FacilityOrderVO getDetail(String code) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getDetail", code);
	}
}
