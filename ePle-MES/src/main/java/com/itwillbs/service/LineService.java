package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.LineVO;

public interface LineService {
	
	public void lineWrite(LineVO lvo) throws Exception;
	
	public List<LineVO> lineListAll() throws Exception;
	
	public LineVO getLine(String code) throws Exception;
	
	public int lineModify(LineVO lvo) throws Exception;
	
	public void lineRemove(String code) throws Exception;
	
	public List<LineVO> lineListPage(Criteria cri) throws Exception;
	
	public int totalLineCount() throws Exception;

}
