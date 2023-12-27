package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.OrderVO;

public interface OrderService {
	
	 public List<OrderVO> orderList(Criteria cri) throws Exception;
	 public int totalOrderCount() throws Exception;



}
