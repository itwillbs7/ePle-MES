package com.itwillbs.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.RequestSearchVO;
import com.itwillbs.domain.RequestVO;

@Repository
public class RequestDAOImpl implements RequestDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(RequestDAOImpl.class);
	
	private static final String NAMESPACE="com.itwillbs.mapper.requestMapper";
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<RequestVO> getRequestListAll() throws Exception {
		logger.debug("DAO 수주정보리스트 getRequestListAll() ");
		return sqlSession.selectList(NAMESPACE+".getRequestList");
	}
	
	

	@Override
	public RequestVO getRequestDetail(String code) throws Exception {
		logger.debug("DAO 수주정보 자세히보기 getRequestDetail(String code) "+code);
		RequestVO vo = sqlSession.selectOne(NAMESPACE+".getRequestInfo", code);
		
		vo.setClientName(sqlSession.selectOne(NAMESPACE+".findCompany", vo.getClient_code()));
		vo.setManagerName(sqlSession.selectOne(NAMESPACE+".findManager",vo.getManager()));
		vo.setProductName(sqlSession.selectOne(NAMESPACE+".findProduct", vo.getProduct()));
		
		return vo;
	}



	@Override
	public void insertRequest(RequestVO vo) throws Exception {
		logger.debug("DAO 수주 등록하기 insertRequest(RequestVO vo) : "+vo);
		
		sqlSession.insert(NAMESPACE+".insertRequest", vo);
	}
	
	//----- add 용 검색 ----

	@Override
	public List<RequestVO> getClientList() throws Exception {
		logger.debug("DAO 회사리스트뽑기 getClientList() ");
		return sqlSession.selectList(NAMESPACE+".getClientList");
	}

	@Override
	public List<RequestVO> searchClient(String client_code, String clientName) throws Exception {
		logger.debug("DAO 회사검색하기 searchClient(String client_code, String clientName) : "+client_code + clientName);

		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("client_code", client_code);
		paramMap.put("clientName", clientName);
		
		return sqlSession.selectList(NAMESPACE+".findCompany", paramMap);
	}



	@Override
	public List<RequestVO> getProductList() throws Exception {
		logger.debug("DAO 물품리스트 가져오기 getProductList()");
		return sqlSession.selectList(NAMESPACE+".getProductList");
	}



	@Override
	public List<RequestVO> searchProduct(RequestSearchVO vo) throws Exception {
		logger.debug("DAO 품목검색하기 searchProduct(RequestSearchVO vo) : "+vo);
		
		return sqlSession.selectList(NAMESPACE+".findProduct", vo);

	}



	@Override
	public List<RequestVO> getManagerList() throws Exception {
		logger.debug("DAO 사원리스트 가져오기 getManagerList()");
		return sqlSession.selectList(NAMESPACE+".getManagerList");
	}



	@Override
	public List<RequestVO> searchManager(RequestSearchVO vo) throws Exception {
		logger.debug("DAO 사원검색하기 searchManager(RequestSearchVO vo) : "+vo);
		
		return sqlSession.selectList(NAMESPACE+".findManager", vo);

	}
	//----- add 용 검색 ----

	

	
	
	
	
}
