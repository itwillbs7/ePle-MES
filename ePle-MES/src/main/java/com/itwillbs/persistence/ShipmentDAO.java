package com.itwillbs.persistence;

import java.util.List;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.RequestVO;
import com.itwillbs.domain.ShipmentVO;

public interface ShipmentDAO {

	public List<ShipmentVO> getShipmentListPage(Criteria cri)throws Exception;

	List<ShipmentVO> getShipmentListPage(int page) throws Exception;

	int getShipmentCount() throws Exception;

	List<ShipmentVO> getShipmentListAll() throws Exception;

	ShipmentVO getShipmentDetail(String code) throws Exception;

	void insertShipment(ShipmentVO vo) throws Exception;

	List<RequestVO> getClientList() throws Exception;

	List<RequestVO> searchClient(String client_code, String clientName) throws Exception;

	List<RequestVO> getProductList() throws Exception;

	List<RequestVO> searchProduct(String product, String productName) throws Exception;

	void shipmentUpdate(ShipmentVO vo, String id) throws Exception;

	List<ShipmentVO> searchShipmentAll(ShipmentVO vo) throws Exception;

	List<ShipmentVO> getShipmentDetail(String[] code) throws Exception;

	void deleteShipment(String[] code) throws Exception;



}
