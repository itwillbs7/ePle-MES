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
	
	private static final String NAMESPACE="com.itwillbs.mapper.requestMapper";
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<RequestVO> getRequestListPage(Criteria cri) throws Exception {
		logger.debug("DAO 페이징 처리 getRequestListPage(Criteria cri) + "+ cri);
		
		
		return sqlSession.selectList(NAMESPACE+".listPage", cri);

	}



	@Override
	public List<RequestVO> getRequestListPage(int page) throws Exception {
		// 페이징 처리 계산
		// page 1 => 1 ~ 10   => limit 0, 10 이라고 해야함
		// page 2 => 11 ~ 20  => limit 10, 10
		// page 3 => 21 ~ 30  => limit 20, 10		return null;
		
		page = (page-1)*10;
		return sqlSession.selectList(NAMESPACE+".listPage",page);
	}



	@Override
	public int getRequestCount() throws Exception {
		logger.debug("DAO getRequestCount()");
		return sqlSession.selectOne(NAMESPACE+".countRequest");

	}



	@Override
	public List<RequestVO> getRequestListAll() throws Exception {
		logger.debug("DAO 수주정보리스트 getRequestListAll() ");
		return sqlSession.selectList(NAMESPACE+".getRequestList");
	}
	
	

	@Override
	public RequestVO getRequestDetail(String code) throws Exception {
		logger.debug("DAO 수주정보 자세히보기 getRequestDetail(String code) "+code);
		RequestVO vo = sqlSession.selectOne(NAMESPACE+".getRequestInfo", code);
		
		// 업체명, 상품명, 담당자명 가져와야함
		RequestVO wait = sqlSession.selectOne(NAMESPACE+".getNameForInfo", code);
		vo.setClientName(wait.getClientName());
		vo.setProductName(wait.getProductName());
		vo.setManagerName(wait.getManagerName());
		logger.debug("vo : "+vo);
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
	public List<RequestVO> getManagerList() throws Exception {
		logger.debug("DAO 사원리스트 가져오기 getManagerList()");
		
		return sqlSession.selectList(NAMESPACE+".getManagerList");
	}



	@Override
	public List<RequestVO> searchManager(String manager, String managerName) throws Exception {
		logger.debug("DAO 사원검색하기 searchManager(String manager, String managerName) : "+manager+managerName);
		
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("manager", manager);
		paramMap.put("managerName", managerName);
		
		return sqlSession.selectList(NAMESPACE+".findManager", paramMap);

	}


	@Override
	public List<RequestVO> getProductList() throws Exception {
		logger.debug("DAO 물품리스트 가져오기 getProductList()");
		
		return sqlSession.selectList(NAMESPACE+".getProductList");
	}



	@Override
	public List<RequestVO> searchProduct(String product, String productName) throws Exception {
		logger.debug("DAO 품목검색하기 searchProduct(RequestSearchVO vo) : "+product+productName);
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("product", product);
		paramMap.put("productName", productName);
		
		return sqlSession.selectList(NAMESPACE+".findProduct", paramMap);

	}

	//----- add 용 검색 ----

	
	@Override
	public void requestUpdate(RequestVO vo, String id) throws Exception {
		logger.debug("DAO  requestUpdate(RequestVO vo, String id)");
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("userid", id);
		paramMap.put("vo", vo);
		sqlSession.update(NAMESPACE+".updateRequestInfo", paramMap);
	}



	@Override
	public List<RequestVO> searchRequestAll(RequestVO vo) throws Exception {
		// 수주 검색
		logger.debug("DAO searchRequestAll(RequestVO vo)"+vo);
		
		// 수주일자 날짜 형식 바꾸기
		if(vo.getDate() != null && !vo.getDate().isEmpty()){
			String[] dates = vo.getDate().split("-");
			vo.setStartDate(vo.getNewStartDate(dates[0]));
			if(dates.length > 1) {
				vo.setEndDate(vo.getNewEndDate(dates[1]));				
			}
		}
		
		// 납품예정일 날짜 형식 바꾸기
		if(vo.getDeadline() != null && !vo.getDeadline().isEmpty()) {
			String[] deadlines = vo.getDeadline().split("-");
			vo.setStartDead(vo.getNewStartDate(deadlines[0]));
			if(deadlines.length >1) {
				vo.setEndDead(vo.getNewEndDate(deadlines[1]));					
			}
		}
		
		logger.debug(""+vo.getStatusList());
		logger.debug(""+vo.getStartDate());
		logger.debug(""+vo.getStartDead());
		
		List list = sqlSession.selectList(NAMESPACE+".research", vo);
		logger.debug("list : "+list);
		return list;
	}
	

	
	
	
	
}
