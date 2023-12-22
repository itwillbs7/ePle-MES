package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.MAPDVO;

public interface ProductService {

	public void ProductWrite(MAPDVO vo) throws Exception;
	
	public List<MAPDVO> ProductListAll() throws Exception;
	
	public MAPDVO getProduct(int bno) throws Exception;
	
	public int ProductModify(MAPDVO vo) throws Exception;
	
	public void incrementViewCnt(int bno) throws Exception;
	
	public void ProductRemove(int bno) throws Exception;
	
}
