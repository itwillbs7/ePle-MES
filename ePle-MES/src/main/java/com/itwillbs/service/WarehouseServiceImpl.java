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
	public List<WarehouseVO> outList(Criteria cri, String searchCode, String searchName) throws Exception {
		return wdao.getOutList(cri, searchCode, searchName);
	}
	
	@Override
	public int outListCount(String searchCode, String searchName) throws Exception {
		return wdao.getOutListCount(searchCode, searchName);
	}
	
	
	
	@Override
	public List<WarehouseVO> warehouseList(Criteria cri, String searchCode, String searchName) throws Exception {
		return wdao.getWarehouseList(cri, searchCode, searchName);
	}

	// 모든 창고 수
	@Override
	public int warehouseListCount(String searchCode, String searchName) throws Exception {
		return wdao.getWarehouseCount(searchCode, searchName);
	}
	
	// 사원 검색 팝업 
	@Override
	public List<WarehouseVO> SearchEmployees(Criteria cri, String empCode, String empName) throws Exception {
		return wdao.SearchEmployees(cri, empCode, empName);
	}
	
	// 모든 사원 수
	@Override
	public int employeesListCount(String empCode, String empName) throws Exception {
		return wdao.getEmployeesCount(empCode, empName);
	}
	
	// 창고 삭제
	@Override
	public List<WarehouseVO> delInfo(String[] code_arr) throws Exception {
		return wdao.getDelInfo(code_arr);
	}

	@Override
	public void deleteWarehouse(String[] code_arr) throws Exception {
		wdao.getDeleteWarehouse(code_arr);
	}


	
	
	
	
	
	
	
	@Override
	public void InsertWarehouse(WarehouseVO vo) throws Exception {
		logger.debug("S : InsertWarehouse(WarehouseVO vo) : "+vo);
		wdao.insertWarehouse(vo);
	}

	
	
	
	
	
	
}