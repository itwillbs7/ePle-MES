package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.ClientVO;
import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.MAPDVO;
import com.itwillbs.domain.PageVO;
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
	public int clientUpdate(ClientVO cvo) throws Exception {
		logger.debug(" S : clientUpdate(ClientVO cvo) ");
		return cdao.updateClient(cvo);
	}

    @Override
    public int deleteClients(String[] codes) throws Exception {
        return cdao.deleteClients(codes);
    }

    @Override
    public List<ClientVO> getInfo(String[] codes) throws Exception {
        return cdao.getInfo(codes);
    }

	@Override
	public int InsertClient(ClientVO cvo) throws Exception {
		return cdao.insertClient(cvo);
	}

	@Override
	public ClientVO infoClient(String code) throws Exception {
		return cdao.infoClient(code);
	}

	@Override
	public List<ClientVO> clientListPage(PageVO vo) throws Exception {
		return cdao.getClientListPage(vo);
	}

	@Override
	public int totalClientCount() throws Exception {
		return cdao.getClientCount();
	}
	
	
	
}
