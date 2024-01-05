package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.RequestVO;
import com.itwillbs.domain.ReturnsVO;
import com.itwillbs.domain.ShipmentVO;

public interface ReturnsService {

	public List<ReturnsVO> returnsListpage(Criteria cri)throws Exception;

	public int getTotal()throws Exception;

	public ReturnsVO getinfo(String code)throws Exception;

	public List<ReturnsVO> findReturnsList(ReturnsVO vo)throws Exception;

	public int dataInsertReturns(ReturnsVO vo)throws Exception;

	public int deleteReturns(String[] code)throws Exception;

	public List<ReturnsVO> getinfo(String[] code)throws Exception;

	public int updateReturns(ReturnsVO vo, String id)throws Exception;
	// 폐기처리
	public int disposeReturns(String[] code)throws Exception;
	// 출하정보 가져오기
	public ShipmentVO findShipment(String clientName, String productName)throws Exception;

	public List<ShipmentVO> getShipmentList()throws Exception;

	public ShipmentVO getShipmentList(String code)throws Exception;

}
