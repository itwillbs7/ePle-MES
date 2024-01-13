package com.itwillbs.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.MAPDVO;

@Repository
public class RequirementDAOImpl implements RequirementDAO {

	private static final Logger logger = LoggerFactory.getLogger(RequirementDAOImpl.class);
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE ="com.itwillbs.mapper.RequirementMapper";

	@Override
	public List<MAPDVO> getRequirementListAll() throws Exception {
		return sqlSession.selectList(NAMESPACE + ".selectRequirementList");
	}

	@Override
	public MAPDVO getRequirement(String code) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getRequirement",code);
	}

	@Override
	public int updateRequirement(MAPDVO mvo) throws Exception {
		return sqlSession.update(NAMESPACE +".updateRequirement", mvo);
	}

	@Override
    public int deleteRequirements(String[] codes) {
        return sqlSession.delete(NAMESPACE + ".deleteRequirements", codes);
    }

	@Override
	public List<MAPDVO> getRequirementListPage(Criteria cri) throws Exception {
		return null;
	}

	@Override
	public int getRequirementCount() throws Exception {
		return 0;
	}

	@Override
	public int insertRequirement(MAPDVO mvo) throws Exception {
		return sqlSession.insert(NAMESPACE+".insertRequirement", mvo);
	}


    @Override
    public List<MAPDVO> getInfo(String[] codes) throws Exception {
        return sqlSession.selectList(NAMESPACE + ".getInfo", codes);
    }

	@Override
	public MAPDVO infoRequirement(String code) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".infoRequirement", code);
	}
    
    

}
