package com.itwillbs.persistence;

import java.util.List;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.MAPDVO;

public interface ProductDAO {

	public List<MAPDVO> getProductListAll() throws Exception;
	
	public MAPDVO getProduct(String code) throws Exception;
	
	public int updateProduct(MAPDVO mvo) throws Exception;
	
	public int deleteProducts(String[] codes) throws Exception;
	
	public void insertProduct(MAPDVO mvo) throws Exception;
			
	public List<MAPDVO> getInfo(String[] codes) throws Exception;
	
	// 품목 검색 팝업 
	public List<MAPDVO> SearchMAPD(Criteria cri, String mapdCode, String mapdName) throws Exception;
	
	// 모든 품목 수
	public int getMAPDCount(String mapdCode, String mapdName) throws Exception;
	
}