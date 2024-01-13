package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.LineVO;
import com.itwillbs.domain.PageVO;

public interface LineService {
	
	public LineVO getLine(String code) throws Exception;
	
	public int lineUpdate(LineVO lvo) throws Exception;
	
	public int deleteLines(String[] codes) throws Exception;
	
	public List<LineVO> getInfo(String[] codes) throws Exception;
	
	public int InsertLine(LineVO lvo) throws Exception;

	// 라인 상세
	public LineVO infoLine(String code) throws Exception;
	
	public List<LineVO> lineListPage(PageVO vo) throws Exception;
	
	public int totalLineCount() throws Exception;
}
