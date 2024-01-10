package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.PageVO;
import com.itwillbs.domain.RequestVO;
import com.itwillbs.persistence.RequestDAO;

@Service
public class RequestServiceImpl implements RequestService {
	
	private static final Logger logger = LoggerFactory.getLogger(RequestServiceImpl.class);
	
	@Inject
	private RequestDAO rdao;
	

	@Override
	public List<RequestVO> requestListpage(RequestVO vo,Criteria cri) throws Exception {
		logger.debug("페이징처리하기 "+cri);

		return rdao.getRequestListPage(vo, cri);
	}
	

	@Override
	public int getTotal(RequestVO vo) throws Exception {
		logger.debug("servide : getTotal()");
		return rdao.getRequestCount(vo);
	}



	@Override
	public List<RequestVO> requestList() throws Exception {
		logger.debug("Service : requestList()");
		return rdao.getRequestListAll();
	}
	
	@Override
	public RequestVO getinfo(String code) throws Exception {
		logger.debug("Service : getinfo(String code)"+code);
		return rdao.getRequestDetail(code);
	}
	

	@Override
	public String getRecentCode(String code)throws Exception {
		logger.debug("Service : 수주 코드 찾기");
		return rdao.getRecentCode(code);
	}



	@Override
	public int dataInsertRequest(RequestVO vo) throws Exception {
		logger.debug("Service : dataInsertRequest(RequestVO vo) : "+vo);
		return rdao.insertRequest(vo);
		
	}

	//======================================== add/ search
	@Override
	public List<RequestVO> findClient(String client_code, String clientName,Criteria cri) throws Exception {
		logger.debug("Service : findClient(String client_code, String clientName) : "+client_code+clientName);

		return rdao.searchClient(client_code,clientName,cri);
	}

	@Override
	public List<RequestVO> ClientList(Criteria cri) throws Exception {
		logger.debug("Service : ClientList() 회사리스트 뽑기  ");

		return rdao.getClientList(cri);
	}

	@Override
	public List<RequestVO> ManagerList(Criteria cri) throws Exception {
		logger.debug("Service : ManagerList() 사원리스트 뽑기");
		return rdao.getManagerList(cri);
	}

	@Override
	public List<RequestVO> findManager(String manager, String managerName,Criteria cri) throws Exception {
		logger.debug("Service : ffindManager(String manager, String managerName) : "+manager+managerName);

		return rdao.searchManager(manager,managerName,cri);
	}

	@Override
	public List<RequestVO> ProductList(Criteria cri) throws Exception {
		logger.debug("Service : ProductList() 품목리스트 뽑기");
		return rdao.getProductList(cri);
	}

	@Override
	public List<RequestVO> findProduct(String product, String productName,Criteria cri) throws Exception {
		logger.debug("Service : ffindProduct(String product, String productName) : "+product+productName);

		return rdao.searchProduct(product,productName,cri);
	}
	
	@Override
	public int getClientTotal() throws Exception {
		
		return rdao.getClientTotal();
	}

	@Override
	public int getClientTotal(String client_code, String clientName) throws Exception {
		// TODO Auto-generated method stub
		return rdao.getClientTotal(client_code, clientName);
	}

	@Override
	public int getManagerTotal() throws Exception {
		// TODO Auto-generated method stub
		return rdao.getManagerTotal();
	}

	@Override
	public int getManagerTotal(String manager, String managerName) throws Exception {
		// TODO Auto-generated method stub
		return rdao.getManagerTotal(manager, managerName);
	}

	@Override
	public int getProductTotal() throws Exception {
		// TODO Auto-generated method stub
		return rdao.getProductTotal();
	}

	@Override
	public int getProductTotal(String product, String productName) throws Exception {
		// TODO Auto-generated method stub
		return rdao.etProductTotal(product, productName);
	}
	//======================================== add/ search



	@Override
	public int updateRequest(RequestVO vo, String id) throws Exception {
		// 수정
		logger.debug("Service : updateRequest(RequestVO vo, String id) 수정");
		return rdao.requestUpdate(vo,id);
	}



	@Override
	public List<RequestVO> findRequestList(RequestVO vo, Criteria cri) throws Exception {
		// 수주 검색
		logger.debug("Service : findRequestList(RequestVO vo) 수주 검색");
		return rdao.searchRequestAll(vo,cri);
	}



	@Override
	public List<RequestVO> getinfo(String[] code) throws Exception {
		logger.debug("Service : getinfo(String[] code) 삭제 데이터 ");
		return rdao.getRequestDetail(code);
	}



	@Override
	public int deleteRequest(String[] code) throws Exception {
		logger.debug("Service : deleteRequest(String[] code) 데이터 삭제");
		return rdao.deleteRequest(code);
	}

	
	
}
