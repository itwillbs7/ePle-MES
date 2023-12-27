package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.RequestSearchVO;
import com.itwillbs.domain.RequestVO;
import com.itwillbs.persistence.RequestDAO;

@Service
public class RequestServiceImpl implements RequestService {
	
	private static final Logger logger = LoggerFactory.getLogger(RequestServiceImpl.class);
	
	@Inject
	private RequestDAO rdao;

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
	public void dataInsertRequest(RequestVO vo) throws Exception {
		logger.debug("Service : dataInsertRequest(RequestVO vo) : "+vo);
		rdao.insertRequest(vo);
		
	}

	@Override
	public List<RequestVO> findClient(String client_code, String clientName) throws Exception {
		logger.debug("Service : findClient(String client_code, String clientName) : "+client_code+clientName);

		return rdao.searchClient(client_code,clientName);
	}

	@Override
	public List<RequestVO> ClientList() throws Exception {
		logger.debug("Service : ClientList() 회사리스트 뽑기  ");

		return rdao.getClientList();
	}

	@Override
	public List<RequestVO> ManagerList() throws Exception {
		logger.debug("Service : ManagerList() 사원리스트 뽑기");
		return rdao.getManagerList();
	}

	@Override
	public List<RequestVO> findManager(String manager, String managerName) throws Exception {
		logger.debug("Service : ffindManager(String manager, String managerName) : "+manager+managerName);

		return rdao.searchManager(manager,managerName);
	}

	@Override
	public List<RequestVO> ProductList() throws Exception {
		logger.debug("Service : ProductList() 품목리스트 뽑기");
		return rdao.getProductList();
	}

	@Override
	public List<RequestVO> findProduct(String product, String productName) throws Exception {
		logger.debug("Service : ffindProduct(String product, String productName) : "+product+productName);

		return rdao.searchProduct(product,productName);
	}

	
	
	
}
