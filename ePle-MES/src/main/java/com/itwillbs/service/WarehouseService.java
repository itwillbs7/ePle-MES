package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.WarehouseVO;

public interface WarehouseService {
	
	 // 4-39 창고 목록 ~ 4-40 창고 검색 
	 public List<WarehouseVO> warehouseList(Criteria cri, String searchCode, String searchName) throws Exception;
	 
	 // 모든 창고 수
	 public int warehouseListCount(String searchCode, String searchName) throws Exception;

	 // 사원 검색 팝업 
	 public List<WarehouseVO> SearchEmployees(Criteria cri, String empCode, String empName) throws Exception;
	 
	 // 모든 사원 수
	 public int employeesListCount(String empCode, String empName) throws Exception;
	 
	 // 창고 삭제
	 public List<WarehouseVO> delInfo(String[] code_arr)throws Exception;
	 public void deleteWarehouse(String[] code_arr) throws Exception;	 
	 
	 
	 
	 public void InsertWarehouse(WarehouseVO vo) throws Exception;
	 
}
