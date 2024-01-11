package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.ClientVO;
import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.LineVO;

public interface LineService {
	
	public List<LineVO> lineListAll() throws Exception;
	
	public LineVO getLine(String code) throws Exception;
	
	public int lineUpdate(LineVO lvo) throws Exception;
	
	public int deleteLines(String[] codes) throws Exception;
	
	public List<LineVO> lineListPage(Criteria cri) throws Exception;
	
	public int totalLineCount() throws Exception;
	
	public List<LineVO> getInfo(String[] codes) throws Exception;
	
	public int InsertLine(LineVO lvo) throws Exception;

	// 라인 상세
	public LineVO infoLine(String code) throws Exception;
}
