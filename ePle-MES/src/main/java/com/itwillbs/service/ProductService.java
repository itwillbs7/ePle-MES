package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.MAPDVO;

public interface ProductService {
	
	public void boardWrite(MAPDVO mvo) throws Exception;
	
	public List<MAPDVO> boardListAll() throws Exception;
	
	public MAPDVO getBoard(int bno) throws Exception;
	
	public int boardModify(MAPDVO mvo) throws Exception;
	
	public void incrementViewCnt(int bno) throws Exception;
	
	public void boardRemove(int bno) throws Exception;
	
	public List<MAPDVO> boardListPage(Criteria cri) throws Exception;
	
	public int totalBoardCount() throws Exception;

}
