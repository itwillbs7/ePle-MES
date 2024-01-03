package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.OrderVO;
import com.itwillbs.domain.WarehouseVO;

public interface OrderService {
	
	 // 4-9 발주 목록 ~ 4-10 발주 검색 
	 public List<OrderVO> orderList(Criteria cri, String searchOrder, String searchMapd) throws Exception;
	 
	 // 모든 발주 수
	 public int orderListCount(String searchOrder, String searchMapd) throws Exception;

	 // 품목 검색 팝업 
	 public List<OrderVO> SearchMAPD(Criteria cri, String mapdCode, String mapdName) throws Exception;
	 
	 // 모든 품목 수
	 public int mapdListCount(String mapdCode, String mapdName) throws Exception;
	 
	 // 발주 삭제
	 public List<OrderVO> delInfo(String[] code_arr)throws Exception;
	 public void deleteOrder(String[] code_arr) throws Exception;	

}
