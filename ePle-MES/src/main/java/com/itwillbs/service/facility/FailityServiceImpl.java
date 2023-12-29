package com.itwillbs.service.facility;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.FacilityVO;
import com.itwillbs.domain.LineVO;
import com.itwillbs.domain.PageVO;
import com.itwillbs.domain.SearchVO;
import com.itwillbs.persistence.facility.FacilityDAO;

@Service
public class FailityServiceImpl implements FacilityService {
	
	@Inject
	private FacilityDAO dao;
	
	@Override
	public int addFacility(FacilityVO vo) throws Exception {
		return dao.insertFacility(vo);
	}
	
	@Override
	public int updateFacility(FacilityVO vo) throws Exception {
		return dao.updateFacility(vo);
	}
	
	@Override
	public int deleteFacility(String[] code) throws Exception {
		return dao.deleteFacility(code);
	}
	
	@Override
	public int facilityListCount(PageVO vo) throws Exception {
		return dao.getFacilityCount(vo);
	}
	
	@Override
	public List<FacilityVO> getFacilityList(PageVO vo) throws Exception {
		return dao.getFacilityList(vo);
	}
	
	@Override
	public List<FacilityVO> getAjaxResult(PageVO vo) throws Exception {
		return dao.getExportList(vo);
	}
	
	@Override
	public FacilityVO getFacility(FacilityVO vo) throws Exception {
		return dao.getFacility(vo);
	}
	
	@Override
	public String getRecentFacility() throws Exception {
		return dao.getRecentFacility();
	}
	
	@Override
	public List<LineVO> getLineList() throws Exception {
		return dao.getLineList();
	}
}
