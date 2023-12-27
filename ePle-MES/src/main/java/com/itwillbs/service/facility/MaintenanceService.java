package com.itwillbs.service.facility;

import java.util.List;

import com.itwillbs.domain.PageVO;
import com.itwillbs.domain.facility.MaintenanceVO;

public interface MaintenanceService {
	public int addMaintenance(MaintenanceVO vo) throws Exception;
	public int updateMaintenance(MaintenanceVO vo) throws Exception;
	public int deleteMaintenance(MaintenanceVO vo) throws Exception;
	public int getMaintenanceCount(PageVO vo) throws Exception;
	public List<MaintenanceVO> getMaintenanceList(PageVO vo) throws Exception;
}
