package com.itwillbs.persistence;

import java.util.List;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.RequestVO;
import com.itwillbs.domain.ShipmentVO;

public interface ShipmentDAO {

	public List<ShipmentVO> getShipmentListPage(Criteria cri)throws Exception;

	public List<ShipmentVO> getShipmentListPage(int page) throws Exception;

	public int getShipmentCount() throws Exception;

	public List<ShipmentVO> getShipmentListAll() throws Exception;

	public ShipmentVO getShipmentDetail(String code) throws Exception;

	public int insertShipment(ShipmentVO vo) throws Exception;

	// ================ add / search 용 ========================
	public List<RequestVO> getClientList() throws Exception;

	public List<RequestVO> searchClient(String client_code, String clientName) throws Exception;

	public List<RequestVO> getProductList() throws Exception;

	public List<RequestVO> searchProduct(String product, String productName) throws Exception;
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



}
