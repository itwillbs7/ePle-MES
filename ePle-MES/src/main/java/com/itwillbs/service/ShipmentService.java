package com.itwillbs.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.RequestVO;
import com.itwillbs.domain.ShipmentVO;

public interface ShipmentService {
	// 출하 목록 출력
	public List<ShipmentVO> shipmentListpage(Criteria cri)throws Exception;

	public int getTotal() throws Exception;

	public List<ShipmentVO> shipmentList() throws Exception;

	public int dataInsertShipment(ShipmentVO vo) throws Exception;

	public ShipmentVO getinfo(String code) throws Exception;

	//============= add / search 용
	public List<RequestVO> findClient(String client_code, String clientName) throws Exception;

	public List<RequestVO> ClientList() throws Exception;

	public List<RequestVO> ProductList() throws Exception;

	public List<RequestVO> findProduct(String product, String productName) throws Exception;
	
	public List<RequestVO> RequestList() throws Exception;
	
	public List<RequestVO> findRequest(String clientName, String productName)throws Exception;
	//============= add / search 용

	public int updateShipment(ShipmentVO vo, String id) throws Exception;

	public List<ShipmentVO> findShipmentList(ShipmentVO vo) throws Exception;

	public List<ShipmentVO> getinfo(String[] code) throws Exception;

	public int deleteShipment(String[] code) throws Exception;

	// 출하상태변경
	public int changeStatus(String[] code)throws Exception;

	public String getRecentCode(String vocode)throws Exception;

	public List<ShipmentVO> getinfoList(String[] codeArr)throws Exception;

	public List<RequestVO> getinfoRequest(List<String> reqsArr)throws Exception;

	public String getRecentHistory(String vocode)throws Exception;

	public int receiptToClient(String[] code)throws Exception;

	public int actDoneShipment(String[] code)throws Exception;

}
