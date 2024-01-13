package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.ClientVO;
import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.MAPDVO;
import com.itwillbs.domain.PageVO;

public interface ClientService {
	
	public List<ClientVO> clientListAll() throws Exception;
	
	public ClientVO getClient(String code) throws Exception;
	
	public int clientUpdate(ClientVO cvo) throws Exception;
	
	public int deleteClients(String[] codes) throws Exception;
	
	
	public List<ClientVO> clientListPage(Criteria cri) throws Exception;
	
	public int totalClientCount() throws Exception;
	
	public List<ClientVO> clientListByCategory(String searchCategory, String searchKeyword, Criteria cri) throws Exception;
	
	public List<ClientVO> getInfo(String[] codes) throws Exception;
	
	public int InsertClient(ClientVO cvo) throws Exception;

	// 거래처 상세
	public ClientVO infoClient(String code) throws Exception;
	
	public List<ClientVO> clientListPage(PageVO vo) throws Exception;
	
}
