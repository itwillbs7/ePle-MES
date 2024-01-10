package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.ClientVO;
import com.itwillbs.domain.Criteria;

public interface ClientService {
	
	public List<ClientVO> clientListAll() throws Exception;
	
	public ClientVO getClient(String code) throws Exception;
	
	public int clientUpdate(ClientVO cvo) throws Exception;
	
	public int deleteClients(String[] codes) throws Exception;
	
	public List<ClientVO> clientListPage(Criteria cri) throws Exception;
	
	public int totalClientCount() throws Exception;
	
	public List<ClientVO> getInfo(String[] codes) throws Exception;
	
	public void InsertClient(ClientVO cvo) throws Exception;

}
