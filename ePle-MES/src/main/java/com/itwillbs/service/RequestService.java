package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.RequestVO;

public interface RequestService {
	 //수주리스트
	 public List<RequestVO> requestList() throws Exception;
	 // 수주상세
	 public RequestVO getinfo(String code)throws Exception;
	 // 수주등록
	 public void dataInsertRequest(RequestVO vo) throws Exception;
	 // 회사검색
	 public List<RequestVO> findClient(String client_code, String clientName)throws Exception;
	 // 회사리스트
	 public List<RequestVO> ClientList() throws Exception;
	 // 사원리스트
	 public List<RequestVO> ManagerList() throws Exception;
	 // 사원검색
	 public List<RequestVO> findManager(String manager, String managerName)throws Exception;
	 // 품목리스트
	 public List<RequestVO> ProductList() throws Exception;
	 // 품목검색
	 public List<RequestVO> findProduct(String product, String productName)throws Exception;

}

