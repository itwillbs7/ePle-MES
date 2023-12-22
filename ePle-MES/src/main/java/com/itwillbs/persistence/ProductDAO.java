package com.itwillbs.persistence;

import java.util.List;

import com.itwillbs.domain.MAPDVO;

public interface ProductDAO {
	
	public void insertProduct(MAPDVO vo) throws Exception;

	public List<MAPDVO> getProductListAll() throws Exception;
	
	public MAPDVO getProduct(int bno) throws Exception;
	
	public int updateProduct(MAPDVO vo) throws Exception;
	
	public void updateViewCnt(int bno) throws Exception;
	
	public void deleteProduct(int bno) throws Exception;
}
