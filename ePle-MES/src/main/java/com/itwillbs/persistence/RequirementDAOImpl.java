package com.itwillbs.persistence;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.production.domain.BOMVO;
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
	public BOMVO getRequirement(String code) throws Exception {
		logger.debug("수정 전 들어온 코드 확인하기"+code);
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
	public List<BOMVO> getRequirementListPage(Criteria cri) throws Exception {
		List<BOMVO> list = new ArrayList<BOMVO>();
		list = sqlSession.selectList(NAMESPACE+".selectBOMList", cri);
		logger.debug("======================"+list);
	    for(BOMVO item : list) {
	        String material = item.getMaterial();  
	        
	        item.setMaterialName(sqlSession.selectOne(NAMESPACE+".getMaterialName", material));
	      
	    }
		return list;
	}

	@Override
	public int getRequirementCount() throws Exception {
		return sqlSession.selectOne(NAMESPACE+".getTotal");
	}
	
	// 팝업창 리스트 가져외기
	@Override
	public List<MAPDVO> getMAPDListGET() throws Exception {
		logger.debug("MAPD 리스트 가져오면 됨 코드 + 이름");
		return sqlSession.selectList(NAMESPACE+".getMAPDLIST");
	}
	

	@Override
	public List<MAPDVO> getMAPDListGET(String mapdName) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE+".getMAPDLIST",mapdName);
	}
	
	@Override
	public List<MAPDVO> getMaterailListGET() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE+".getMaterialLIST");
	}

	@Override
	public List<MAPDVO> getMaterailListGET(String materialName) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE+".getMaterialLIST",materialName);
	}

	@Override
	public int insertRequirement(BOMVO mvo) throws Exception {
		
		// 오늘 업로드 된 최근의 코드 불러오기
		
			String recentCode = sqlSession.selectOne(NAMESPACE+".getRecentCodeBOM");
			
			int beforeSum = Integer.parseInt(recentCode);
			beforeSum +=1;
				
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("mvo", mvo);
			paramMap.put("codeNum", beforeSum);
		
		
		return sqlSession.insert(NAMESPACE+".insertRequirement", paramMap);
	}



	@Override
    public List<BOMVO> getInfo(String[] codes) throws Exception {
		

        return sqlSession.selectList(NAMESPACE + ".getInfo", codes);
    }

}
