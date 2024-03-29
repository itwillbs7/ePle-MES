package com.itwillbs.persistence;

import java.util.List;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.RequestVO;
import com.itwillbs.domain.ShipmentVO;

public interface RequestDAO {
	// 페이징처리
	public List<RequestVO> getRequestListPage(RequestVO vo, Criteria cri) throws Exception;
	public int getRequestCount(RequestVO vo) throws Exception;
	
	// 이거 생산용
	public List<RequestVO> requestListpage(Criteria cri) throws Exception;
	public int getTotal() throws Exception;

	// 수주리스트
	public List<RequestVO> getRequestListAll() throws Exception;

	// 수주번호찾기
	public String getRecentCode(String code) throws Exception;

	// 수주등록
	public int insertRequest(RequestVO vo) throws Exception;

	// 수주상세보기
	public RequestVO getRequestDetail(String code) throws Exception;

	// 회사리스트
	public List<RequestVO> getClientList(Criteria cri) throws Exception;

	// 회사검색
	public List<RequestVO> searchClient(String client_code, String clientName, Criteria cri) throws Exception;

	// 품목리스트
	public List<RequestVO> getProductList(Criteria cri) throws Exception;

	// 품목검색
	public List<RequestVO> searchProduct(String product, String productName, Criteria cri) throws Exception;

	// 사원리스트
	public List<RequestVO> getManagerList(Criteria cri) throws Exception;

	// 사원검색
	public List<RequestVO> searchManager(String manager, String managerName, Criteria cri) throws Exception;

	// 수주 수정
	public int requestUpdate(RequestVO vo, String id) throws Exception;

	// 수주 검색
	public List<RequestVO> searchRequestAll(RequestVO vo, Criteria cri) throws Exception;

	// 삭제용
	public List<RequestVO> getRequestDetail(String[] code) throws Exception;

	// DB삭제용
	public int deleteRequest(String[] code) throws Exception;

	public int getClientTotal() throws Exception;

	public int getClientTotal(String client_code, String clientName) throws Exception;

	public int getManagerTotal() throws Exception;

	public int getManagerTotal(String manager, String managerName) throws Exception;

	public int getProductTotal() throws Exception;

	public int etProductTotal(String product, String productName) throws Exception;

}
