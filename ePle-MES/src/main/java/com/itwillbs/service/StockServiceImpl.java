package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.OrderVO;
import com.itwillbs.domain.StockVO;
import com.itwillbs.domain.WarehouseVO;
import com.itwillbs.persistence.StockDAO;

@Service
public class StockServiceImpl implements StockService {
	
	private static final Logger logger = LoggerFactory.getLogger(StockServiceImpl.class);
	
	@Inject
	private StockDAO sdao;

	 
	// 창고 리스트 (페이징)
	@Override
	public List<WarehouseVO> warehouseList(WarehouseVO vo) throws Exception {
		logger.debug("S - warehouseList(WarehouseVO vo)");
		return sdao.warehouseList(vo);
	}
	// 전체 창고 데이터 수
	@Override
	public int warehouseListCount(WarehouseVO vo) throws Exception {
		logger.debug("S - warehouseListCount(WarehouseVO vo)");
		return sdao.warehouseListCount(vo);
	}
	// 창고 등록
	@Override
	public int warehouseAdd(WarehouseVO vo) throws Exception {
		logger.debug("S - warehouseAdd(WarehouseVO vo)");
		return sdao.warehouseAdd(vo);
	}
	// 창고 상세
	@Override
	public WarehouseVO warehouseInfo(String code) throws Exception {
		logger.debug("S - warehouseInfo(String code)"+code);
		return sdao.warehouseInfo(code);
	}
	// 창고 수정
	@Override
	public int warehouseEdit(WarehouseVO vo)throws Exception {
		logger.debug("S - warehouseEdit(WarehouseVO vo)");
		return sdao.warehouseEdit(vo);
	}
	// 창고 삭제
	@Override
	public List<WarehouseVO> delInfo(String[] code_arr)throws Exception {
		return sdao.delInfo(code_arr);
	}
	@Override
	public void warehouseDel(String[] code_arr) throws Exception {
		sdao.warehouseDel(code_arr);
	}	
	// 창고등록) 사원 목록   	
	@Override
	public List<WarehouseVO> searchEmployees(WarehouseVO vo) throws Exception {
		logger.debug("S - searchEmployees(WarehouseVO vo)");
		return sdao.searchEmployees(vo);
	}
	// 창고등록) 사원 목록 데이터 수
	@Override
	public int searchEmployeesCount(WarehouseVO vo) throws Exception {
		logger.debug("S - searchEmployeesCount(WarehouseVO vo)");
		return sdao.searchEmployeesCount(vo);
	}	
	
	
	 /*-----------------------------------------------------------------*/
	 
	// 재고 리스트 (페이징)
	@Override
	public List<WarehouseVO> stockList(WarehouseVO vo) throws Exception {
		logger.debug("S - stockList(WarehouseVO vo)");
		return sdao.stockList(vo);
	}
	// 전체 재고 데이터 수
	@Override
	public int stockListCount(WarehouseVO vo) throws Exception {
		logger.debug("S - stockListCount(WarehouseVO vo)");
		return sdao.stockListCount(vo);
	}
	// 재고 상세
	@Override
	public WarehouseVO stockInfo(String code) throws Exception {
		logger.debug("S - stockInfo(String code)"+code);
		return sdao.stockInfo(code);
	}
	// 재고 수정
	@Override
	public int stockEdit(WarehouseVO vo)throws Exception {
		logger.debug("S - stockEdit(WarehouseVO vo)");
		return sdao.stockEdit(vo);
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
