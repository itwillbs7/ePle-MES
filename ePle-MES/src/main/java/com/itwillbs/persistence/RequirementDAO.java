package com.itwillbs.persistence;

import java.util.List;

import com.itwillbs.domain.ClientVO;
import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.MAPDVO;

public interface RequirementDAO {

	public List<MAPDVO> getRequirementListAll() throws Exception;
	
	public MAPDVO getRequirement(String code) throws Exception;
	
	public int updateRequirement(MAPDVO mvo) throws Exception;
	
	public int deleteRequirements(String[] codes) throws Exception;
	
	public List<MAPDVO> getRequirementListPage(Criteria cri) throws Exception;
	
	public int getRequirementCount() throws Exception;
	
	public int insertRequirement(MAPDVO mvo) throws Exception;
			
	public List<MAPDVO> getInfo(String[] codes) throws Exception;
	
	// 소요량 상세
	public MAPDVO infoRequirement(String code) throws Exception;
}