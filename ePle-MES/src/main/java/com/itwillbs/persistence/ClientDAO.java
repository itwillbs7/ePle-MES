package com.itwillbs.persistence;

import java.util.List;

import com.itwillbs.domain.ClientVO;
import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.PageVO;

public interface ClientDAO {

	public List<ClientVO> getClientListAll() throws Exception;
	
	public ClientVO getClient(String code) throws Exception;
	
	public int updateClient(ClientVO cvo) throws Exception;
	
	public int deleteClients(String[] codes) throws Exception;
<<<<<<< HEAD
			
=======
	
	
	public List<ClientVO> getClientListPage(Criteria cri) throws Exception;
	
	public int totalClientCount() throws Exception;
	
	public List<ClientVO> clientListByCategory(String searchCategory, String searchKeyword, Criteria cri) throws Exception;
	
	public int getClientCount() throws Exception;
	
>>>>>>> 8e4ab98f7c7f00be4b1efbef8420cc927b90a7ec
	public int insertClient(ClientVO cvo) throws Exception;
			
	public List<ClientVO> getInfo(String[] codes) throws Exception;

	// 거래처 상세
	public ClientVO infoClient(String code) throws Exception;
	
<<<<<<< HEAD
	public List<ClientVO> getClientListPage(int page) throws Exception;
	public List<ClientVO> getClientListPage(PageVO vo) throws Exception;
	
	public int getClientCount() throws Exception;
=======
	
>>>>>>> 8e4ab98f7c7f00be4b1efbef8420cc927b90a7ec
	
}