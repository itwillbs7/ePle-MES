package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.ClientVO;
import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.MAPDVO;

public interface RequirementService {
	
	public List<MAPDVO> requirementListAll() throws Exception;
	
	public MAPDVO getRequirement(String code) throws Exception;
	
	public int requirementUpdate(MAPDVO mvo) throws Exception;
	
	public int deleteRequirements(String[] codes) throws Exception;
	
	public List<MAPDVO> requirementListPage(Criteria cri) throws Exception;
	
	public int totalRequirementCount() throws Exception;
	
	public List<MAPDVO> getInfo(String[] codes) throws Exception;
	
	public int InsertRequirement(MAPDVO mvo) throws Exception;
	
	// 소요량 상세
	public MAPDVO infoRequirement(String code) throws Exception;

}
