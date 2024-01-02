package com.itwillbs.persistence.facility;

import java.util.List;

import com.itwillbs.domain.MaintenanceVO;
import com.itwillbs.domain.PageVO;

public interface MaintenanceDAO {
	public String getRecentCode(String code) throws Exception;
	public int insert(MaintenanceVO vo) throws Exception;
	public int updateMT(MaintenanceVO vo) throws Exception;
	public int updateResult(MaintenanceVO vo) throws Exception;
	public int delete(String[] codeList) throws Exception;
	
	public List<MaintenanceVO> getList(PageVO vo) throws Exception;
	public int getListCount(PageVO vo) throws Exception;
	public MaintenanceVO getDetail(String code) throws Exception;
	
	public List<MaintenanceVO> getFacilityInfo(String code) throws Exception;
	public int getFacilityInfoCount(String code) throws Exception;
	
	public List<MaintenanceVO> getDailyRM(String emp_code) throws Exception;
	public int getDailyRMCount(String emp_code) throws Exception;
	
	public List<MaintenanceVO> getAjax(PageVO vo) throws Exception;
}