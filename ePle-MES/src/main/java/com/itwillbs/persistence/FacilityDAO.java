package com.itwillbs.persistence;

import com.itwillbs.domain.FacilityVO;

public interface FacilityDAO {
	public void insertFacility(FacilityVO vo) throws Exception;
	public int getFacilityCount() throws Exception;
}
