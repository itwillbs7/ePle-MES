package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

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
	public MAPDVO getRequirement(String code) throws Exception {
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
	public List<MAPDVO> requirementListPage(Criteria cri) throws Exception {
		logger.debug(" S : requirementListPage(Criteria cri) ");
		return rdao.getRequirementListPage(cri);
	}

	@Override
	public int totalRequirementCount() throws Exception {
		logger.debug(" S : totalRequirementCount() ");
		return rdao.getRequirementCount();
	}
	
    @Override
    public List<MAPDVO> getInfo(String[] codes) throws Exception {
        return rdao.getInfo(codes);
    }

	@Override
	public void InsertRequirement(MAPDVO mvo) throws Exception {
		rdao.insertRequirement(mvo);
	}
	
}
