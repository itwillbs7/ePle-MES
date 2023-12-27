package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.FacilityVO;
import com.itwillbs.domain.PageVO;
import com.itwillbs.domain.SearchVO;

public interface FacilityService {
	public int addFacility(FacilityVO vo) throws Exception;
	public int updateFacility(FacilityVO vo) throws Exception;
	public int deleteFacility(String[] code) throws Exception;
	public int facilityListCount(PageVO vo) throws Exception;
	public List<FacilityVO> getFacilityList(PageVO vo) throws Exception;
	public List<FacilityVO> getAjaxResult(SearchVO vo) throws Exception;
}