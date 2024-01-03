package com.itwillbs.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.RequestVO;
import com.itwillbs.domain.ShipmentVO;

@Repository
public class ShipmentDAOImpl implements ShipmentDAO {
	private static final Logger logger = LoggerFactory.getLogger(ShipmentDAOImpl.class);
	
	private static final String NAMESPACE="com.itwillbs.mapper.shipmentMapper";
	
	@Inject
	private SqlSession sqlSession;

	@Override
	public List<ShipmentVO> getShipmentListPage(Criteria cri) throws Exception {
		logger.debug("DAO 페이징 처리 getRequestListPage(Criteria cri) + "+ cri);

		return sqlSession.selectList(NAMESPACE+".listPage", cri);
	}
	
	@Override
	public List<ShipmentVO> getShipmentListPage(int page) throws Exception {
		// 페이징 처리 계산
		// page 1 => 1 ~ 10   => limit 0, 10 이라고 해야함
		// page 2 => 11 ~ 20  => limit 10, 10
		// page 3 => 21 ~ 30  => limit 20, 10		return null;
		
		page = (page-1)*10;
		return sqlSession.selectList(NAMESPACE+".listPage",page);
	}
	
	@Override
	public int getShipmentCount() throws Exception {
		logger.debug("DAO getShipmentCount()");
		return sqlSession.selectOne(NAMESPACE+".countShipment");

	}




	@Override
	public List<ShipmentVO> getShipmentListAll() throws Exception {
		logger.debug("DAO 수주정보리스트 getShipmentListAll() ");
		return sqlSession.selectList(NAMESPACE+".getShipmentList");
	}
	
	

	@Override
	public ShipmentVO getShipmentDetail(String code) throws Exception {
		logger.debug("DAO 수주정보 자세히보기 getShipmentDetail(String code) "+code);
		ShipmentVO vo = sqlSession.selectOne(NAMESPACE+".getShipmentInfo", code);
		
		logger.debug("vo : "+vo);
		return vo;
	}



	@Override
	public void insertShipment(ShipmentVO vo) throws Exception {
		logger.debug("DAO 수주 등록하기 insertShipment(ShipmentVO vo) : "+vo);
		// 여기 아이디도 추가해야함(등록자 아이디)
		sqlSession.insert(NAMESPACE+".insertShipment", vo);
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
	public List<RequestVO> searchProduct(String product, String productName) throws Exception {
		logger.debug("DAO 품목검색하기 searchProduct(RequestVO vo) : "+product+productName);
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("product", product);
		paramMap.put("productName", productName);
		
		return sqlSession.selectList(NAMESPACE+".findProduct", paramMap);

	}
	
	@Override
	public List<RequestVO> getRequestList() throws Exception {
		// 수주정보 가져오기 ( 수주코드, 수주일자, 품명, 수주량)
		logger.debug("getRequestList() 수주정보 가져오기 ( 수주코드, 수주일자, 품명, 수주량)");
		return sqlSession.selectList(NAMESPACE+".getRequestList");
	}
	
	@Override
	public List<RequestVO> searchRequest(String clientName, String productName) throws Exception {
		// 검색(회사명, 품명)
		logger.debug("searchRequest(String code, String productName) 회사명: "+clientName+", 품명 :"+productName);
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("clientName", clientName);
		paramMap.put("productName", productName);
		return sqlSession.selectList(NAMESPACE+".findRequest", paramMap);
	}
	

	//----- add 용 검색 ----

	

	@Override
	public void shipmentUpdate(ShipmentVO vo, String id) throws Exception {
		logger.debug("DAO  ShipmentUpdate(ShipmentVO vo, String id)");
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("userid", id);
		paramMap.put("vo", vo);
		sqlSession.update(NAMESPACE+".updateShipmentInfo", paramMap);
	}



	@Override
	public List<ShipmentVO> searchShipmentAll(ShipmentVO vo) throws Exception {
		// 수주 검색
		logger.debug("DAO searchShipmentAll(ShipmentVO vo)"+vo);
		// 여기에 페이지 Criteria 추가해야함
		
		List list = sqlSession.selectList(NAMESPACE+".research", vo);
		logger.debug("list : "+list);
		return list;
	}



	@Override
	public List<ShipmentVO> getShipmentDetail(String[] code) throws Exception{
		logger.debug("DAO  삭제용 정보찾기");
		Map<String, Object> params = new HashMap<>();
	    params.put("code", code);
	    List vo = sqlSession.selectList(NAMESPACE+".getDeleteInfo", params);		
	    return vo;
	}



	@Override
	public void deleteShipment(String[] code) throws Exception {
		logger.debug("DAO 디비에서 데이터 삭제하기");
		Map<String, Object> params = new HashMap<>();
	    params.put("code", code);
	    List vo = sqlSession.selectList(NAMESPACE+".deleteShipmentData", params);		
	}
	
	
}
