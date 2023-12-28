package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.OrderVO;
import com.itwillbs.domain.WarehouseVO;

public interface OrderService {
	
	 public List<OrderVO> orderList(Criteria cri) throws Exception;
	 public int totalOrderCount() throws Exception;
	 public void InsertOrder(OrderVO vo) throws Exception;


}
