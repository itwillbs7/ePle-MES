package com.itwillbs.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.MaintenanceVO;
import com.itwillbs.persistence.MaintenanceDAO;

@Service
public class MaintenanceServiceImpl implements MaintenanceService{
	
	@Inject
	private MaintenanceDAO dao;
	
	@Override
	public void addMaintenance(MaintenanceVO vo) {
		
	}
}
