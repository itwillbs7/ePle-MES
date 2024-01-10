package com.itwillbs.persistence.facility;

import java.util.List;
import java.util.Map;

import com.itwillbs.domain.LineOffVO;
import com.itwillbs.domain.LineVO;

public interface OffDAO {
	public List<LineVO> getLineList() throws Exception;

	public LineVO getDetail(String code) throws Exception;
	
	public List<LineOffVO> getDetailList(String code) throws Exception;

	public List<String> getRenewList(String column) throws Exception;

	public String getRecentCode() throws Exception;

	public int insert(List<LineOffVO> vo) throws Exception;

	public int updateEndTime(String[] code) throws Exception;

	public int reservation(List<LineOffVO> vo) throws Exception;
	
	public int setLineOn(String[] code) throws Exception;
	
	public int setLineOff(String[] code) throws Exception;

	public List<LineOffVO> getCommonCode(String group_id) throws Exception;
}