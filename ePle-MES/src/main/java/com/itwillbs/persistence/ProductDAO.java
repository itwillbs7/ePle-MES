package com.itwillbs.persistence;

import java.util.List;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.MAPDVO;

public interface ProductDAO {
	
	public void insertProduct(MAPDVO mvo) throws Exception;

	public List<MAPDVO> getBoardListAll() throws Exception;
	
	public MAPDVO getProduct(int bno) throws Exception;
	
	public int updateProduct(MAPDVO mvo) throws Exception;
	
	public void updateViewCnt(int bno) throws Exception;
	
	public void deleteProduct(int bno) throws Exception;
	
	public List<MAPDVO> getBoardListPage(int page) throws Exception;
	public List<MAPDVO> getBoardListPage(Criteria cri) throws Exception;
	
	public int getBoardCount() throws Exception;
	
}
