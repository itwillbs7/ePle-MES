package com.itwillbs.persistence;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.RequestSearchVO;
import com.itwillbs.domain.RequestVO;

@Repository
public class RequestDAOImpl implements RequestDAO {

	private static final Logger logger = LoggerFactory.getLogger(RequestDAOImpl.class);

	private static final String NAMESPACE = "com.itwillbs.mapper.requestMapper";
	@Inject
	private SqlSession sqlSession;

	@Override
	public List<RequestVO> getRequestListPage(RequestVO vo, Criteria cri) throws Exception {
		logger.debug("DAO 페이징 처리 getRequestListPage(Criteria cri) + " + cri);
		logger.debug(" ++++++++++ vo " + vo);

		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("cri", cri);
		paramMap.put("vo", vo);

		List<RequestVO> list = new ArrayList<RequestVO>();

		
		list = sqlSession.selectList(NAMESPACE + ".research", paramMap);
		
		return list;

	}

	@Override
	public int getRequestCount(RequestVO vo) throws Exception {
		logger.debug("DAO getRequestCount()");
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("vo", vo);
		int result = 0;
		if (paramMap.get("vo") == null) {
			result = sqlSession.selectOne(NAMESPACE + ".countRequest");
		} else {
			result = sqlSession.selectOne(NAMESPACE + ".countSearch", paramMap);
		}
		return result;

	}

	@Override
	public List<RequestVO> requestListpage(Criteria cri) throws Exception {
		
		return sqlSession.selectList(NAMESPACE + ".listPage", cri);
	}

	@Override
	public int getTotal() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+".countRequest");
	}

	@Override
	public List<RequestVO> getRequestListAll() throws Exception {
		logger.debug("DAO 수주정보리스트 getRequestListAll() ");
		return sqlSession.selectList(NAMESPACE + ".getRequestList");
	}

	@Override
	public RequestVO getRequestDetail(String code) throws Exception {
		logger.debug("DAO 수주정보 자세히보기 getRequestDetail(String code) " + code);
		RequestVO vo = sqlSession.selectOne(NAMESPACE + ".getRequestInfo", code);
		
		String manager = vo.getManager();
		
		vo.setManagerName(sqlSession.selectOne(NAMESPACE+".getManagerName", manager));
		
		logger.debug("@@@@@@@@@@@@@@"+vo.getManagerName());

		logger.debug("vo : " + vo);
		return vo;
	}

	@Override
	public String getRecentCode(String code) throws Exception {
		logger.debug("수주 번호 찾기");
		String result = code.substring(0, code.length() - 3);
		logger.debug("#@@@@@@@@@@@@@@@@@@@@@@@@" + result);
		return sqlSession.selectOne(NAMESPACE + ".getRecentCode", result);
	}

	@Override
	public int insertRequest(RequestVO vo) throws Exception {
		logger.debug("DAO 수주 등록하기 insertRequest(RequestVO vo) : " + vo);

		return sqlSession.insert(NAMESPACE + ".insertRequest", vo);
	}

	// ------------------------------------------------------------------------------
	// add 용 검색 ----

	@Override
	public List<RequestVO> getClientList(Criteria cri) throws Exception {
		logger.debug("DAO 회사리스트뽑기 getClientList() ");
		return sqlSession.selectList(NAMESPACE + ".getClientList", cri);
	}

	@Override
	public List<RequestVO> searchClient(String client_code, String clientName,Criteria cri) throws Exception {
		logger.debug("DAO 회사검색하기 searchClient(String client_code, String clientName) : " + client_code + clientName);

		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("cri", cri);
		paramMap.put("client_code", client_code);
		paramMap.put("clientName", clientName);

		return sqlSession.selectList(NAMESPACE + ".findCompany", paramMap);
	}

	@Override
	public int getClientTotal() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+".getClientCount");
	}

	@Override
	public int getClientTotal(String client_code, String clientName) throws Exception {
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("client_code", client_code);
		paramMap.put("clientName", clientName);
		
		return sqlSession.selectOne(NAMESPACE+".getClientCount",paramMap);
	}

	@Override
	public List<RequestVO> getManagerList(Criteria cri) throws Exception {
		logger.debug("DAO 사원리스트 가져오기 getManagerList()");

		return sqlSession.selectList(NAMESPACE + ".getManagerList", cri);
	}
	
	@Override
	public int getManagerTotal() throws Exception {
		
		return sqlSession.selectOne(NAMESPACE + ".getManagerCount");
	}

	@Override
	public int getManagerTotal(String manager, String managerName) throws Exception {
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("manager", manager);
		paramMap.put("managerName", managerName);

		return sqlSession.selectOne(NAMESPACE + ".getManagerCount",paramMap);
	}
	
	@Override
	public List<RequestVO> searchManager(String manager, String managerName,Criteria cri) throws Exception {
		logger.debug("DAO 사원검색하기 searchManager(String manager, String managerName) : " + manager + managerName);

		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("cri", cri);
		paramMap.put("manager", manager);
		paramMap.put("managerName", managerName);

		return sqlSession.selectList(NAMESPACE + ".findManager", paramMap);

	}

	@Override
	public List<RequestVO> getProductList(Criteria cri) throws Exception {
		logger.debug("DAO 물품리스트 가져오기 getProductList()");

		return sqlSession.selectList(NAMESPACE + ".getProductList", cri);
	}
	
	@Override
	public int getProductTotal() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE + ".getProductCount");
	}

	@Override
	public int etProductTotal(String product, String productName) throws Exception {
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("product", product);
		paramMap.put("productName", productName);
		
		return sqlSession.selectOne(NAMESPACE + ".getProductCount",paramMap);
	}

	@Override
	public List<RequestVO> searchProduct(String product, String productName,Criteria cri) throws Exception {
		logger.debug("DAO 품목검색하기 searchProduct(RequestSearchVO vo) : " + product + productName);
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("cri", cri);
		paramMap.put("product", product);
		paramMap.put("productName", productName);

		return sqlSession.selectList(NAMESPACE + ".findProduct", paramMap);
	}

	// --------------------------------------------------------------------------------------
	// add 용 검색 ----

	@Override
	public int requestUpdate(RequestVO vo, String id) throws Exception {
		logger.debug("DAO  requestUpdate(RequestVO vo, String id)");

		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("userid", id);
		paramMap.put("vo", vo);
		return sqlSession.update(NAMESPACE + ".updateRequestInfo", paramMap);
	}

	@Override
	public List<RequestVO> searchRequestAll(RequestVO vo, Criteria cri) throws Exception {
		// 수주 검색
		logger.debug("DAO searchRequestAll(RequestVO vo)" + vo);
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("cri", cri);
		paramMap.put("vo", vo);

		List list = sqlSession.selectList(NAMESPACE + ".research", paramMap);
		logger.debug("list : " + list);
		return list;
	}

	@Override
	public List<RequestVO> getRequestDetail(String[] code) throws Exception {
		logger.debug("DAO  삭제용 정보찾기");
		Map<String, Object> params = new HashMap<>();
		params.put("code", code);
		List vo = sqlSession.selectList(NAMESPACE + ".getDeleteInfo", params);
		return vo;
	}

	@Override
	public int deleteRequest(String[] code) throws Exception {
		logger.debug("DAO 디비에서 데이터 삭제하기");
		Map<String, Object> params = new HashMap<>();
		params.put("code", code);
		return sqlSession.delete(NAMESPACE + ".deleteRequestData", params);
	}

}
