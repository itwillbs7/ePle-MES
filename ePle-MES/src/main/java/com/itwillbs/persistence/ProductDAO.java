package com.itwillbs.persistence;

import java.util.List;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.MAPDVO;
import com.itwillbs.domain.PageVO;


public interface ProductDAO {

//	public List<MAPDVO> getProductListAll() throws Exception;
	
	public MAPDVO getProduct(String code) throws Exception;
	
	public int updateProduct(MAPDVO mvo) throws Exception;
	
	public int deleteProducts(String[] codes) throws Exception;
	
	public int insertProduct(MAPDVO mvo) throws Exception;
			
	public List<MAPDVO> getInfo(String[] codes) throws Exception;

	// 품목 상세
	public MAPDVO infoProduct(String code) throws Exception;
	
	public List<MAPDVO> getProductListPage(int page) throws Exception;
	public List<MAPDVO> getProductListPage(PageVO vo) throws Exception;
	
	public int getProductCount() throws Exception;
	
}