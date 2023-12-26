package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.WarehouseVO;
import com.itwillbs.persistence.WarehouseDAO;

@Service
public class WarehouseServiceImpl implements WarehouseService {
	
	private static final Logger logger = LoggerFactory.getLogger(WarehouseServiceImpl.class);
	
	@Inject
	private WarehouseDAO wdao;

	@Override
	public List<WarehouseVO> warehouseList(Criteria cri) throws Exception {
		logger.debug("warehouseList(Criteria cri)");
		return wdao.getWarehouseListAll(cri);
	}

	@Override
	public int totalWarehouseCount() throws Exception {
		logger.debug(" S : totalBoardCount()  ");
		return wdao.getWarehouseCount();
	}
	
	@Override
	public void InsertWarehouse(WarehouseVO vo) throws Exception {
		logger.debug("InsertWarehouse(WarehouseVO vo) : "+vo);
		wdao.insertWarehouse(vo);
		
	}
	
	@Override
	public void warehouseRemove(String code) throws Exception {
		logger.debug(" S : warehouseRemove(String code) ");
		wdao.deleteWarehouse(code);
	}
	
	
	
	
	
}