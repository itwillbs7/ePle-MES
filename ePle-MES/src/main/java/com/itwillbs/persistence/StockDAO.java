
  package com.itwillbs.persistence;
  
  import java.util.List;

  import com.itwillbs.domain.Criteria;
  import com.itwillbs.domain.StockVO;
  
  public interface StockDAO { 
	  
		// 재고 목록 ~ 재고 검색 
		public List<StockVO> getStockList(Criteria cri, String searchWarehouse, String searchMapd) throws Exception;
		
		// 모든 재고 데이터 수
		public int getStockCount(String searchWarehouse, String searchMapd) throws Exception;
		
		// 품목 검색 팝업 
		public List<StockVO> SearchMAPD(Criteria cri, String mapdCode, String mapdName) throws Exception;
		
		// 모든 품목 수
		public int getMAPDCount(String mapdCode, String mapdName) throws Exception;
	
		// 창고 검색 팝업 
		public List<StockVO> searchWarehouse(Criteria cri, String whCode, String WhName) throws Exception;
		
		// 모든 창고 수
		public int getWarehouseCount(String whCode, String WhName) throws Exception;
	
	  
	  
  } 