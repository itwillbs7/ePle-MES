package com.itwillbs.persistence;

import java.util.List;

import com.itwillbs.domain.ClientVO;
import com.itwillbs.domain.PageVO;

public interface ClientDAO {

	public List<ClientVO> getClientListAll() throws Exception;
	
	public ClientVO getClient(String code) throws Exception;
	
	public int updateClient(ClientVO cvo) throws Exception;
	
	public int deleteClients(String[] codes) throws Exception;

	public int insertClient(ClientVO cvo) throws Exception;
			
	public List<ClientVO> getInfo(String[] codes) throws Exception;

	// 거래처 상세
	public ClientVO infoClient(String code) throws Exception;
	
	public List<ClientVO> getClientListPage(int page) throws Exception;
	public List<ClientVO> getClientListPage(PageVO vo) throws Exception;

	public int getClientCount() throws Exception;

	
}