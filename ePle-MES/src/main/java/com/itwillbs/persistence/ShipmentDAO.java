package com.itwillbs.persistence;

import java.util.List;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.RequestVO;

public interface ShipmentDAO {

	List<RequestVO> getShipmentListPage(Criteria cri)throws Exception;

	List<RequestVO> getShipmentListPage(int page) throws Exception;

}
