package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.MaintenanceVO;
import com.itwillbs.domain.PageVO;
import com.itwillbs.persistence.MaintenanceDAO;

@Service
public class MaintenanceServiceImpl implements MaintenanceService {

	@Inject
	private MaintenanceDAO dao;

	@Override
	public int addMaintenance(MaintenanceVO vo) throws Exception {
		return dao.insertMaintenance(vo);
	}
	
	@Override
	public int getMaintenanceCount(PageVO vo) throws Exception {
		return dao.getMaintenanceCount(vo);
	}
	
	@Override
	public List<MaintenanceVO> getMaintenanceList(PageVO vo) throws Exception {
		return dao.getMaintenanceList(vo);
	}
}
