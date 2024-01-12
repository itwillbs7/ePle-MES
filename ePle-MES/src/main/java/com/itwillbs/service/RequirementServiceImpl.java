package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.production.domain.BOMVO;
import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.MAPDVO;
import com.itwillbs.persistence.RequirementDAO;

@Service
public class RequirementServiceImpl implements RequirementService {
	
	private static final Logger logger = LoggerFactory.getLogger(RequirementServiceImpl.class);
	
	@Inject
	private RequirementDAO rdao;

	@Override
	public List<MAPDVO> requirementListAll() throws Exception {
		logger.debug(" S : requirementListAll() ");
		return rdao.getRequirementListAll();
	}

	@Override
	public BOMVO getRequirement(String code) throws Exception {
		logger.debug(" S : getRequirement(String code) ");
		return rdao.getRequirement(code);
	}

	@Override
	public int requirementUpdate(MAPDVO mvo) throws Exception {
		logger.debug(" S : requirementUpdate(MAPDVO mvo) ");
		return rdao.updateRequirement(mvo);
	}

    @Override
    public int deleteRequirements(String[] codes) throws Exception {
        return rdao.deleteRequirements(codes);
    }

	@Override
	public List<BOMVO> requirementListPage(Criteria cri) throws Exception {
		logger.debug(" S : requirementListPage(Criteria cri) ");
		return rdao.getRequirementListPage(cri);
	}
	
	

	@Override
	public List<MAPDVO> getMAPDListGET() throws Exception {
		
		return rdao.getMAPDListGET();
	}
	

	@Override
	public List<MAPDVO> getMAPDListGET(String mapdName) throws Exception {
		// TODO Auto-generated method stub
		return rdao.getMAPDListGET(mapdName);
	}
	
	@Override
	public List<MAPDVO> getMaterailListGET() throws Exception {
		// TODO Auto-generated method stub
		return rdao.getMaterailListGET();
	}

	@Override
	public List<MAPDVO> getMaterailListGET(String materialName) throws Exception {
		// TODO Auto-generated method stub
		return rdao.getMaterailListGET(materialName);
	}

	@Override
	public int totalRequirementCount() throws Exception {
		logger.debug(" S : totalRequirementCount() ");
		return rdao.getRequirementCount();
	}
	
    @Override
    public List<BOMVO> getInfo(String[] codes) throws Exception {
        return rdao.getInfo(codes);
    }

	@Override
	public int InsertRequirement(BOMVO mvo) throws Exception {
		return rdao.insertRequirement(mvo);
	}
	
}
