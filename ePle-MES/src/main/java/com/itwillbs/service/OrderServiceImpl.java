package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.OrderVO;
import com.itwillbs.domain.WarehouseVO;
import com.itwillbs.persistence.OrderDAO;

@Service
public class OrderServiceImpl implements OrderService {
	
	private static final Logger logger = LoggerFactory.getLogger(OrderServiceImpl.class);
	
	@Inject
	private OrderDAO odao;

	
	// 4-1 발주 요청 목록
	@Override
	public List<OrderVO> orderAskList(Criteria cri) throws Exception {
		return odao.getOrderAskList(cri);
	}
	
	// 	전체 요청 수
	@Override
	public int orderAskListCount() throws Exception {
		return odao.getOrderAskCount();
	}
	
	// 발주 목록 ~ 발주 검색 
	@Override
	public List<OrderVO> orderList(Criteria cri, String searchOrder, String searchMapd) throws Exception {
		return odao.getOrderList(cri, searchOrder, searchMapd);
	}

	// 모든 발주 수
	@Override
	public int orderListCount(String searchOrder, String searchMapd) throws Exception {
		return odao.getOrderCount(searchOrder, searchMapd);
	}
	
	// 품목 검색 팝업 
	@Override
	public List<OrderVO> SearchMAPD(Criteria cri, String mapdCode, String mapdName) throws Exception {
		return odao.SearchMAPD(cri, mapdCode, mapdName);
	}
	
	// 모든 품목 수
	@Override
	public int mapdListCount(String mapdCode, String mapdName) throws Exception {
		return odao.getMAPDCount(mapdCode, mapdName);
	}
	
	// 발주 삭제
	@Override
	public List<OrderVO> delInfo(String[] code_arr) throws Exception {
		return odao.getDelInfo(code_arr);
	}

	@Override
	public void deleteOrder(String[] code_arr) throws Exception {
		odao.getDeleteOrder(code_arr);
	}
	
	
	
	
}
