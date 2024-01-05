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
	public int dataInsertShipment(ShipmentVO vo) throws Exception {
		logger.debug("Service : dataInsertShipment(ShipmentVO vo) : "+vo);
		return sdao.insertShipment(vo);
		
	}

	//========================================= add /search 용
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
	public List<RequestVO> RequestList() throws Exception {
		logger.debug("RequestList() 수주목록 가져오기");
		return sdao.getRequestList();
	}


	@Override
	public List<RequestVO> findRequest(String clientName, String productName) throws Exception {
		logger.debug("findRequest(String clientName, String productName)"+clientName+productName);
		logger.debug("회사명, 품명으로 수주목록찾기");
		return sdao.searchRequest(clientName, productName);
	}


	//========================================= add /search 용
	@Override
	public int updateShipment(ShipmentVO vo, String id) throws Exception {
		// 수정
		logger.debug("Service : updateShipment(ShipmentVO vo, String id) 수정");
		return sdao.shipmentUpdate(vo,id);
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
	public int deleteShipment(String[] code) throws Exception {
		logger.debug("Service : deleteShipment(String[] code) 데이터 삭제");
		return sdao.deleteShipment(code);
	}


	@Override
	public void insertIntoLOT(String code, String request) throws Exception {
		logger.debug("LOT 테이블에 출하번호 넣기 : "+code);
		
		sdao.updateLOTvaluseShipment(code,request);
	}


	@Override
	public int changeStatus(String[] code) throws Exception {
		logger.debug("출하상태 수주상태 변경하기");
		return sdao.updateStatusToDone(code);
	}
	
	
	
	
}
