package com.itwillbs.persistence;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.LineVO;
import com.itwillbs.domain.MAPDVO;
import com.itwillbs.domain.PageVO;

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
	public int insertLine(LineVO lvo) throws Exception {
		return sqlSession.insert(NAMESPACE+".insertLine", lvo);
	}


    @Override
    public List<LineVO> getInfo(String[] codes) throws Exception {
        return sqlSession.selectList(NAMESPACE + ".getInfo", codes);
    }

	@Override
	public LineVO infoLine(String code) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".infoLine", code);
	}
    
	@Override
	public List<LineVO> getLineListPage(int page) throws Exception {

		page = (page - 1) * 10;
		
		return sqlSession.selectList(NAMESPACE + ".listPage",page);
	}

	@Override
	public List<LineVO> getLineListPage(PageVO vo) throws Exception {
		List<LineVO> list = new ArrayList<LineVO>();
				list = sqlSession.selectList(NAMESPACE + ".listPage", vo);
				return list;
	}

	@Override
	public int getLineCount() throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".countLine");
	}

}
