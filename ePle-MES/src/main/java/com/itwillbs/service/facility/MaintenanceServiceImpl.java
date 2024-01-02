package com.itwillbs.service.facility;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.FacilityVO;
import com.itwillbs.domain.MaintenanceVO;
import com.itwillbs.domain.PageVO;
import com.itwillbs.persistence.facility.MaintenanceDAO;

@Service
public class MaintenanceServiceImpl implements MaintenanceService {

	@Inject
	private MaintenanceDAO dao;

	@Override
	public String getRecentCode(String code) throws Exception {
		return dao.getRecentCode(code);
	}
	
	@Override
	public int insert(MaintenanceVO vo) throws Exception {
		return dao.insert(vo);
	}
	
	@Override
	public int updateMT(MaintenanceVO vo) throws Exception {
		return dao.updateMT(vo);
	}
	
	@Override
	public int updateResult(MaintenanceVO vo) throws Exception {
		return dao.updateResult(vo);
	}
	
	@Override
	public int delete(String[] codeList) throws Exception {
		return dao.delete(codeList);
	}
	
	@Override
	public List<MaintenanceVO> getList(PageVO vo) throws Exception {
		return dao.getList(vo);
	}
	
	@Override
	public int getListCount(PageVO vo) throws Exception {
		return dao.getListCount(vo);
	}
	
	@Override
	public MaintenanceVO getDetail(String code) throws Exception {
		return dao.getDetail(code);
	}
	
	@Override
	public List<MaintenanceVO> getFacilityInfo(String code) throws Exception {
		return dao.getFacilityInfo(code);
	}
	
	@Override
	public int getFacilityInfoCount(String code) throws Exception {
		return dao.getFacilityInfoCount(code);
	}
	
	@Override
	public List<MaintenanceVO> getDailyRM(String emp_code) throws Exception {
		return dao.getDailyRM(emp_code);
	}
	
	@Override
	public int getDailyRMCount(String emp_code) throws Exception {
		return dao.getDailyRMCount(emp_code);
	}
	
	@Override
	public List<MaintenanceVO> getAjax(PageVO vo) throws Exception {
		return dao.getAjax(vo);
	}
}
