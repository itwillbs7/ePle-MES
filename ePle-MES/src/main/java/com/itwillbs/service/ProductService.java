package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.MAPDVO;
import com.itwillbs.domain.PageVO;

public interface ProductService {

	public MAPDVO getProduct(String code) throws Exception;
	
	public int productUpdate(MAPDVO mvo) throws Exception;
	
	public int deleteProducts(String[] codes) throws Exception;
	
	public List<MAPDVO> getInfo(String[] codes) throws Exception;
	
	public int InsertProduct(MAPDVO mvo) throws Exception;

	// 품목 상세
	public MAPDVO infoProduct(String code) throws Exception;
	
	public List<MAPDVO> productListPage(PageVO vo) throws Exception;
	
	public int totalProductCount(PageVO vo) throws Exception;
	
	public List<MAPDVO> getCommonList(String group_id) throws Exception;
	
	public String getRecentCode() throws Exception;
}
