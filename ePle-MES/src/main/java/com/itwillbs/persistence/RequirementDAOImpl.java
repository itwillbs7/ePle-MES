package com.itwillbs.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.production.domain.BOMVO;
import com.production.domain.ProductVO;
import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.MAPDVO;

@Repository
public class RequirementDAOImpl implements RequirementDAO {

	private static final Logger logger = LoggerFactory.getLogger(RequirementDAOImpl.class);
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE ="com.itwillbs.mapper.RequirementMapper";
	
	@Override
	public List<ProductVO> getProductList() throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getProductList");
	}
	
	@Override
	public ProductVO getProduct(String code) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getProduct", code);
	}
	
	@Override
	public List<BOMVO> getBomList(String code) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getBomList", code);
	}
	
	@Override
	public int addMaterial(BOMVO vo) throws Exception {
		return sqlSession.insert(NAMESPACE + ".addMaterial", vo);
	}
	
	@Override
	public int updateMaterial(BOMVO vo) throws Exception {
		return sqlSession.update(NAMESPACE + ".updateMaterial", vo);
	}
	
	@Override
	public int deleteMaterial(String[] code) throws Exception {
		return sqlSession.delete(NAMESPACE + ".deleteMaterial", code);
	}
	
	@Override
	public List<MAPDVO> getMapdList() throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getMapdList");
	}
	
	@Override
	public List<MAPDVO> getMaterialList() throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getMaterialList");
	}
	
	@Override
	public int getRecentBno() throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getRecentBno");
	}
}
