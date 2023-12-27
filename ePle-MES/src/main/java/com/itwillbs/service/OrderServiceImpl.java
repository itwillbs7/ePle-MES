package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.OrderVO;
import com.itwillbs.persistence.OrderDAO;

@Service
public class OrderServiceImpl implements OrderService {
	
	private static final Logger logger = LoggerFactory.getLogger(OrderServiceImpl.class);
	
	@Inject
	private OrderDAO odao;

	@Override
	public List<OrderVO> orderList(Criteria cri) throws Exception {
		logger.debug("orderList(Criteria cri)");
		return odao.getOrderListAll(cri);
	}

	@Override
	public int totalOrderCount() throws Exception {
		logger.debug(" S : totalOrderCount()  ");
		return odao.getOrderCount();
	}
	
	
	
	
	
}
