package com.itwillbs.persistence.facility;

import java.util.List;

import com.itwillbs.domain.FacilityVO;
import com.itwillbs.domain.PageVO;
import com.itwillbs.domain.SearchVO;

public interface FacilityDAO {
	public int insertFacility(FacilityVO vo) throws Exception;
	public int updateFacility(FacilityVO vo) throws Exception;
	public int deleteFacility(String[] code) throws Exception;
	public int getFacilityCount(PageVO vo) throws Exception;
	public List<FacilityVO> getFacilityList(PageVO vo) throws Exception;
	public List<FacilityVO> getExportList(SearchVO vo) throws Exception; 
	public FacilityVO getFacility(FacilityVO vo) throws Exception;
}
