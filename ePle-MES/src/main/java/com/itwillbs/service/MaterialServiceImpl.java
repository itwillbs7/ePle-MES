package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.OrderVO;
import com.itwillbs.domain.WarehouseVO;
import com.itwillbs.domain.Warehouse_HistoryVO;
import com.itwillbs.persistence.MaterialDAO;

@Service
public class MaterialServiceImpl implements MaterialService {
	
	private static final Logger logger = LoggerFactory.getLogger(MaterialServiceImpl.class);
	
	@Inject
	private MaterialDAO mdao;

	
	// 입고 리스트 (페이징)
	@Override
	public List<Warehouse_HistoryVO> inList(Warehouse_HistoryVO vo) throws Exception {
		logger.debug("S - inList(Warehouse_HistoryVO vo)");
		return mdao.getInList(vo);
	}
	// 전체 입고 데이터 수
	@Override
	public int inListCount(Warehouse_HistoryVO vo) throws Exception {
		logger.debug("S - inListCount(Warehouse_HistoryVO vo)");
		return mdao.getInListCount(vo);
	}
	// 입고 등록
	@Override
	public int inAdd(Warehouse_HistoryVO vo) throws Exception {
		logger.debug("S - inAdd(Warehouse_HistoryVO vo)");
		return mdao.inAdd(vo);
	}
	// 최신코드 가져오기
	@Override
	public String getRecentCode() throws Exception {
		logger.debug("S - getRecentCode()");
		return mdao.getRecentCode();
	}
	// 입고 상세
	@Override
	public Warehouse_HistoryVO inInfo(String code) throws Exception {
		logger.debug("S - inInfo(String code)"+code);
		return mdao.inInfo(code);
	}
	// 입고 수정
	@Override
	public int inEdit(Warehouse_HistoryVO vo) throws Exception {
		logger.debug("S - inEdit(Warehouse_HistoryVO vo)");
		return mdao.inEdit(vo);
	}
	// 입고등록) 발주 목록 	
	@Override
	public List<OrderVO> searchOrder(OrderVO vo) throws Exception {
		logger.debug("S - searchOrder(OrderVO vo)");
		return mdao.searchOrder(vo);
	}
	// 입고등록) 발주 목록 데이터 수
	@Override
	public int orderListCount(OrderVO vo) throws Exception {
		logger.debug("S - orderListCount(OrderVO vo)");
		return mdao.orderListCount(vo);
	}
	// 입고등록) 발주 상태 업데이트
	@Override
	public int updateComplete(OrderVO vo) throws Exception {
		logger.debug("S - updateComplete(OrderVO vo)");
		return mdao.updateComplete(vo);
	}
	// 입고등록) 창고 목록 (원자재)
	@Override
	public List<WarehouseVO> orderWarehouse(WarehouseVO vo) throws Exception {
		logger.debug("S - orderWarehouse(WarehouseVO vo)");
		return mdao.orderWarehouse(vo);
	}
	// 입고등록) 창고 데이터 수 (원자재)
	@Override
	public int warehouseListCount(WarehouseVO vo) throws Exception {
		logger.debug("S - warehouseListCount(WarehouseVO vo)");
		return mdao.warehouseListCount(vo);
	}
	// 입고검색) 품목 목록 (전체)
	@Override
	public List<OrderVO> searchMAPD(OrderVO vo) throws Exception {
		logger.debug("S - searchMAPD(OrderVO vo)");
		return mdao.searchMAPD(vo);
	}
	// 입고검색) 품목 데이터 수 (전체)  
	@Override
	public int searchMAPDCount(OrderVO vo) throws Exception {
		logger.debug("S - searchMAPDCount(OrderVO vo)");
		return mdao.searchMAPDCount(vo);
	}	
	// 발주요청 리스트 (페이징)
	@Override
	public List<OrderVO> askOrderList(OrderVO vo) throws Exception {
		logger.debug("S - askOrderList(OrderVO vo)");
		return mdao.askOrderList(vo);
	}
	// 전체 발주요청 데이터 수
	@Override
	public int askOrderListCount(OrderVO vo) throws Exception {
		logger.debug("S - askOrderListCount(OrderVO vo)");
		return mdao.askOrderListCount(vo);
	}
	// 발주요청 등록
	@Override
	public int askOrderAdd(OrderVO vo) throws Exception {
		logger.debug("S - askOrderAdd(OrderVO vo)");
		return mdao.askOrderAdd(vo);
	}
	// 발주 최신코드 가져오기
	@Override
	public String orderRecentCode() throws Exception {
		logger.debug("S - orderRecentCode()");
		return mdao.orderRecentCode();
	}
	// 발주요청 상세
	@Override
	public OrderVO askOrderInfo(String code) throws Exception {
		logger.debug("S - askOrderInfo(String code)"+code);
		return mdao.askOrderInfo(code);
	}
	// 발주요청 수정
	@Override
	public int askOrderEdit(OrderVO vo) throws Exception {
		logger.debug("S - askOrderEdit(OrderVO vo)");
		return mdao.askOrderEdit(vo);
	}
	// 발주요청 삭제
	@Override
	public List<OrderVO> delAskInfo(String[] code_arr) throws Exception {
		return mdao.delAskInfo(code_arr);
	}
	@Override
	public void askOrderDel(String[] code_arr) throws Exception {
		mdao.askOrderDel(code_arr);
	}
	// 발주요청등록) 품목 목록 (원자재)
	@Override
	public List<OrderVO> searchMaterial(OrderVO vo) throws Exception {
		logger.debug("S - searchMaterial(OrderVO vo)");
		return mdao.searchMaterial(vo);
	}
	// 발주요청등록) 품목 데이터 수 (원자재) 
	@Override
	public int searchMaterialCount(OrderVO vo) throws Exception {
		logger.debug("S - searchMaterialCount(OrderVO vo)");
		return mdao.searchMaterialCount(vo);
	}	
	// 발주관리 등록
	@Override
	public int orderAdd(OrderVO vo) throws Exception {
		logger.debug("S - orderAdd(OrderVO vo)");
		return mdao.orderAdd(vo);
	}
	// 발주관리 리스트 (페이징)
	@Override
	public List<OrderVO> orderList(OrderVO vo) throws Exception {
		logger.debug("S - orderList(OrderVO vo)");
		return mdao.orderList(vo);
	}
	// 전체 발주관리 데이터 수
	@Override
	public int orderListCount2(OrderVO vo) throws Exception {
		logger.debug("S - orderListCount2(OrderVO vo)");
		return mdao.orderListCount2(vo);
	}
	// 발주관리 상세
	@Override
	public OrderVO orderInfo(String code) throws Exception {
		logger.debug("S - orderInfo(String code)"+code);
		return mdao.orderInfo(code);
	}
	// 발주관리 수정
	@Override
	public int orderEdit(OrderVO vo)throws Exception {
		logger.debug("S - orderEdit(OrderVO vo)");
		return mdao.orderEdit(vo);
	}
	// 발주관리 삭제
	@Override
	public List<OrderVO> delOrderInfo(String[] code_arr)throws Exception {
		return mdao.delOrderInfo(code_arr);
	}
	@Override
	public void orderDel(String[] code_arr) throws Exception {
		mdao.orderDel(code_arr);
	}	
	// 발주등록) 거래처 목록
	@Override
	public List<OrderVO> searchClient(OrderVO vo) throws Exception {
		logger.debug("S - searchClient(OrderVO vo)");
		return mdao.searchClient(vo);
	}
	// 발주등록) 거래처 데이터 수 
	@Override
	public int searchClientCount(OrderVO vo) throws Exception {
		logger.debug("S - searchClientCount(OrderVO vo)");
		return mdao.searchClientCount(vo);
	}	
	// 출고 리스트 (페이징)
	@Override
	public List<Warehouse_HistoryVO> outList(Warehouse_HistoryVO vo) throws Exception {
		logger.debug("S - outList(Warehouse_HistoryVO vo)");
		return mdao.outList(vo);
	}
	// 전체 출고 데이터 수
	@Override
	public int outListCount(Warehouse_HistoryVO vo) throws Exception {
		logger.debug("S - outListCount(Warehouse_HistoryVO vo)");
		return mdao.outListCount(vo);
	}
	// 출고 상세
	@Override
	public Warehouse_HistoryVO outInfo(String code) throws Exception {
		logger.debug("S - outInfo(String code)"+code);
		return mdao.outInfo(code);
	}
	
	
	
	
	// 출고 등록
	@Override
	public int outAdd(Warehouse_HistoryVO vo) throws Exception {
		logger.debug("S -  outAdd(Warehouse_HistoryVO vo)");
		return mdao.outAdd(vo);
	}
	// 출고 최신코드 가져오기
	@Override
	public String outRecentCode() throws Exception {
		logger.debug("S - outRecentCode()");
		return mdao.outRecentCode();
	}
	
	
	
}
