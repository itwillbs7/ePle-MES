package com.itwillbs.service;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.RequestVO;
import com.itwillbs.domain.ShipmentVO;
import com.itwillbs.persistence.ShipmentDAO;

@Service
public class ShipmentServiceImpl implements ShipmentService {

	
	private static final Logger logger = LoggerFactory.getLogger(ShipmentServiceImpl.class);
	
	@Inject
	private ShipmentDAO sdao;

	@Override
	public List<ShipmentVO> shipmentListpage(ShipmentVO vo,Criteria cri) throws Exception {
		logger.debug("페이징처리하기 "+cri);

		return sdao.getShipmentListPage(vo, cri);
	}
	

	@Override
	public int getTotal(ShipmentVO vo) throws Exception {
		logger.debug("servide : getTotal()");
		return sdao.getShipmentCount(vo);
	}



	@Override
	public List<ShipmentVO> shipmentList() throws Exception {
		logger.debug("Service : requestList()");
		return sdao.getShipmentListAll();
	}
	
	@Override
	public ShipmentVO getinfo(String code) throws Exception {
		logger.debug("Service : getinfo(String code)"+code);
		return sdao.getShipmentDetail(code);
	}
	
	

	@Override
	public String getRecentCode(String vocode) throws Exception {
		
		return sdao.getRecentCode(vocode);
	}
	
	@Override
	public String getRecentHistory(String vocode) throws Exception {
		logger.debug("입출고테이블에서 출고 데이터 찾기~~~~~~~");
		return sdao.getRecentHistory(vocode);
	}


	@Override
	public int dataInsertShipment(ShipmentVO vo) throws Exception {
		logger.debug("Service : dataInsertShipment(ShipmentVO vo) : "+vo);
		int result = 0;
		result = sdao.insertShipment(vo);
		
		// 추가했을 때 수주상태를 변경해야함!
		String request = vo.getReqs_code();	// 수주번호
		String shipment = vo.getCode(); // 출하번
		
		result = sdao.updateRequestStatus(request);
		
		if(result >= 1) {
			int shipmentAmount = vo.getAmount();
				
				Map<String, Object> params = new HashMap<String, Object>();
				params.put("vo", vo);
				
				String orderNum = "";
				int lotIndex = 0;
				
				List<HashMap<String, Object>> lotGetList = sdao.getLOTList(params);
					
					while (shipmentAmount > 0 && lotIndex < lotGetList.size()) {
				    	
						HashMap<String, Object> lot = lotGetList.get(lotIndex);
						BigDecimal totalBigDecimal = (BigDecimal) lot.get("Total");
						int total = totalBigDecimal.intValue();
						String lotNumber = (String)lot.get("lot");

				             if ((total <= shipmentAmount) && shipmentAmount != 0) { // 출하량이 특정 lot의 수량보다 많을 때
				                 //1. 입출고 기록에서 출고기록 남기기(lot / 출하번호)
				            	 logger.debug("LOTNUMBER"+lotNumber);
				            	 orderNum = lotNumber+"/"+shipment;
				            	 params.put("order_num", orderNum);
				            	 params.put("total",total);
				            	 
				            	 // 입출고 기록 넣기
				            	int success = sdao.insertHistory(params);

				            	// material 정보 가져오기
				            	String material = sdao.getMaterail(lotNumber);
				            			 
				            	logger.debug("######materrial"+material);

				            	logger.debug("============================== 여기까지 lot 번호랑 material 얻어옴");
				            	 //3. lot 테이블에 insert 하기
				            	 params.put("lot",lotNumber);
				            	 params.put("material",material);
				            	 success = sdao.insertLOT(params);
				            	 
				            	 logger.debug("============================== 여기까지 lot테이블에 등록함 얻어옴");
				            	 // 4. 
				            	 // 사용가능한 LOT 번호, 지금 수량을 얻을 수 잇음
				            	 String voHistory = vo.getWareHistory_code();
				            	 logger.debug("================== 지금 출고코드 "+voHistory);
				            	 // 마지막 3자리 숫자 추출
				            		 String lastFourNums = voHistory.substring(voHistory.length()-3);
				            		 // 숫자로 변환 후 1 증가
				            		 int increasedNum = Integer.parseInt(lastFourNums) + 1;
				            		 // 다시 문자열로 변환
				            		 String newLastFourNums = String.format("%03d", increasedNum);
				            		 // 마지막 3자리 숫자를 증가시킨 숫자로 대체
				            		 voHistory = voHistory.substring(0, voHistory.length()-3) + newLastFourNums;
				            		 vo.setWareHistory_code(voHistory);
				            		 params.put("vo", vo);
				            	 
				                 shipmentAmount -= total;
				             } else if(shipmentAmount != 0) {
				                 // total이 출하량보다 크면, 해당 LOT에서 출하량만큼만 사용
				                 
				            	 orderNum = lotNumber+"/"+shipment;
				            	 params.put("order_num", orderNum);
				            	 params.put("total",shipmentAmount);
				            	 
				            	 int success = sdao.insertHistory(params);
				            	 
					            String material = sdao.getMaterail(lotNumber);

					             params.put("lot",lotNumber);
				            	 params.put("material",material);
				            	 success = sdao.insertLOT(params);
				            	 
				            	 shipmentAmount = 0;     				                 
				             }			        
				             lotIndex++;
		}
				    	 }// while문 끝
		return result;
	}
					
			
	//========================================= add /search 용
	

	

