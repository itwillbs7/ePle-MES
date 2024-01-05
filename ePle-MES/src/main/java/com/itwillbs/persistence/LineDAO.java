package com.itwillbs.persistence;

import java.util.List;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.LineVO;
import com.itwillbs.domain.MAPDVO;

public interface LineDAO {

	public List<LineVO> getLineListAll() throws Exception;
	
	public MAPDVO getLine(String code) throws Exception;
	
	public int updateLine(MAPDVO mvo) throws Exception;
	
	public void deleteLine(String code) throws Exception;
	
	public List<LineVO> getLineListPage(Criteria cri) throws Exception;
	
	public int getLineCount() throws Exception;
	
}