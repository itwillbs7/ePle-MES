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
	public String getRecentCode(String vocode) throws Exception {
		
		return sdao.getRecentCode(vocode);
	}
	
	@Override
	public String getRecentHistory(String vocode) throws Exception {
		logger.debug("입출고테이블에서 출고 데이터 찾기~~~~~~~");
		return sdao.getRecentHistory(vocode);
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
	public List<RequestVO> RequestList(Criteria cri) throws Exception {
		logger.debug("RequestList() 수주목록 가져오기");
		return sdao.getRequestList(cri);
	}
	


	@Override
	public int getRequestTotal(String clientName, String productName) {
		// TODO Auto-generated method stub
		return sdao.getRequestTotal(clientName, productName);
	}

	@Override
	public List<RequestVO> findRequest(String productName, String clientName, Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sdao.searchRequest(clientName, productName, cri);
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
	public int changeStatus(String[] code) throws Exception {
		logger.debug("출하상태 수주상태 변경하기");
		return sdao.updateStatusToDone(code);
	}


	@Override
	public List<ShipmentVO> getinfoList(String[] codeArr) throws Exception {
		logger.debug("프린트하기~~~ 출하정보 가져오기!");
		return sdao.getinfoList(codeArr);
	}


	@Override
	public List<RequestVO> getinfoRequest(List<String> reqsArr) throws Exception {
		logger.debug("프린트하기~~~ 수주정보 가져오기!");
		return sdao.getinfoRequest( reqsArr);
	}


	@Override
	public int receiptToClient(String[] code) throws Exception {
		logger.debug("고객님이 큐알을 찍으셨다네~~~~ 이건 수주번호~~"+code);
		return sdao.receiptToClient(code);
	}


	@Override
	public int actDoneShipment(String[] code) throws Exception {
		logger.debug("출하완료~~~~ 이건 출하번호~~"+code);
		
		return sdao.actDoneShipment(code);
	}



	
	
	
	
}
