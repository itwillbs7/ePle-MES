package com.itwillbs.service.facility;

import java.util.List;

import com.itwillbs.domain.FacilityVO;
import com.itwillbs.domain.FacMtVO;
import com.itwillbs.domain.PageVO;

public interface MaintenanceService {
	public String getRecentCode(String code) throws Exception;
	public int insert(FacMtVO vo) throws Exception;
	public int updateMT(FacMtVO vo) throws Exception;
	public int updateResult(FacMtVO vo) throws Exception;
	public int delete(String[] codeList) throws Exception;
	
	public List<FacMtVO> getList(PageVO vo) throws Exception;
	public int getListCount(PageVO vo) throws Exception;
	public FacMtVO getDetail(String code) throws Exception;
	
	public List<FacMtVO> getFacilityInfo(String code) throws Exception;
	public int getFacilityInfoCount(String code) throws Exception;
	
	public List<FacMtVO> getDailyRM(String emp_code) throws Exception;
	public int getDailyRMCount(String emp_code) throws Exception;
	
	public List<FacMtVO> getAjax(PageVO vo) throws Exception;
}