package com.itwillbs.persistence.facility;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.LineOffVO;
import com.itwillbs.domain.LineVO;

@Repository
public class OffDAOImpl implements OffDAO{
	
	private final static String NAMESPACE = "com.itwillbs.mapper.LineOffMapper";
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public int insert(List<LineOffVO> vo) throws Exception {
		return sqlSession.insert(NAMESPACE + ".insert", vo);
	}
	
	@Override
	public int reservation(List<LineOffVO> vo) throws Exception {
		return sqlSession.insert(NAMESPACE + ".reservation", vo);
	}
	
	@Override
	public String getRecentCode() throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getRecentCode");
	}
	
	@Override
	public int updateEndTime(String[] code) throws Exception {
		return sqlSession.update(NAMESPACE + ".updateEndTime", code);
	}
	
	@Override
	public int setLineOn(String[] code) throws Exception {
		return sqlSession.update(NAMESPACE + ".setLineOn", code);
	}
	
	@Override
	public int setLineOff(String[] code) throws Exception {
		return sqlSession.update(NAMESPACE + ".setLineOff", code);
	}
	
	@Override
	public List<String> getRenewList(String column) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("column", column);
		return sqlSession.selectList(NAMESPACE + ".getRenewList", map);
	}
	
	@Override
	public List<LineVO> getLineList() throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getLineList");
	}
	
	@Override
	public List<LineOffVO> getCommonGroup() throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getCommonGroup");
	}
	
	@Override
	public List<LineOffVO> getCommonCode(String group_id) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getCommonCode", group_id);
	}
	
	@Override
	public LineVO getDetail(String code) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getDetail", code);
	}
	
	@Override
	public List<LineOffVO> getDetailList(String code) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getDetailList", code);
	}
	
	@Override
	public void setLineOffComplete() throws Exception {
		sqlSession.update(NAMESPACE + ".setLineOffComplete");
	}
}
