package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.OrderVO;
import com.itwillbs.domain.StockVO;
import com.itwillbs.persistence.StockDAO;

@Service
public class StockServiceImpl implements StockService {
	
	private static final Logger logger = LoggerFactory.getLogger(StockServiceImpl.class);
	
	@Inject
	private StockDAO sdao;

	
	
	// 재고 목록 ~ 재고 검색 
	@Override
	public List<StockVO> stockList(Criteria cri, String searchWarehouse, String searchMapd) throws Exception {
		return sdao.getStockList(cri, searchWarehouse, searchMapd);
	}

	// 모든 재고 데이터 수
	@Override
	public int stockListCount(String searchWarehouse, String searchMapd) throws Exception {
		return sdao.getStockCount(searchWarehouse, searchMapd);
	}
	
	// 품목 검색 팝업 
	@Override
	public List<StockVO> SearchMAPD(Criteria cri, String mapdCode, String mapdName) throws Exception {
		return sdao.SearchMAPD(cri, mapdCode, mapdName);
	}
	
	// 모든 품목 수
	@Override
	public int mapdListCount(String mapdCode, String mapdName) throws Exception {
		return sdao.getMAPDCount(mapdCode, mapdName);
	}

	// 창고 검색 팝업 
	@Override
	public List<StockVO> searchWarehouse(Criteria cri, String whCode, String WhName) throws Exception {
		return sdao.searchWarehouse(cri, whCode, WhName);
	}
	
	// 창고 품목 수
	@Override
	public int warehouseListCount(String whCode, String WhName) throws Exception {
		return sdao.getWarehouseCount(whCode, WhName);
	}
	
	

}
