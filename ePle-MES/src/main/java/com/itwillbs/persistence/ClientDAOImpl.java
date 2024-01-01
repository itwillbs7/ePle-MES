package com.itwillbs.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.ClientVO;
import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.MAPDVO;

@Repository
public class ClientDAOImpl implements ClientDAO {

	private static final Logger logger = LoggerFactory.getLogger(ClientDAOImpl.class);
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE ="com.itwillbs.mapper.ClientMapper";

	@Override
	public List<ClientVO> getClientListAll() throws Exception {
		return null;
	}

	@Override
	public ClientVO getClient(String code) throws Exception {
		return null;
	}

	@Override
	public int updateClient(ClientVO cvo) throws Exception {
		return 0;
	}

	@Override
	public void deleteClient(String code) throws Exception {		
	}

	@Override
	public List<ClientVO> getClientListPage(Criteria cri) throws Exception {
		return null;
	}

	@Override
	public int getClientCount() throws Exception {
		return 0;
	}

}
