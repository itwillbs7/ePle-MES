package com.itwillbs.persistence;

import java.util.List;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.LineVO;

public interface LineDAO {

	public List<LineVO> getLineListAll() throws Exception;
	
	public LineVO getLine(String code) throws Exception;
	
	public int updateLine(LineVO lvo) throws Exception;
	
	public int deleteLines(String[] codes) throws Exception;
	
	public List<LineVO> getLineListPage(Criteria cri) throws Exception;
	
	public int getLineCount() throws Exception;
	
	public int insertLine(LineVO lvo) throws Exception;
			
	public List<LineVO> getInfo(String[] codes) throws Exception;
	
	// 라인 상세
	public LineVO infoLine(String code) throws Exception;
}