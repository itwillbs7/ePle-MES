package com.itwillbs.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.ClientVO;
import com.itwillbs.domain.Criteria;

@Repository
public class ClientDAOImpl implements ClientDAO {

	private static final Logger logger = LoggerFactory.getLogger(ClientDAOImpl.class);
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE ="com.itwillbs.mapper.ClientMapper";

	@Override
	public List<ClientVO> getClientListAll() throws Exception {
		return sqlSession.selectList(NAMESPACE + ".selectClientList");
	}

	@Override
	public ClientVO getClient(String code) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getClient",code);
	}

	@Override
	public int updateClient(ClientVO cvo) throws Exception {
		return sqlSession.update(NAMESPACE +".updateClient", cvo);
	}

	@Override
    public int deleteClients(String[] codes) {
        return sqlSession.delete(NAMESPACE + ".deleteClients", codes);
    }

	@Override
	public List<ClientVO> getClientListPage(Criteria cri) throws Exception {
		return null;
	}

	@Override
	public int getClientCount() throws Exception {
		return 0;
	}

	@Override
	public void insertClient(ClientVO cvo) throws Exception {
		sqlSession.insert(NAMESPACE+".insertClient", cvo);
	}


    @Override
    public List<ClientVO> getInfo(String[] codes) throws Exception {
        return sqlSession.selectList(NAMESPACE + ".getInfo", codes);
    }

}
