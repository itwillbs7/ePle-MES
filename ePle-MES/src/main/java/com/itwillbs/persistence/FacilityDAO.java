package com.itwillbs.persistence;

import java.util.List;

import com.itwillbs.domain.FacilitySearchVO;
import com.itwillbs.domain.FacilityVO;
import com.itwillbs.domain.PageVO;

public interface FacilityDAO {
	public int insertFacility(FacilityVO vo) throws Exception;
	public int getFacilityCount(PageVO vo) throws Exception;
	public List<FacilityVO> getFacilityList(PageVO vo) throws Exception;
}
