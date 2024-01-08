package com.itwillbs.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.LineVO;

@Repository
public class LineDAOImpl implements LineDAO {

	private static final Logger logger = LoggerFactory.getLogger(LineDAOImpl.class);
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE ="com.itwillbs.mapper.LineMapper";

	@Override
	public List<LineVO> getLineListAll() throws Exception {
		return sqlSession.selectList(NAMESPACE + ".selectLineList");
	}

	@Override
	public LineVO getLine(String code) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getLine",code);
	}

	@Override
	public int updateLine(LineVO lvo) throws Exception {
		return sqlSession.update(NAMESPACE +".updateLine", lvo);
	}

	@Override
    public int deleteLines(String[] codes) {
        return sqlSession.delete(NAMESPACE + ".deleteLines", codes);
    }

	@Override
	public List<LineVO> getLineListPage(Criteria cri) throws Exception {
		return null;
	}

	@Override
	public int getLineCount() throws Exception {
		return 0;
	}

	@Override
	public void insertLine(LineVO lvo) throws Exception {
		sqlSession.insert(NAMESPACE+".insertLine", lvo);
	}


    @Override
    public List<LineVO> getInfo(String[] codes) throws Exception {
        return sqlSession.selectList(NAMESPACE + ".getInfo", codes);
    }

}
