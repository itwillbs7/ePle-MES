package com.itwillbs.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.RequestVO;
import com.itwillbs.domain.ShipmentVO;

public interface ShipmentDAO {

	public List<ShipmentVO> getShipmentListPage(ShipmentVO vo, Criteria cri)throws Exception;


	public int getShipmentCount(ShipmentVO vo) throws Exception;

	public List<ShipmentVO> getShipmentListAll() throws Exception;

	public ShipmentVO getShipmentDetail(String code) throws Exception;

	public int insertShipment(ShipmentVO vo) throws Exception;

	// ================ add / search 용 ========================
	
	//수주 가져오기
	public List<RequestVO> getRequestList(Criteria cri)throws Exception;
	
	public List<RequestVO> searchRequest(String clientName, String productName, Criteria cri)throws Exception;
	
	
	//================= ============================================
	public int shipmentUpdate(ShipmentVO vo, String id) throws Exception;

	public List<ShipmentVO> searchShipmentAll(ShipmentVO vo) throws Exception;

	public List<ShipmentVO> getShipmentDetail(String[] code) throws Exception;

	public int deleteShipment(String[] code) throws Exception;

	public int updateStatusToDone(String[] code)throws Exception;

	public String getRecentCode(String vocode)throws Exception;

	public List<ShipmentVO> getinfoList(String[] codeArr)throws Exception;

	public List<RequestVO> getinfoRequest(List<String> reqsArr)throws Exception;

	public String getRecentHistory(String vocode)throws Exception;

	public int receiptToClient(String[] code)throws Exception;

	public int actDoneShipment(String[] code)throws Exception;

	public int getRequestTotal(String clientName, String productName);


	public int updateRequestStatus(String request)throws Exception;


	public List<HashMap<String, Object>> getLOTList(Map<String, Object> params)throws Exception;


	public int insertHistory(Map<String, Object> params)throws Exception;


	public String getMaterail(String lotNumber)throws Exception;


	public int insertLOT(Map<String, Object> params)throws Exception;




}
