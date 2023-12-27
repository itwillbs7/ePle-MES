package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.WarehouseVO;

public interface WarehouseService {
	
	 public List<WarehouseVO> warehouseList(Criteria cri) throws Exception;
	 public int totalWarehouseCount() throws Exception;
	 public List<WarehouseVO> getEmployees() throws Exception;
	 public List<WarehouseVO> SearchEmployees(String manager, String managerName) throws Exception;
	 public void InsertWarehouse(WarehouseVO vo) throws Exception;
	 public void warehouseRemove(String code) throws Exception;
	 
}
