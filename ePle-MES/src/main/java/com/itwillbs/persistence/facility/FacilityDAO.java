package com.itwillbs.persistence.facility;

import java.util.List;

import com.itwillbs.domain.FacilityVO;
import com.itwillbs.domain.PageVO;

public interface FacilityDAO {
	public int insertFacility(FacilityVO vo) throws Exception;
	public int updateFacility(FacilityVO vo) throws Exception;
	public int deleteFacility(String[] codeList) throws Exception;
	public int getFacilityCount(PageVO vo) throws Exception;
	public List<FacilityVO> getFacilityList(PageVO vo) throws Exception;
	public List<FacilityVO> getExportList(PageVO vo) throws Exception; 
	public FacilityVO getFacility(FacilityVO vo) throws Exception;
	public String getRecentFacility() throws Exception;
	public List<FacilityVO> getLineList() throws Exception;
	public List<FacilityVO> getCommonCodeList(String group_id) throws Exception;
	public List<FacilityVO> getFacManager(String emp_code) throws Exception;
}