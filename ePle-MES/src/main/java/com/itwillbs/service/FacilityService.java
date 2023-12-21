package com.itwillbs.service;

import com.itwillbs.domain.FacilityVO;

public interface FacilityService {
	public void addFacility(FacilityVO vo) throws Exception;
	public int facilityListCount() throws Exception;
}
