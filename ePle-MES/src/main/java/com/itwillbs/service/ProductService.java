package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.MAPDVO;

public interface ProductService {
	
	public List<MAPDVO> productListAll() throws Exception;
	
	public MAPDVO getProduct(String code) throws Exception;
	
	public int productUpdate(MAPDVO mvo) throws Exception;
	
	public int deleteProducts(String[] codes) throws Exception;
	
	public List<MAPDVO> productListPage(Criteria cri) throws Exception;
	
	public int totalProductCount() throws Exception;
	
	public List<MAPDVO> getInfo(String[] codes) throws Exception;
	
	public void InsertProduct(MAPDVO mvo) throws Exception;


}
