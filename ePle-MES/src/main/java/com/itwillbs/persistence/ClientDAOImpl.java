package com.itwillbs.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("cri", cri);
        return sqlSession.selectList(NAMESPACE + ".clientListPage", paramMap);
    }

    @Override
    public int totalClientCount() throws Exception {
        return sqlSession.selectOne(NAMESPACE + ".totalClientCount");
    }
    
    @Override
    public List<ClientVO> clientListByCategory(String searchCategory, String searchKeyword, Criteria cri) throws Exception {
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("searchCategory", searchCategory);
        paramMap.put("searchKeyword", searchKeyword);
        paramMap.put("cri", cri);
        return sqlSession.selectList(NAMESPACE + ".clientListByCategory", paramMap);
    }
	

	@Override
	public int getClientCount() throws Exception {
		return 0;
	}

	@Override
	public int insertClient(ClientVO cvo) throws Exception {
		return sqlSession.insert(NAMESPACE+".insertClient", cvo);
	}


    @Override
    public List<ClientVO> getInfo(String[] codes) throws Exception {
        return sqlSession.selectList(NAMESPACE + ".getInfo", codes);
    }

	@Override
	public ClientVO infoClient(String code) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".infoClient", code);
	}



}
