
  package com.itwillbs.service;
  
  import java.util.List;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.OrderVO;
import com.itwillbs.domain.StockVO;
import com.itwillbs.domain.WarehouseVO;
  
  public interface StockService { 
	  
		 // 창고 리스트 (페이징)
		 public List<WarehouseVO> warehouseList(WarehouseVO vo) throws Exception;
		 // 전체 창고 데이터 수
		 public int warehouseListCount(WarehouseVO vo) throws Exception;
		 // 창고 등록
		 public int warehouseAdd(WarehouseVO vo) throws Exception;
		 // 최신코드 가져오기
		 public String whRecentCode() throws Exception;
		 // 창고 상세
		 public WarehouseVO warehouseInfo(String code) throws Exception;
		 // 창고 수정
		 public int warehouseEdit(WarehouseVO vo)throws Exception;
		 // 창고 삭제 
		 public List<WarehouseVO> delInfo(String[] code_arr)throws Exception;
		 public void warehouseDel(String[] code_arr) throws Exception;	  
	  

		 // 창고등록) 사원 목록  
		 public List<WarehouseVO> searchEmployees(WarehouseVO vo) throws Exception;
		 // 창고등록) 사원 목록 데이터 수
		 public int searchEmployeesCount(WarehouseVO vo) throws Exception;	  
	  
	  
		 /*-----------------------------------------------------------------*/
		 
		 
		 // 재고 리스트 (페이징)
		 public List<WarehouseVO> stockList(WarehouseVO vo) throws Exception;
		 // 전체 재고 데이터 수
		 public int stockListCount(WarehouseVO vo) throws Exception;
		 // 재고 상세
		 public WarehouseVO stockInfo(String code) throws Exception;
		 // 재고 수정
		 public int stockEdit(WarehouseVO vo)throws Exception;
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 

		 // 품목 검색 팝업 
		 public List<StockVO> SearchMAPD(Criteria cri, String mapdCode, String mapdName) throws Exception;
		 
		 // 모든 품목 수
		 public int mapdListCount(String mapdCode, String mapdName) throws Exception;
		 
		 // 창고 검색 팝업 
		 public List<StockVO> searchWarehouse(Criteria cri, String whCode, String WhName) throws Exception;
		 
		 // 모든 창고 수
		 public int warehouseListCount(String whCode, String WhName) throws Exception;		 
	  
  
  
  }
 