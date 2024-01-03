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

	public void dataInsertShipment(ShipmentVO vo) throws Exception;

	public ShipmentVO getinfo(String code) throws Exception;

	//============= add / search 용
	public List<RequestVO> findClient(String client_code, String clientName) throws Exception;

	public List<RequestVO> ClientList() throws Exception;

	public List<RequestVO> ProductList() throws Exception;

	public List<RequestVO> findProduct(String product, String productName) throws Exception;
	
	public List<RequestVO> RequestList() throws Exception;
	
	public List<RequestVO> findRequest(String clientName, String productName)throws Exception;
	//============= add / search 용

	public void updateShipment(ShipmentVO vo, String id) throws Exception;

	public List<ShipmentVO> findShipmentList(ShipmentVO vo) throws Exception;

	public List<ShipmentVO> getinfo(String[] code) throws Exception;

	public void deleteShipment(String[] code) throws Exception;

}
