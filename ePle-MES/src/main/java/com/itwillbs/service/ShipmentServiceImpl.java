package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.RequestVO;
import com.itwillbs.domain.ShipmentVO;
import com.itwillbs.persistence.ShipmentDAO;

@Service
public class ShipmentServiceImpl implements ShipmentService {

	
	private static final Logger logger = LoggerFactory.getLogger(ShipmentServiceImpl.class);
	
	@Inject
	private ShipmentDAO sdao;

	@Override
	public List<ShipmentVO> shipmentListpage(Criteria cri) throws Exception {
		logger.debug("페이징처리하기 "+cri);

		return sdao.getShipmentListPage(cri);
	}
	

	@Override
	public int getTotal() throws Exception {
		logger.debug("servide : getTotal()");
		return sdao.getShipmentCount();
	}



	@Override
	public List<ShipmentVO> shipmentList() throws Exception {
		logger.debug("Service : requestList()");
		return sdao.getShipmentListAll();
	}
	
	@Override
	public ShipmentVO getinfo(String code) throws Exception {
		logger.debug("Service : getinfo(String code)"+code);
		return sdao.getShipmentDetail(code);
	}
	

	@Override
	public void dataInsertShipment(ShipmentVO vo) throws Exception {
		logger.debug("Service : dataInsertShipment(ShipmentVO vo) : "+vo);
		sdao.insertShipment(vo);
		
	}

	@Override
	public List<RequestVO> findClient(String client_code, String clientName) throws Exception {
		logger.debug("Service : findClient(String client_code, String clientName) : "+client_code+clientName);

		return sdao.searchClient(client_code,clientName);
	}

	@Override
	public List<RequestVO> ClientList() throws Exception {
		logger.debug("Service : ClientList() 회사리스트 뽑기  ");

		return sdao.getClientList();
	}


	@Override
	public List<RequestVO> ProductList() throws Exception {
		logger.debug("Service : ProductList() 품목리스트 뽑기");
		return sdao.getProductList();
	}

	@Override
	public List<RequestVO> findProduct(String product, String productName) throws Exception {
		logger.debug("Service : ffindProduct(String product, String productName) : "+product+productName);

		return sdao.searchProduct(product,productName);
	}



	@Override
	public void updateShipment(ShipmentVO vo, String id) throws Exception {
		// 수정
		logger.debug("Service : updateShipment(ShipmentVO vo, String id) 수정");
		sdao.shipmentUpdate(vo,id);
	}



	@Override
	public List<ShipmentVO> findShipmentList(ShipmentVO vo) throws Exception {
		// 수주 검색
		logger.debug("Service : findRequestList(RequestVO vo) 수주 검색");
		return sdao.searchShipmentAll(vo);
	}



	@Override
	public List<ShipmentVO> getinfo(String[] code) throws Exception {
		logger.debug("Service : getinfo(String[] code) 삭제 데이터 ");
		return sdao.getShipmentDetail(code);
	}



	@Override
	public void deleteShipment(String[] code) throws Exception {
		logger.debug("Service : deleteShipment(String[] code) 데이터 삭제");
		sdao.deleteShipment(code);
	}
	
	
}
