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
	public int deleteFacility(String[] codeList) throws Exception {
		return dao.deleteFacility(codeList);
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
	public List<FacilityVO> getLineList() throws Exception {
		return dao.getLineList();
	}
	
	@Override
	public List<FacilityVO> getFacilityListEmployee(String client_code) throws Exception{
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<FacilityVO> getFacilityListManager(String line_code) throws Exception{
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<FacilityVO> getFacilityListAdmin(String category) throws Exception{
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<FacilityVO> getCommonCodeList(String group_id) throws Exception {
		return null;
	}
}
