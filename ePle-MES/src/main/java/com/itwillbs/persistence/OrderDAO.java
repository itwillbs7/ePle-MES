package com.itwillbs.persistence;

import java.util.List;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.OrderVO;
import com.itwillbs.domain.WarehouseVO;

public interface OrderDAO {
	
	
	public List<OrderVO> getOrderAskList(Criteria cri) throws Exception;
	
	public int getOrderAskCount() throws Exception;
	
	
	// 4-9 발주 목록 ~ 4-10 발주 검색 
	public List<OrderVO> getOrderList(Criteria cri, String searchOrder, String searchMapd) throws Exception;
	
	// 모든 발주 수
	public int getOrderCount(String searchOrder, String searchMapd) throws Exception;
	
	// 품목 검색 팝업 
	public List<OrderVO> SearchMAPD(Criteria cri, String mapdCode, String mapdName) throws Exception;
	
	// 모든 품목 수
	public int getMAPDCount(String mapdCode, String mapdName) throws Exception;

	// 발주 삭제
	public List<OrderVO> getDelInfo(String[] code_arr)throws Exception;
	public void getDeleteOrder(String[] code_arr) throws Exception;
	
	
}
