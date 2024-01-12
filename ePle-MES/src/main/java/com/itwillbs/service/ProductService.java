package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.MAPDVO;
import com.itwillbs.domain.PageVO;

public interface ProductService {

	public MAPDVO getProduct(String code) throws Exception;
	
	public int productUpdate(MAPDVO mvo) throws Exception;
	
	public int deleteProducts(String[] codes) throws Exception;
	
	public List<MAPDVO> getInfo(String[] codes) throws Exception;
	
	public int InsertProduct(MAPDVO mvo) throws Exception;
<<<<<<< HEAD

=======
	
	// 품목 검색 팝업 
	public List<MAPDVO> SearchProduct(Criteria cri, String mapdCode, String mapdName) throws Exception;
	 
	// 전체 품목 데이터 수
	public int intProductCount(MAPDVO mvo) throws Exception;
	
>>>>>>> 8e4ab98f7c7f00be4b1efbef8420cc927b90a7ec
	// 품목 상세
	public MAPDVO infoProduct(String code) throws Exception;
	
	public List<MAPDVO> productListPage(PageVO vo) throws Exception;
	
	public int totalProductCount() throws Exception;
}
