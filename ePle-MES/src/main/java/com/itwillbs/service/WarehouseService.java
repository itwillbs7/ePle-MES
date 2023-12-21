package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.WarehouseVO;

public interface WarehouseService {
	
	 public List<WarehouseVO> warehouseList() throws Exception;
	 
	 public void dataInsertWarehouse(WarehouseVO vo) throws Exception;
	 
}
