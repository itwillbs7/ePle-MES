
  package com.itwillbs.persistence;
  
  import java.util.List;

  import com.itwillbs.domain.Criteria;
  import com.itwillbs.domain.StockVO;
import com.itwillbs.domain.WarehouseVO;
  
  public interface StockDAO { 
	  
	  
		 // 창고 리스트 (페이징)
		 public List<WarehouseVO> warehouseList(WarehouseVO vo) throws Exception;
		 // 전체 창고 데이터 수
		 public int warehouseListCount(WarehouseVO vo) throws Exception;
		 // 창고 등록
		 public int warehouseAdd(WarehouseVO vo) throws Exception;
		 // 창고 상세
		 public WarehouseVO warehouseInfo(String code) throws Exception;
		 // 창고 수정
		 public int warehouseEdit(WarehouseVO vo)throws Exception;
		 // 창고 삭제 
		 public List<WarehouseVO> delInfo(String[] code_arr)throws Exception;
		 public void warehouseDel(String[] code_arr) throws Exception;
		 
		 
		 
		 
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