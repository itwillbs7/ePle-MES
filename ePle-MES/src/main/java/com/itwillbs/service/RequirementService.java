package com.itwillbs.service;

import java.util.List;

import com.production.domain.BOMVO;
import com.itwillbs.domain.ClientVO;
import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.MAPDVO;

public interface RequirementService {
	
	public List<MAPDVO> requirementListAll() throws Exception;
	
	public BOMVO getRequirement(String code) throws Exception;
	
	public int requirementUpdate(MAPDVO mvo) throws Exception;
	
	public int deleteRequirements(String[] codes) throws Exception;
	
	public List<BOMVO> requirementListPage(Criteria cri) throws Exception;
	
	public int totalRequirementCount() throws Exception;
	
	public List<MAPDVO> getInfo(String[] codes) throws Exception;
	
	public int InsertRequirement(BOMVO mvo) throws Exception;

	public List<MAPDVO> getMAPDListGET()throws Exception;

	public List<MAPDVO> getMAPDListGET(String mapdName)throws Exception;

	public List<MAPDVO> getMaterailListGET()throws Exception;

	public List<MAPDVO> getMaterailListGET(String materialName)throws Exception;


}
