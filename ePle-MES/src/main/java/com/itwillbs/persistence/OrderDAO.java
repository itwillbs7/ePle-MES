package com.itwillbs.persistence;

import java.util.List;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.OrderVO;

public interface OrderDAO {
	
	public List<OrderVO> getOrderListAll(Criteria cri) throws Exception;
	public int getOrderCount() throws Exception;


}
