package com.itwillbs.persistence;

import java.util.ArrayList;
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
		logger.debug("DAO 출하정보리스트 getShipmentListAll() ");
		return sqlSession.selectList(NAMESPACE+".getShipmentList");
	}
	
	

	@Override
	public ShipmentVO getShipmentDetail(String code) throws Exception {
		logger.debug("DAO 출하정보 자세히보기 getShipmentDetail(String code) "+code);
		ShipmentVO vo = sqlSession.selectOne(NAMESPACE+".getShipmentInfo", code);
		
		logger.debug("vo : "+vo);
		return vo;
	}



	@Override
	public String getRecentCode(String code) throws Exception {
		String result =  code.substring(0, code.length()-3);
		return sqlSession.selectOne(NAMESPACE+".getRecentCode", result);
	}
	
	@Override
	public String getRecentHistory(String vocode) throws Exception {
		logger.debug("입출고테이블에서 출고 코드 찾기~~~~~~~~~!");
		return sqlSession.selectOne(NAMESPACE+".getRecentHistory", vocode);
	}
	

	@Override
	public int insertShipment(ShipmentVO vo) throws Exception {
		logger.debug("@@@ DAO 출하 등록하기 insertShipment(ShipmentVO vo) : "+vo);
		// 여기 아이디도 추가해야함(등록자 아이디)
		int result = sqlSession.insert(NAMESPACE+".insertShipment", vo);
		
		// 추가했을 때 수주상태를 변경해야함!
		String request = vo.getReqs_code();	// 수주번호
		String shipment = vo.getCode(); // 출하번호
		
		sqlSession.update(NAMESPACE+".updateRequestStatus",request);
		
		if(result == 1) {
			// 출하량
			int shipmentAmount = vo.getAmount();
			
			Map<String, Object> params = new HashMap<String, Object>();
			params.put("vo", vo);
			
			// 사용한 LOT 모아두는 리스트
			List<String> usedLOTList = new ArrayList();
			// 사용한 LOT
			String usedLOT = null;
			String orderNum = "";
			int lotIndex = 0;
			
			List<HashMap<String, Object>> lotGetList = sqlSession.selectList(NAMESPACE+".getLOT", params);
			
			 // 출하량이 0보다 클 동안 반복
				while (shipmentAmount > 0 && lotIndex < lotGetList.size()) {
			    	// 사용가능한 LOT 번호, 지금 수량을 얻을 수 잇음
			    	
					HashMap<String, Object> lot = lotGetList.get(lotIndex);
			             int total = (int)lot.get("Total");
			             String lotNumber = (String)lot.get("lot");

			             if (total <= shipmentAmount) { // 출하량이 수량보다 많을 때
			                 //1. 입출고 기록에서 출고기록 남기기(lot / 출하번호)
			            	 orderNum = lotNumber+"/"+shipment;
			            	 params.put("order_num", orderNum);
			            	 params.put("total",total);
			            	 
			            	 sqlSession.insert(NAMESPACE+".insertHistory", params);
			            	 
			            	 //2. 재고테이블에 amount total만큼 빼기
			            	 sqlSession.update(NAMESPACE+".updateStockForInsert", params);
			       
			            	 //3. lot 테이블에 insert 하기
			            	 params.put("lot",lotNumber);
			            	 sqlSession.insert(NAMESPACE+".insertLOT", params);
			            	 
			            	 // 4. 
			                 shipmentAmount -= total;
			             } else {
			                 // total이 출하량보다 크면, 해당 LOT에서 출하량만큼만 사용
			                 
			            	 orderNum = lotNumber+"/"+shipment;
			            	 params.put("order_num", orderNum);
			            	 params.put("total",shipmentAmount);
			            	 
			            	 sqlSession.insert(NAMESPACE+".insertHistory", params);
			            	 sqlSession.update(NAMESPACE+".updateStockForInsert", params);
			            	 params.put("lot",lotNumber);
			            	 sqlSession.insert(NAMESPACE+".insertLOT", params);
			            	 
			            	 shipmentAmount = 0;     				                 
			             }			        
			             lotIndex++;
			    	 }// while문 끝
				
				
		}// insert 성공했을 시 끝
		
		return result;
		
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
	public List<RequestVO> getRequestList(Criteria cri) throws Exception {
		// 수주정보 가져오기 ( 수주코드, 수주일자, 품명, 수주량)
		logger.debug("getRequestList() 수주정보 가져오기 ( 수주코드, 수주일자, 품명, 수주량)");
		return sqlSession.selectList(NAMESPACE+".getRequestList",cri);
	}
	
	
	
	@Override
	public int getRequestTotal(String clientName, String productName) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("clientName", clientName);
		paramMap.put("productName", productName);
		return sqlSession.selectOne(NAMESPACE+".getRequestCount", paramMap);
	}

	@Override
	public List<RequestVO> searchRequest(String clientName, String productName,Criteria cri) throws Exception {
		// 검색(회사명, 품명)
		logger.debug("searchRequest(String code, String productName) 회사명: "+clientName+", 품명 :"+productName);
		Map<String,Object> paramMap = new HashMap<String, Object>();
		paramMap.put("clientName", clientName);
		paramMap.put("productName", productName);
		paramMap.put("cri",cri);
		return sqlSession.selectList(NAMESPACE+".findRequest", paramMap);
	}
	

	//----- add 용 검색 ----

	

	@Override
	public int shipmentUpdate(ShipmentVO vo, String id) throws Exception {
		logger.debug("DAO  ShipmentUpdate(ShipmentVO vo, String id)");
		// 출하정보 수정할때
		// 1. 기존 수주정보의 수주상태를 다시 등록으로 변경한다
		//  + 입출고 기록에서 출하번호가 들어가있는 데이터를 찾아 출고량을 찾기
		//  + 출고량을 찾은 뒤 출하번호가 들어가있는 데이터 전부 지우기(입출고 기록,LOT)
		//  + 출고량만큼 STOCK에 더해서 update하기
		// 2. 출하정보를 업데이트 한다
		// 3. 해당하는 수주번호의 수주상태를 "출하대기"로 변경한다
		String code = vo.getCode();
		
		// 기존 출하정보 얻기
		ShipmentVO check = sqlSession.selectOne(NAMESPACE+".getShipmentInfo", code);
		
		Map<String, Object> singleValueParams = new HashMap<>();
		singleValueParams.put("shipment", vo);
		
		
		
		String request = check.getReqs_code();
		String newReqs = vo.getReqs_code();
		if(!request.equals(newReqs)) {
			// 기존 수주코드와 새로 입력된 수주코드가 일치하지 않으면 수주상태를 등록으로 변경
			sqlSession.update(NAMESPACE+".updateBeforeUpdate", request);
			
			//  + 출고량만큼 STOCK에 더해서 update하기
			sqlSession.update(NAMESPACE+".updateStockForUpdate", singleValueParams);
			
			// lot 테이블 데이터 지우기
			sqlSession.delete(NAMESPACE+".deleteLOTUpdate", singleValueParams);
			
			// 입출고기록 지우기
			sqlSession.delete(NAMESPACE+".deleteHistoryUpdate", singleValueParams);
			
			String reqs_code = vo.getReqs_code();	// 수주번호
			String shipment = vo.getCode(); // 출하번호
			
			// LOT 번호 가져오기
			Map<String, Object> params = new HashMap<>();
			params.put("shipment", shipment);
			params.put("request",reqs_code);
			params.put("vo",vo);
			
			//LOT 번호 가져오기
			List<String> lotList = sqlSession.selectList(NAMESPACE+".getLOT", params);
			logger.debug("List"+lotList);
			
			//LOT 테이블에 insert (지금 code를 TEST라고 대충 해놨는데 이거 어케하지... 종헌씨한테 물어보기)
			params.put("lot",lotList);
			sqlSession.insert(NAMESPACE+".insertLOT", params);

			// 창고입출고내역 남기기 (이부분 효린씨랑 맞추기)
			// 효린씨 가 만든 코드 확인해보기. 안되면 그냥 내가 code 작성하는걸로
			List<String> historyLotList = new ArrayList<>();

			for(String lot : lotList) {
				historyLotList.add(lot +"/"+vo.getWareHistory_code());
			}
			params.put("history", historyLotList);
			sqlSession.insert(NAMESPACE+".insertWarehouseHistory", params);

			// stock에서 빼기
			sqlSession.update(NAMESPACE+".updateStockForInsert", params);
		}
		
		String prevStatus = check.getStatus(); // 이전상태
		String newStatus = vo.getStatus(); //수정할 상태
		if(request.equals(newReqs)) {
			// 수주코드의 변경이 없을 때 출하상태의 변경이 있을 경우(출하완료 -> 출하등록)
			if(prevStatus.equals("출하완료") && !prevStatus.equals(newStatus)) {
				sqlSession.update(NAMESPACE+".updateBeforeUpdate2", request);
			}
		}
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("userid", id);
		paramMap.put("vo", vo);
		return sqlSession.update(NAMESPACE+".updateShipmentInfo", paramMap);
	}



	@Override
	public List<ShipmentVO> searchShipmentAll(ShipmentVO vo) throws Exception {
		// 출하 검색
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
	public int deleteShipment(String[] code) throws Exception {
		logger.debug("DAO 디비에서 데이터 삭제하기");
		// 삭제를 하고 수주 상태를 "등록"으로 변경해야함!
		int result = 0;
		
		
		Map<String, Object> params = new HashMap<>();
	    params.put("code", code);
		
		// lot 테이블 데이터 지우기
		sqlSession.delete(NAMESPACE+".deleteLOTUpdate", params);
		
		// 입출고기록 지우기
		sqlSession.delete(NAMESPACE+".deleteHistoryUpdate", params);
	    
	    // 출하정보 가져오기
	    List vo = sqlSession.selectList(NAMESPACE+".getShipmentInfoList", params);
	    params.put("shipment",vo);
	    
	    //  + 출고량만큼 STOCK에 더해서 update하기
	    sqlSession.update(NAMESPACE+".updateStockForUpdate", params);
	    
	    // 수주상태 변경
	    result = sqlSession.update(NAMESPACE+".updateStatusBeforeDelete", params);
	    
	    if(result >= 1) {
	    	result = 0;
	    	result = sqlSession.delete(NAMESPACE+".deleteShipmentData", params);
	    }
	    
	    return result;
	}

	
	@Override
	public int updateStatusToDone(String[] code) throws Exception {
		logger.debug("출하상태 수주상태 출하완료로 변경하기");
		Map<String, Object> params = new HashMap<>();
	    params.put("code", code);
	    
	    int result=	sqlSession.update(NAMESPACE+".updateStatusToRequest", params);
	    result=	sqlSession.update(NAMESPACE+".updateStatusToShipment", params);
	    return result;
	}

	@Override
	public List<ShipmentVO> getinfoList(String[] codeArr) throws Exception {
		logger.debug("프린트하기~~ 출하정보 가져오기!!!!!");
		Map<String, Object> params = new HashMap<>();
	    params.put("code", codeArr);
		return sqlSession.selectList(NAMESPACE+".getShipmentInfoList",params);
	}

	@Override
	public List<RequestVO> getinfoRequest(List<String> reqsArr) throws Exception {
		logger.debug("프린트하기~~ 수주정보 가져오기!!!!!");
		Map<String, Object> params = new HashMap<>();
		params.put("code", reqsArr);
		return sqlSession.selectList(NAMESPACE+".getRequestInfoList", params);
	}

	@Override
	public int receiptToClient(String[] code) throws Exception {
		logger.debug("큐알코드 처리하기~~~ 수주번호를 가져왔다~~@!@"+code);
		Map<String, Object> params = new HashMap<>();
		params.put("code", code);
		return sqlSession.update(NAMESPACE+".receiptToClient", params);
	}

	@Override
	public int actDoneShipment(String[] code) throws Exception {
		Map<String, Object> params = new HashMap<>();
		params.put("code", code);
		return sqlSession.update(NAMESPACE+".updateStatusToShipment",code);
	}

	
	
	
	
}
