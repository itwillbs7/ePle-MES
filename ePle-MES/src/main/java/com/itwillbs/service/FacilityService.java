package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.FacilityVO;
import com.itwillbs.domain.PageVO;

public interface FacilityService {
	public int addFacility(FacilityVO vo) throws Exception;
	public int facilityListCount(PageVO vo) throws Exception;
	public List<FacilityVO> getFacilityList(PageVO vo) throws Exception;
}
