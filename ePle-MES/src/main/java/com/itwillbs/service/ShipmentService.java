package com.itwillbs.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.RequestVO;
import com.itwillbs.domain.ShipmentVO;

public interface ShipmentService {
	// 출하 목록 출력
	List<ShipmentVO> shipmentListpage(Criteria cri)throws Exception;

	int getTotal() throws Exception;

	List<ShipmentVO> shipmentList() throws Exception;

	void dataInsertShipment(ShipmentVO vo) throws Exception;

	ShipmentVO getinfo(String code) throws Exception;

	List<RequestVO> findClient(String client_code, String clientName) throws Exception;

	List<RequestVO> ClientList() throws Exception;

	List<RequestVO> ProductList() throws Exception;

	List<RequestVO> findProduct(String product, String productName) throws Exception;

	void updateShipment(ShipmentVO vo, String id) throws Exception;

	List<ShipmentVO> findShipmentList(ShipmentVO vo) throws Exception;

	List<ShipmentVO> getinfo(String[] code) throws Exception;

	void deleteShipment(String[] code) throws Exception;

}
