package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.ClientVO;
import com.itwillbs.domain.Criteria;

public interface ClientService {
	
	public void clientWrite(ClientVO cvo) throws Exception;
	
	public List<ClientVO> clientListAll() throws Exception;
	
	public ClientVO getClient(String code) throws Exception;
	
	public int clientModify(ClientVO cvo) throws Exception;
	
	public void clientRemove(String code) throws Exception;
	
	public List<ClientVO> clientListPage(Criteria cri) throws Exception;
	
	public int totalClientCount() throws Exception;

}
