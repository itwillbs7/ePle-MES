package com.itwillbs.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.LineVO;
import com.itwillbs.domain.MAPDVO;

@Repository
public class LineDAOImpl implements LineDAO {

	private static final Logger logger = LoggerFactory.getLogger(LineDAOImpl.class);
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE ="com.itwillbs.mapper.LineMapper";

	@Override
	public List<LineVO> getLineListAll() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MAPDVO getLine(String code) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateLine(MAPDVO mvo) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void deleteLine(String code) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<LineVO> getLineListPage(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getLineCount() throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}
