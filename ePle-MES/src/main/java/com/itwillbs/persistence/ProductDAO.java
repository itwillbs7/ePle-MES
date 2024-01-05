package com.itwillbs.persistence;

import java.util.List;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.MAPDVO;

public interface ProductDAO {

	public List<MAPDVO> getProductListAll() throws Exception;
	
	public MAPDVO getProduct(String code) throws Exception;
	
	public int updateProduct(MAPDVO mvo) throws Exception;
	
	public void deleteProduct(String code) throws Exception;
	
	public List<MAPDVO> getProductListPage(Criteria cri) throws Exception;
	
	public int getProductCount() throws Exception;
	
}