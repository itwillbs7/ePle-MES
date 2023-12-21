package com.itwillbs.service;

import com.itwillbs.domain.MaintenanceVO;

public interface MaintenanceService {
	public void addMaintenance(MaintenanceVO vo) throws Exception;
	public int getMaintenanceListCount() throws Exception;
}
