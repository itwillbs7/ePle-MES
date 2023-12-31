package com.itwillbs.persistence.facility;

import java.util.List;

import com.itwillbs.domain.FacilityVO;
import com.itwillbs.domain.MaintenanceVO;
import com.itwillbs.domain.PageVO;

public interface MaintenanceDAO {
	public int insertMaintenance(MaintenanceVO vo) throws Exception;
	public int insertRM(MaintenanceVO vo) throws Exception;
	public int updateMaintenance(MaintenanceVO vo) throws Exception;
	public int deleteMaintenance(MaintenanceVO vo) throws Exception;
	public int getMaintenanceCount(PageVO vo) throws Exception;
	public List<MaintenanceVO> getMaintenanceList(PageVO vo) throws Exception;
	public List<MaintenanceVO> getFacilityInfo(FacilityVO vo) throws Exception;
	public MaintenanceVO getDetail(MaintenanceVO vo) throws Exception;
	public List<MaintenanceVO> getRMList(String emp) throws Exception;
}