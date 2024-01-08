package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.ClientVO;
import com.itwillbs.domain.Criteria;
import com.itwillbs.persistence.ClientDAO;

@Service
public class ClientServiceImpl implements ClientService {
	
	private static final Logger logger = LoggerFactory.getLogger(ClientServiceImpl.class);
	
	@Inject
	private ClientDAO cdao;

	@Override
	public List<ClientVO> clientListAll() throws Exception {
		logger.debug(" S : clientListAll() ");
		return cdao.getClientListAll();
	}

	@Override
	public ClientVO getClient(String code) throws Exception {
		logger.debug(" S : getClient(String code) ");
		return cdao.getClient(code);
	}

	@Override
	public int clientModify(ClientVO cvo) throws Exception {
		logger.debug(" S : clientModify(ClientVO cvo) ");
		return cdao.updateClient(cvo);
	}

	@Override
	public void clientRemove(String code) throws Exception {
		logger.debug(" S : clientRemove(String code) ");
		cdao.deleteClient(code);
	}

	@Override
	public List<ClientVO> clientListPage(Criteria cri) throws Exception {
		logger.debug(" S : clientListPage(Criteria cri) ");
		return cdao.getClientListPage(cri);
	}

	@Override
	public int totalClientCount() throws Exception {
		logger.debug(" S : totalClientCount() ");
		return cdao.getClientCount();
	}
	
	@Override
	public void clientWrite(ClientVO cvo) throws Exception {
		logger.debug(" S : clientWrite(ClientVO cvo) ");
	}
	
}
