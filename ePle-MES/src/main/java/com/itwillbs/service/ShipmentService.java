package com.itwillbs.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.RequestVO;

public interface ShipmentService {
	// 출하 목록 출력
	List<RequestVO> shipmentListpage(Criteria cri)throws Exception;

}
