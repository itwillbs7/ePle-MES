package com.itwillbs.persistence;

import java.util.List;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.WarehouseVO;

public interface WarehouseDAO {
	
	public List<WarehouseVO> getWarehouseListAll(Criteria cri) throws Exception;
	public int getWarehouseCount() throws Exception;
	
	public void insertWarehouse(WarehouseVO vo) throws Exception;
	public void deleteWarehouse(String code) throws Exception;
}
