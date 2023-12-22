package com.itwillbs.persistence;

import java.util.List;

import com.itwillbs.domain.MaintenanceVO;
import com.itwillbs.domain.PageVO;

public interface MaintenanceDAO {
	public int insertMaintenance(MaintenanceVO vo) throws Exception;
	public int updateMaintenance(MaintenanceVO vo) throws Exception;
	public int deleteMaintenance(MaintenanceVO vo) throws Exception;
	public int getMaintenanceCount(PageVO vo) throws Exception;
	public List<MaintenanceVO> getMaintenanceList(PageVO vo) throws Exception;
}
