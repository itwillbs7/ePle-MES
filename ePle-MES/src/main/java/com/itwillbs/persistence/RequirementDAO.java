package com.itwillbs.persistence;

import java.util.List;

import com.production.domain.BOMVO;
import com.itwillbs.domain.ClientVO;
import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.MAPDVO;

public interface RequirementDAO {

	public List<MAPDVO> getRequirementListAll() throws Exception;
	
	public BOMVO getRequirement(String code) throws Exception;
	
	public int updateRequirement(MAPDVO mvo) throws Exception;
	
	public int deleteRequirements(String[] codes) throws Exception;
	
	public List<BOMVO> getRequirementListPage(Criteria cri) throws Exception;
	
	public int getRequirementCount() throws Exception;
	
	public int insertRequirement(BOMVO mvo) throws Exception;
			
	public List<BOMVO> getInfo(String[] codes) throws Exception;

	public List<MAPDVO> getMAPDListGET() throws Exception;

	public List<MAPDVO> getMAPDListGET(String mapdName)throws Exception;

	public List<MAPDVO> getMaterailListGET() throws Exception;

	public List<MAPDVO> getMaterailListGET(String materialName) throws Exception;
	
}