	@Override
	public List<RequestVO> RequestList(Criteria cri) throws Exception {
		logger.debug("RequestList() 수주목록 가져오기");
		return sdao.getRequestList(cri);
	}
	



	@Override
	public int getRequestTotal(String clientName, String productName) {
		// TODO Auto-generated method stub
		return sdao.getRequestTotal(clientName, productName);
	}


	@Override
	public List<RequestVO> findRequest(String clientName, String productName, Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sdao.searchRequest(clientName, productName, cri);
	}


	//========================================= add /search 용
	@Override
	public int updateShipment(ShipmentVO vo, String id) throws Exception {
		// 수정
		logger.debug("Service : updateShipment(ShipmentVO vo, String id) 수정");
		return sdao.shipmentUpdate(vo,id);
	}



	@Override
	public List<ShipmentVO> findShipmentList(ShipmentVO vo) throws Exception {
		// 수주 검색
		logger.debug("Service : findRequestList(RequestVO vo) 수주 검색");
		return sdao.searchShipmentAll(vo);
	}



	@Override
	public List<ShipmentVO> getinfo(String[] code) throws Exception {
		logger.debug("Service : getinfo(String[] code) 삭제 데이터 ");
		return sdao.getShipmentDetail(code);
	}



	@Override
	public int deleteShipment(String[] code) throws Exception {
		logger.debug("Service : deleteShipment(String[] code) 데이터 삭제");
		return sdao.deleteShipment(code);
	}


	


	@Override
	public int changeStatus(String[] code) throws Exception {
		logger.debug("출하상태 수주상태 변경하기");
		return sdao.updateStatusToDone(code);
	}


	@Override
	public List<ShipmentVO> getinfoList(String[] codeArr) throws Exception {
		logger.debug("프린트하기~~~ 출하정보 가져오기!");
		return sdao.getinfoList(codeArr);
	}


	@Override
	public List<RequestVO> getinfoRequest(List<String> reqsArr) throws Exception {
		logger.debug("프린트하기~~~ 수주정보 가져오기!");
		return sdao.getinfoRequest( reqsArr);
	}


	@Override
	public int receiptToClient(String[] code) throws Exception {
		logger.debug("고객님이 큐알을 찍으셨다네~~~~ 이건 수주번호~~"+code);
		return sdao.receiptToClient(code);
	}


	@Override
	public int actDoneShipment(String[] code) throws Exception {
		logger.debug("출하완료~~~~ 이건 출하번호~~"+code);
		
		return sdao.actDoneShipment(code);
	}



	
	
	
	
}
