package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.MAPDVO;

public interface ProductService {
	
	public void productWrite(MAPDVO mvo) throws Exception;
	
	public List<MAPDVO> productListAll() throws Exception;
	
	public MAPDVO getProduct(String code) throws Exception;
	
	public int productModify(MAPDVO mvo) throws Exception;
	
	public void productRemove(String code) throws Exception;
	
	public List<MAPDVO> productListPage(Criteria cri) throws Exception;
	
	public int totalProductCount() throws Exception;

}
