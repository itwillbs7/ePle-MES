package com.itwillbs.persistence;

import java.util.List;

import com.itwillbs.domain.ClientVO;
import com.itwillbs.domain.Criteria;

public interface ClientDAO {

	public List<ClientVO> getClientListAll() throws Exception;
	
	public ClientVO getClient(String code) throws Exception;
	
	public int updateClient(ClientVO cvo) throws Exception;
	
	public int deleteClients(String[] codes) throws Exception;
	
	public List<ClientVO> getClientListPage(Criteria cri) throws Exception;
	
	public int getClientCount() throws Exception;
	
	public void insertClient(ClientVO cvo) throws Exception;
			
	public List<ClientVO> getInfo(String[] codes) throws Exception;
	
}