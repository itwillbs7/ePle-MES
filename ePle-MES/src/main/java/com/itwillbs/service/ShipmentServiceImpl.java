package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.RequestVO;
import com.itwillbs.persistence.ShipmentDAO;

@Service
public class ShipmentServiceImpl implements ShipmentService {

	
	private static final Logger logger = LoggerFactory.getLogger(ShipmentServiceImpl.class);
	
	@Inject
	private ShipmentDAO sdao;

	@Override
	public List<RequestVO> shipmentListpage(Criteria cri) throws Exception {
		logger.debug("페이징처리하기 "+cri);

		return sdao.getShipmentListPage(cri);
	}
	
	
}
