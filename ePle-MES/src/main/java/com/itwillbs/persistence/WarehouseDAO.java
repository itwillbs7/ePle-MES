package com.itwillbs.persistence;

import java.util.List;

import com.itwillbs.domain.WarehouseVO;

public interface WarehouseDAO {
	
	public List<WarehouseVO> getWarehouseListAll () throws Exception;
	
	
	public void insertWarehouse(WarehouseVO vo) throws Exception;
	
}
