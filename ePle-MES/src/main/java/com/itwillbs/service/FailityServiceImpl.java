package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.FacilitySearchVO;
import com.itwillbs.domain.FacilityVO;
import com.itwillbs.domain.PageVO;
import com.itwillbs.persistence.FacilityDAO;

@Service
public class FailityServiceImpl implements FacilityService {
	
	@Inject
	private FacilityDAO dao;
	
	@Override
	public int addFacility(FacilityVO vo) throws Exception {
		return dao.insertFacility(vo);
	}
	
	@Override
	public int facilityListCount(PageVO vo) throws Exception {
		return dao.getFacilityCount(vo);
	}
	
	@Override
	public List<FacilityVO> getFacilityList(PageVO vo) throws Exception {
		return dao.getFacilityList(vo);
	}
}
