package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.MAPDVO;

public interface ProductService {
	
	public List<MAPDVO> productListAll() throws Exception;
	
	public MAPDVO getProduct(String code) throws Exception;
	
	public int productUpdate(MAPDVO mvo) throws Exception;
	
	public int deleteProducts(String[] codes) throws Exception;
	
	public List<MAPDVO> getInfo(String[] codes) throws Exception;
	
	public int InsertProduct(MAPDVO mvo) throws Exception;
	
	// 품목 검색 팝업 
	public List<MAPDVO> SearchProduct(Criteria cri, String mapdCode, String mapdName) throws Exception;
	 
	// 모든 품목 수
	public int productListCount(String mapdCode, String mapdName) throws Exception;
	
	
}
