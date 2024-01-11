package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.RequestVO;

public interface RequestService {
	// 페이징처리
	public List<RequestVO> requestListpage(RequestVO vo, Criteria cri) throws Exception;

	public int getTotal(RequestVO vo) throws Exception;
	// 이거 생산용
	public int getTotal() throws Exception;
	public List<RequestVO> requestListpage(Criteria cri) throws Exception;

	// 수주리스트
	public List<RequestVO> requestList() throws Exception;

	// 수주상세
	public RequestVO getinfo(String code) throws Exception;

	// 수주번호 인덱스 올리기용 코드찾기
	public String getRecentCode(String code) throws Exception;

	// 수주등록
	public int dataInsertRequest(RequestVO vo) throws Exception;

	// 회사검색
	public List<RequestVO> findClient(String client_code, String clientName, Criteria cri) throws Exception;

	// 회사리스트
	public List<RequestVO> ClientList(Criteria cri) throws Exception;

	// 사원리스트
	public List<RequestVO> ManagerList(Criteria cri) throws Exception;

	// 사원검색
	public List<RequestVO> findManager(String manager, String managerName, Criteria cri) throws Exception;

	// 품목리스트
	public List<RequestVO> ProductList(Criteria cri) throws Exception;

	// 품목검색
	public List<RequestVO> findProduct(String product, String productName, Criteria cri) throws Exception;

	// 품목 수정
	public int updateRequest(RequestVO vo, String id) throws Exception;

	// 수주검색
	public List<RequestVO> findRequestList(RequestVO vo, Criteria cri) throws Exception;

	// 삭제용
	public List<RequestVO> getinfo(String[] code) throws Exception;

	// DB삭제용
	public int deleteRequest(String[] code) throws Exception;

	public int getClientTotal() throws Exception;

	public int getClientTotal(String client_code, String clientName) throws Exception;

	public int getManagerTotal() throws Exception;

	public int getManagerTotal(String manager, String managerName) throws Exception;

	public int getProductTotal() throws Exception;

	public int getProductTotal(String product, String productName) throws Exception;


}
