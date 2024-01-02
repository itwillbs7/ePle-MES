package com.itwillbs.service.facility;

import java.util.List;

import com.itwillbs.domain.FacilityVO;
import com.itwillbs.domain.LineVO;
import com.itwillbs.domain.PageVO;

public interface FacilityService {
	public int addFacility(FacilityVO vo) throws Exception;
	
	public int updateFacility(FacilityVO vo) throws Exception;
	
	public int deleteFacility(String[] codeList) throws Exception;
	
	public int facilityListCount(PageVO vo) throws Exception;
	
	public List<FacilityVO> getFacilityList(PageVO vo) throws Exception;
	
	public List<FacilityVO> getAjaxResult(PageVO vo) throws Exception;
	
	public FacilityVO getFacility(FacilityVO vo) throws Exception;
	
	public String getRecentFacility() throws Exception;
	
	public List<FacilityVO> getLineList() throws Exception;
	
	public List<FacilityVO> getCommonCodeList(String group_id) throws Exception;
	
	public List<FacilityVO> getFacilityListEmployee(String client_code) throws Exception;
	
	public List<FacilityVO> getFacilityListManager(String line_code) throws Exception;

	public List<FacilityVO> getFacilityListAdmin(String category) throws Exception;
}