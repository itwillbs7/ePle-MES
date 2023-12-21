package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.WarehouseVO;
import com.itwillbs.persistence.WarehouseDAO;

@Service
public class WarehouseServiceImpl implements WarehouseService {
	
	private static final Logger logger = LoggerFactory.getLogger(WarehouseServiceImpl.class);
	
	@Inject
	private WarehouseDAO wdao;

	@Override
	public List<WarehouseVO> warehouseList() throws Exception {
		logger.debug("warehouseList()");
		return wdao.getWarehouseListAll();
	}

	@Override
	public void dataInsertWarehouse(WarehouseVO vo) throws Exception {
		logger.debug("dataInsertWarehouse(WarehouseVO vo) : "+vo);
		wdao.insertWarehouse(vo);
		
	}
	
	
	
	
}