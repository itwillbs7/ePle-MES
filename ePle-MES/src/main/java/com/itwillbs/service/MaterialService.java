package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.OrderVO;
import com.itwillbs.domain.WarehouseVO;
import com.itwillbs.domain.Warehouse_HistoryVO;

public interface MaterialService {

	
	 // 입고 리스트 (페이징)
	 public List<Warehouse_HistoryVO> inList(Warehouse_HistoryVO vo) throws Exception;
	 // 전체 입고 데이터 수
	 public int inListCount(Warehouse_HistoryVO vo) throws Exception;
	 // 입고 등록
	 public int inAdd(Warehouse_HistoryVO vo) throws Exception;
	 // 최신코드 가져오기
	 public String getRecentCode() throws Exception;
	 // 입고 상세
	 public Warehouse_HistoryVO inInfo(String code) throws Exception;
	 // 입고 수정
	 public int inEdit(Warehouse_HistoryVO vo)throws Exception;
	 
	 // 입고등록) 발주 목록  
	 public List<OrderVO> searchOrder(OrderVO vo) throws Exception;
	 // 입고등록) 발주 목록 데이터 수
	 public int orderListCount(OrderVO vo) throws Exception;
	 // 입고등록) 발주 상태 업데이트
	 public int updateComplete(OrderVO vo) throws Exception;
	 // 입고등록) 창고 목록 (원자재) 
	 public List<WarehouseVO> orderWarehouse(WarehouseVO vo) throws Exception;
	 // 입고등록) 창고 데이터 수 (원자재) 
	 public int warehouseListCount(WarehouseVO vo) throws Exception;
	 // 입고검색) 품목 목록 (전체) 
	 public List<OrderVO> searchMAPD(OrderVO vo) throws Exception;
	 // 입고검색) 품목 데이터 수 (전체) 
	 public int searchMAPDCount(OrderVO vo) throws Exception;
	 
	/*-------------------------------------------------------------------------*/
	 
	 // 발주요청 리스트 (페이징)
	 public List<OrderVO> askOrderList(OrderVO vo) throws Exception;
	 // 전체 발주요청 데이터 수
	 public int askOrderListCount(OrderVO vo) throws Exception;
	 // 발주요청 등록
	 public int askOrderAdd(OrderVO vo) throws Exception;
	 // 발주 최신코드 가져오기
	 public String orderRecentCode() throws Exception;
	 // 발주요청 상세
	 public OrderVO askOrderInfo(String code) throws Exception;
	 // 발주요청 수정
	 public int askOrderEdit(OrderVO vo)throws Exception;
	 // 발주요청 삭제 
	 public List<OrderVO> delAskInfo(String[] code_arr)throws Exception;
	 public void askOrderDel(String[] code_arr) throws Exception;
	 
	 // 발주요청등록) 품목 목록 (원자재) 
	 public List<OrderVO> searchMaterial(OrderVO vo) throws Exception;
	 // 발주요청등록) 품목 데이터 수 (원자재) 
	 public int searchMaterialCount(OrderVO vo) throws Exception;
	 
	/*-------------------------------------------------------------------------*/
	 
	 // 발주관리 등록 
	 public int orderAdd(OrderVO vo)throws Exception;
	 // 발주관리 리스트 (페이징)
	 public List<OrderVO> orderList(OrderVO vo) throws Exception;
	 // 전체 발주관리 데이터 수
	 public int orderListCount2(OrderVO vo) throws Exception;
	 // 발주관리 상세
	 public OrderVO orderInfo(String code) throws Exception;
	 // 발주관리 수정
	 public int orderEdit(OrderVO vo)throws Exception;
	 // 발주관리 삭제 
	 public List<OrderVO> delOrderInfo(String[] code_arr)throws Exception;
	 public void orderDel(String[] code_arr) throws Exception;
	 
	 // 발주등록) 거래처 목록 
	 public List<OrderVO> searchClient(OrderVO vo) throws Exception;
	 // 발주등록) 거래처 데이터 수  
	 public int searchClientCount(OrderVO vo) throws Exception;
	 
	/*-------------------------------------------------------------------------*/
	 
	 // 출고 리스트 (페이징)
	 public List<Warehouse_HistoryVO> outList(Warehouse_HistoryVO vo) throws Exception;
	 // 전체 출고 데이터 수
	 public int outListCount(Warehouse_HistoryVO vo) throws Exception;
	 // 출고 상세
	 public Warehouse_HistoryVO outInfo(String code) throws Exception;	 
	 
	// 출고 등록 
	public int outAdd(Warehouse_HistoryVO vo)throws Exception;
	// 출고 최신코드 가져오기
	public String outRecentCode() throws Exception;
	 
	 
	 
	 
	 
	 
}
