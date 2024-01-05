package com.itwillbs.persistence.facility;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.FacMtVO;

@Repository
public class MtDAOImpl implements MtDAO{
	
	private final String NAMESPACE = "com.itwillbs.mapper.FacMtMapper";
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public String getRecentCode(String code) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getRecentCode", code);
	}
	
	@Override
	public List<FacMtVO> getStatusList() throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getStatusList");
	}
	
	@Override
	public List<FacMtVO> getOrderList() throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getOrderList");
	}
	
	@Override
	public int getOrderCount() throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getOrderCount");
	}
	
	@Override
	public List<FacMtVO> getMtList(String code) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getMtList", code);
	}
	
	@Override
	public int getMtListCount(String code) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getMtListCount", code);
	}
	
	@Override
	public List<FacMtVO> getResultList(String code) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getResultList", code);
	}
	
	@Override
	public int getResultCount(String code) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getResultCount", code);
	}
	
	@Override
	public List<FacMtVO> getRoutineList(String code) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getRoutineList", code);
	}
	
	@Override
	public int getRoutineCount(String code) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getRoutineCount", code);
	}
	
	@Override
	public int insertRoutine(FacMtVO vo) throws Exception {
		return sqlSession.insert(NAMESPACE + ".insertRoutine", vo);
	}
	
	@Override
	public int setResult(FacMtVO vo) throws Exception {
		return sqlSession.update(NAMESPACE + ".setResult", vo);
	}
	
	
	@Override
	public List<FacMtVO> getInsertedList(String emp_code) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getInsertedList", emp_code);
	}
	
	@Override
	public int insertProblem(FacMtVO vo) throws Exception {
		return sqlSession.insert(NAMESPACE + ".insertProblem", vo);
	}
	
	@Override
	public int updateProblem(FacMtVO vo) throws Exception {
		return sqlSession.update(NAMESPACE + ".updateProblem", vo);
	}
	
	@Override
	public int deleteProblem(String code) throws Exception {
		return sqlSession.delete(NAMESPACE + ".deleteProblem", code);
	}
}
