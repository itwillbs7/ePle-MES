package com.itwillbs.persistence.facility;

import java.util.List;

import com.itwillbs.domain.PageVO;
import com.itwillbs.domain.facility.MaintenanceVO;

public interface MaintenanceDAO {
	public int insertMaintenance(MaintenanceVO vo) throws Exception;
	public int updateMaintenance(MaintenanceVO vo) throws Exception;
	public int deleteMaintenance(MaintenanceVO vo) throws Exception;
	public int getMaintenanceCount(PageVO vo) throws Exception;
	public List<MaintenanceVO> getMaintenanceList(PageVO vo) throws Exception;
}
