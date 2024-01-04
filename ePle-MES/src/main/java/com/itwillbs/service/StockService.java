
  package com.itwillbs.service;
  
  import java.util.List;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.OrderVO;
import com.itwillbs.domain.StockVO;
import com.itwillbs.domain.WarehouseVO;
  
  public interface StockService { 
	  
		 // 재고 목록 ~ 재고 검색 
		 public List<StockVO> stockList(Criteria cri, String searchWarehouse, String searchMapd) throws Exception;
		 
		 // 모든 재고 데이터 수
		 public int stockListCount(String searchWarehouse, String searchMapd) throws Exception;

		 // 품목 검색 팝업 
		 public List<StockVO> SearchMAPD(Criteria cri, String mapdCode, String mapdName) throws Exception;
		 
		 // 모든 품목 수
		 public int mapdListCount(String mapdCode, String mapdName) throws Exception;
		 
		 // 창고 검색 팝업 
		 public List<StockVO> searchWarehouse(Criteria cri, String whCode, String WhName) throws Exception;
		 
		 // 모든 창고 수
		 public int warehouseListCount(String whCode, String WhName) throws Exception;		 
	  
  
  
  }
 