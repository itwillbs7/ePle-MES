package com.itwillbs.persistence;

import java.util.List;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.OrderVO;
import com.itwillbs.domain.WarehouseVO;

public interface OrderDAO {
	
	public List<OrderVO> getOrderListAll(Criteria cri) throws Exception;
	public int getOrderCount() throws Exception;
	public void insertOrder(OrderVO vo) throws Exception;

}
