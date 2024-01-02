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

	public void insertShipment(ShipmentVO vo) throws Exception;

	public List<RequestVO> getClientList() throws Exception;

	public List<RequestVO> searchClient(String client_code, String clientName) throws Exception;

	public List<RequestVO> getProductList() throws Exception;

	public List<RequestVO> searchProduct(String product, String productName) throws Exception;

	public void shipmentUpdate(ShipmentVO vo, String id) throws Exception;

	public List<ShipmentVO> searchShipmentAll(ShipmentVO vo) throws Exception;

	public List<ShipmentVO> getShipmentDetail(String[] code) throws Exception;

	public void deleteShipment(String[] code) throws Exception;



}
